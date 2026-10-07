import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocotomiro/providers/userProvider.dart';
import 'package:ocotomiro/screens/aboutus_screen.dart';
import 'package:ocotomiro/screens/chatbot_screen.dart';
import 'package:ocotomiro/screens/contactus_screen.dart';
import 'package:ocotomiro/screens/foodscanner_screen.dart';
import 'package:ocotomiro/screens/glucose.dart';
import 'package:ocotomiro/screens/notification_screen.dart';
import 'package:ocotomiro/screens/DietAdvices.dart';
import 'package:ocotomiro/screens/profile_screen.dart';
import 'package:ocotomiro/screens/search_screen.dart';
import 'package:ocotomiro/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1; // Default to "Home" in the center

  @override
  void initState() {
    super.initState();
    
  }

  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation
    if (index == 0) {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => FoodscannerScreen()),
          (Route<dynamic> route) => false,);
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (index == 2) {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => ChatbotScreen()),
          (Route<dynamic> route) => false,); 
    }
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Bonjour ' + userProvider.userName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 19),
        ),
        leading: InkWell(
          onTap: () {
            scaffoldkey.currentState!.openDrawer();
          },
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu, color: Colors.white)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text(userProvider.userName,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(userProvider.userEmail),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('A Propos Nous', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AboutusScreen();
                  }
                  )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.support_agent),
              title: Text('Contacter Nous', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ContactusScreen();
                  }
                  )
                );
              },
            ),
            
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SplashScreen();
                  }),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DietAdvices()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.health_and_safety, color: Colors.black, size: 28),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "L'état de régime ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Votre état de régime est bon",
                            style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.black, size: 28),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Image.asset(
              'assets/images/courbe1.png',
              width: 350,
              height: 170,
              
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Glucose()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.insights, color: Colors.black, size: 28),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "glucose prediction ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.black, size: 28),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Image.asset(
              'assets/images/courbe2.png',
              width: 350,
              height: 100,
              
            ),
            SizedBox(height: 5),
            Image.asset(
              'assets/images/courbe3.png',
              width: 350,
              height: 100,
              
            ),
            SizedBox(height: 5),
            Image.asset(
              'assets/images/courbe4.png',
              width: 350,
              height: 100,
              
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DietAdvices()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.insights, color: Colors.black, size: 28),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "carbs prediction ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.black, size: 28),
                  ],
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SearchScreen()),
                  );
                },
                child: const BookAppointmentButton(),
              ),
            ),
        
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, color: Colors.grey),
            activeIcon: Icon(Icons.camera, color: Colors.black),
            label: 'foodscanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.grey, size: 30),
            activeIcon: Icon(Icons.home, color: Colors.black, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_outlined, color: Colors.grey),
            activeIcon: Icon(Icons.smart_toy, color: Colors.black),
            label: 'ChatBot',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Button Widget
class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              'assets/images/doctors.png',
              width: 220,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.search, color: Colors.white, size: 24),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Connectez-vous avec un docteur",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Trouvez un de nos docteurs près de chez vous pour un rendez-vous ou ",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
              
              
            ),
            
          ),
        ],
      ),
    );
  }
}



