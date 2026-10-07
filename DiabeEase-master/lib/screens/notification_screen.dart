import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Color _containerColor = const Color.fromARGB(255, 253, 2, 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Notifications", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          GestureDetector(
                onTap: () {
                setState(() {
                  // Change the background color to green on tap
                    _containerColor = Colors.green;
                  });
                },
              child: Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: _containerColor,
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
                    Icon(Icons.vaccines, color: Colors.white, size: 28),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( 
                            "Demande de validation de dose",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          
                        ],
                      ),
                    ),
                    Icon(Icons.check, color: Colors.white, size: 28),
                  ],
                ),
              ),
            ),
        ],
        
      )
    );
  }
}