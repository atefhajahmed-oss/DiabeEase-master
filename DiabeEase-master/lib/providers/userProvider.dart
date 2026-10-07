import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {


  String userName = '';
  String userEmail = '';
  String userPhone = '';
  String userId = '';
  String userbday = '';
  String usersex = '';
  String useradresse = '';
  String usernss = '';
  String usercu = '';
  String userallergies = '';
  String usersa = '';
  String usermc = '';
  String userp = '';
  String useraf = '';
  String uservr = '';
  String usernm = '';
  String userdose = '';
  String userFrequence = '';

    void getData(){
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((dataSnapshot){
      userName = dataSnapshot.data()?['fullName'] ?? '';
      userEmail = dataSnapshot.data()?['email'] ?? '';
      userPhone = dataSnapshot.data()?['phoneNumber'] ?? '';
      userbday = dataSnapshot.data()?['bday'] ?? '';
      usersex = dataSnapshot.data()?['sex'] ?? '';
      useradresse = dataSnapshot.data()?['adresse'] ?? '';
      usernss = dataSnapshot.data()?['num de sécurité sociale'] ?? '';
      usercu = dataSnapshot.data()?['contact d urgence'] ?? '';
      userallergies = dataSnapshot.data()?['allergies'] ?? '';
      usersa = dataSnapshot.data()?['symptomes actuels'] ?? '';
      usermc = dataSnapshot.data()?['maladies chroniques'] ?? '';
      userp = dataSnapshot.data()?['antécédents familiaux'] ?? '';
      useraf = dataSnapshot.data()?['vaccination recues'] ?? '';
      uservr = dataSnapshot.data()?['nom de médicament'] ?? '';
      usernm = dataSnapshot.data()?['dosage'] ?? '';
      userFrequence = dataSnapshot.data()?['frequence'] ?? '';

      userId = FirebaseAuth.instance.currentUser!.uid;
      notifyListeners();
    });
    
  } 

  }
  
