import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Glucose extends StatefulWidget {
  const Glucose({super.key});

  @override
  State<Glucose> createState() => _GlucoseState();
}

class _GlucoseState extends State<Glucose> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GlucosePrediction(),
    );
  }
}

class GlucosePrediction extends StatefulWidget {
  @override
  _GlucosePredictionState createState() => _GlucosePredictionState();
}

class _GlucosePredictionState extends State<GlucosePrediction> {
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController insulinController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String? predictionResult;

  Future<void> getPrediction() async {
    try {
      // Vérifier que tous les champs sont remplis
      final bloodPressure = bloodPressureController.text;
      final insulin = insulinController.text;
      final bmi = bmiController.text;
      final age = ageController.text;

      if (bloodPressure.isEmpty ||
          insulin.isEmpty ||
          bmi.isEmpty ||
          age.isEmpty) {
        setState(() {
          predictionResult = 'Please fill in all fields.';
        });
        return;
      }

      // Préparer les données pour l'API
      final url = Uri.parse('http://10.0.2.2:5000/predict'); // URL du serveur
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'blood_pressure': bloodPressure,
          'insulin': insulin,
          'bmi': bmi,
          'age': age,
        }),
      );

      // Traiter la réponse de l'API
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          predictionResult =
              'Predicted Glucose Level: ${data['predicted_glucose']}';
        });
      } else {
        setState(() {
          predictionResult = 'Error: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        predictionResult = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Glucose Prediction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: bloodPressureController,
              decoration: InputDecoration(labelText: 'Blood Pressure'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: insulinController,
              decoration: InputDecoration(labelText: 'Insulin'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: bmiController,
              decoration: InputDecoration(labelText: 'BMI'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: getPrediction,
              child: Text('Get Prediction'),
            ),
            SizedBox(height: 16),
            if (predictionResult != null)
              Text(predictionResult!, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}



