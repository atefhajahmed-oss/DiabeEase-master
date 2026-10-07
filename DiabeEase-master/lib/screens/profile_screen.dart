import 'package:flutter/material.dart';
import 'package:ocotomiro/providers/userProvider.dart';
import 'package:ocotomiro/screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   void _generatePdf(BuildContext context) async {
    final pdf = pw.Document();

    var userProvider = Provider.of<UserProvider>(context, listen: false);

    pdf.addPage(
      pw.Page(
      build: (pw.Context context) {
        return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Profile Information', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 20),
          pw.Text('Name: ${userProvider.userName}', style: pw.TextStyle(fontSize: 18)),
          pw.Text('Email: ${userProvider.userEmail}', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 20),
          pw.Text('Date de naissance: ${userProvider.userbday}', style: pw.TextStyle(fontSize: 18)),
          pw.Text('Sexe: ${userProvider.usersex}', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 20),
          pw.Text('Adresse: ${userProvider.useradresse}', style: pw.TextStyle(fontSize: 18)),
          pw.Text('Numéro de sécurité sociale: ${userProvider.usernss}', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 20),
          pw.Text('Contact d\'urgence: ${userProvider.usercu}', style: pw.TextStyle(fontSize: 18)),
          pw.Text('Allergies: ${userProvider.userallergies}', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 20),
          pw.Text('Symptômes actuels: ${userProvider.usersa}', style: pw.TextStyle(fontSize: 18)),
          pw.Text('Maladies chroniques: ${userProvider.usermc}', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 20),
          pw.Text('Antécédents familiaux: ${userProvider.userp}', style: pw.TextStyle(fontSize: 18)),
          pw.Text('Vaccinations reçues: ${userProvider.useraf}', style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 20),
          pw.Text('Nom de médicament: ${userProvider.uservr}', style: pw.TextStyle(fontSize: 18)),
          pw.Text('Dosage: ${userProvider.usernm}', style: pw.TextStyle(fontSize: 18)),
          pw.Text('Frequence par jour: ${userProvider.userFrequence}', style: pw.TextStyle(fontSize: 18)),
        ],
        );
      },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
    }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(186, 0, 21, 210),
                fontFamily: "Poppins",
                fontSize: 19)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 50),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 30,
              child: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 15),
          Text(userProvider.userName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color.fromARGB(187, 0, 0, 0),
                  fontFamily: "Poppins")),
          Text(userProvider.userEmail,
              style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(187, 0, 0, 0),
                  fontFamily: "Poppins")),
          SizedBox(height: 50),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Date de naissance",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.userbday,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Sexe",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.usersex,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Adresse",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.useradresse,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Numéro de sécurité sociale",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.usernss,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Contact d'urgence",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.usercu,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Allergies",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.userallergies,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Symptômes actuels",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.usersa,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Maladies chroniques",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.usermc,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Antécédents familiaux",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.userp,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Vaccinations reçues",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.useraf,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Nom de médicament",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.uservr,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Dosage",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.usernm,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
          
          
        
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("frequence par jour",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userProvider.userFrequence,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(187, 0, 0, 0),
                      fontFamily: "Poppins")),
            ],
          ),
                  
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              SizedBox(width: 7),
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return EditProfileScreen();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(186, 0, 21, 210),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text("Edit Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)
                            )
                          )
                    ),
                    SizedBox(width: 5),
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _generatePdf(context);
                  },
                  style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(186, 0, 21, 210),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    "Generate PDF",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
            
          ),
        ]),
      ),
      
    );
  }
}
