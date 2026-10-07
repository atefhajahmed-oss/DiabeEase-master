import 'package:flutter/material.dart';
import 'package:ocotomiro/controllers/signup_controller.dart';
// import 'package:ocotomiro/screens/login_screen.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => __SingupScreenState();
}

class __SingupScreenState extends State<SignupScreen> {
  var userForm = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController bday = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController nss = TextEditingController();
  TextEditingController cu = TextEditingController();
  TextEditingController allergies = TextEditingController();
  TextEditingController sa = TextEditingController();
  TextEditingController mc = TextEditingController();
  TextEditingController cp = TextEditingController();
  TextEditingController af = TextEditingController();
  TextEditingController vr = TextEditingController();
  TextEditingController nm = TextEditingController();
  TextEditingController dosage = TextEditingController();
  TextEditingController Frequence = TextEditingController();

  
  // bool isPatient = true; // Par défaut, patient sélectionné
  // final ImagePicker _picker = ImagePicker();
  // File? _imageFile;



  // void _showImageSourceDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text("Choisir une source"),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               _pickImage(ImageSource.camera); // Choisir la caméra
  //               Navigator.pop(context);
  //             },
  //             child: const Text("Caméra"),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               _pickImage(ImageSource.gallery); // Choisir la galerie
  //               Navigator.pop(context);
  //             },
  //             child: const Text("Galerie"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // // Fonction pour prendre ou sélectionner une image
  // Future<void> _pickImage(ImageSource source) async {
  //   final XFile? pickedFile = await _picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: userForm,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        
                        
                        // GestureDetector(
                        //   onTap: _showImageSourceDialog,
                        //   child: CircleAvatar(
                        //     radius: 50,
                        //     backgroundColor: Colors.grey[200],
                        //     child: _imageFile != null
                        //         ? ClipRRect(
                        //             borderRadius: BorderRadius.circular(50),
                        //             child: Image.file(
                        //               _imageFile!,
                        //               width: 100,
                        //               height: 100,
                        //               fit: BoxFit.cover,
                        //             ),
                        //           )
                        //         : const Icon(
                        //             Icons.camera_alt,
                        //             size: 50,
                        //             color: Colors.grey,
                        //           ),
                        //   ),
                        // ),
                        SizedBox(height: 10),
                    const Text(
                      "Ajouter votre photo",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    SizedBox(height: 30,),
                    Text("1. Informations personnelles",style: TextStyle(color: Colors.blue, fontSize: 16),),
                        CustomTextField(
                          controller: fullname,
                          hintText: "Nom complet",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: phone,
                          hintText: "Numéro de téléphone",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: email,
                          hintText: "Email",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: Password,
                          hintText: "Mot de passe",
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: Password,
                          hintText: "Password confirmation",
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20,),
                        CustomTextField(
                          controller: bday,
                          hintText: "Date de naissance",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: sex,
                          hintText: "sexe",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: adresse,
                          hintText: "adresse",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: nss,
                          hintText: "Numéro de sécurité sociale",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: cu,
                          hintText: "Contact d’urgence",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        Text("2. Informations sur l'état de santé actuel:",style: TextStyle(color: Colors.blue, fontSize: 16),),
                        Text("(écrire null s'il n'y en a pas)",style: TextStyle(color: Colors.blue, fontSize: 10),),
                        
                        CustomTextField(
                          controller: allergies,
                          hintText: " Allergies",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: sa,
                          hintText: "Symptômes actuels",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        Text("3. Antécédents médicaux :",style: TextStyle(color: Colors.blue, fontSize: 16),),
                        Text("(écrire null s'il n'y en a pas)",style: TextStyle(color: Colors.blue, fontSize: 10),),
                        
                        CustomTextField(
                          controller: mc,
                          hintText: " Maladies chroniques",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: cp,
                          hintText: "Chirurgies passées",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        
                        CustomTextField(
                          controller: af,
                          hintText: "Antécédents familiaux",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: vr,
                          hintText: "Vaccinations reçues",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        Text("4. Médicaments actuels:",style: TextStyle(color: Colors.blue, fontSize: 16),),
                        Text("(écrire null s'il n'y en a pas)",style: TextStyle(color: Colors.blue, fontSize: 10),),
                        
                        CustomTextField(
                          controller: nm,
                          hintText: "nom de médicament",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: dosage,
                          hintText: "Dosage",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: Frequence,
                          hintText: "Fréquence",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        
                        
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(onPressed: (){
                            if(userForm.currentState!.validate()){
                              //register user
                              SignupController.createAccount(context,email.text,Password.text,fullname.text,phone.text,bday.text,sex.text,adresse.text,nss.text,cu.text,allergies.text,sa.text,mc.text,cp.text,af.text,vr.text,nm.text,dosage.text,Frequence.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(186, 0, 21, 210), // Set the background color to green
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              )
                            ),
                           child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                        ),
                         SizedBox(height: 20,),
                        
                       
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextEditingController controller;

  CustomTextField({required this.controller,required this.hintText,required this.obscureText,required this.enableSuggestions,required this .autocorrect});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    controller: controller,
        validator: (value){
                  if(value!.isEmpty){
                    return hintText + " is required";
                  }
                  else if(hintText == "Email" && !value.contains("@")) 
                  {
                    return "Invalid email";
                  }
                  else if (hintText == "Password" && value.length < 6)
                  {
                    return "Password must be at least 6 characters";
                  }
                   else if (hintText == "Phone Number" && !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Phone Number must contain only digits";
                  }
                  else if (hintText == "Phone Number" && value.length < 8) {
                    return "Phone Number must be at least 8 digits";
                  }
                  // else if (hintText == "Password confirmation" && value != userForm.currentState?.fields['Password']?.value) {
                  //   return "Passwords do not match";
                  // }

                  return null;
                },
                obscureText: obscureText,
                enableSuggestions: enableSuggestions,
                autocorrect: autocorrect,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Color(0xFFEFEFF4),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
