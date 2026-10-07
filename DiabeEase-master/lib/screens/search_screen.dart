import 'package:flutter/material.dart';
import 'package:ocotomiro/screens/doctor_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recherche de Docteurs"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorScreen()),
                );
              },
              child: Image.asset(
                'assets/images/map.png',
                width: 400,
                height: 670,
                fit: BoxFit.cover,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}