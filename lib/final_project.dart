import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FinalProject extends StatelessWidget {
  const FinalProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Final project"),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Add an app",
          style: TextStyle(color: Colors.red, fontSize: 25),
        ),
      ),
    );
  }
}
