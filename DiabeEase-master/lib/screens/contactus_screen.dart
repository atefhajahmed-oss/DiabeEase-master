import 'package:flutter/material.dart';

class ContactusScreen extends StatefulWidget {
  const ContactusScreen({super.key});

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTACTER NOUS', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(187, 64, 224, 208),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adresse email par défaut avec icône
            _contactRow(Icons.email, "contact@societe.com"),
            SizedBox(height: 20),

            // Numéro de téléphone avec icône
            _contactRow(Icons.phone, "+216 123 456 789"),
            SizedBox(height: 30),

            // Ligne de séparation
            Divider(color: Colors.black38, thickness: 1),

            // Texte "Contacter nous" en gras et souligné, avec un effet de clic
            _contactUsButton(context),
          ],
        ),
      ),
    );
  }

  // Méthode pour créer les lignes avec icônes
  Widget _contactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color.fromARGB(187, 64, 224, 208), size: 24),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }

  // Bouton "Contacter nous"
  Widget _contactUsButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactPage()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Contacter nous",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactez-nous', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(187, 64, 224, 208),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[200], // Fond gris clair
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nous contacter",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(187, 64, 224, 208)),
              ),
              SizedBox(height: 8),
              Text(
                "Nous serions ravis de vous aider ! Veuillez remplir le formulaire ci-dessous.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 24),

              _buildTextField(nameController, "Nom", Icons.person),
              SizedBox(height: 16),
              _buildTextField(emailController, "Email", Icons.email),
              SizedBox(height: 16),
              _buildTextField(messageController, "Message", Icons.message,
                  maxLines: 5),
              SizedBox(height: 24),

              // Bouton Envoyer
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String email = emailController.text.trim();
                    String message = messageController.text.trim();

                    if (name.isEmpty || email.isEmpty || message.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("Veuillez remplir tous les champs")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Message envoyé avec succès!")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(187, 64, 224, 208),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text(
                    "Envoyer",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode pour créer les champs de texte
  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: const Color.fromARGB(187, 64, 224, 208)),
        prefixIcon: Icon(icon, color: const Color.fromARGB(187, 64, 224, 208)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromARGB(187, 64, 224, 208)),
        ),
      ),
    );
  }
}
