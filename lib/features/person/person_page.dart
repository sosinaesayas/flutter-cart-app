import 'package:cart_app/features/person/login/ui/login.dart';
import 'package:cart_app/features/person/signup/ui/form.dart';
import 'package:flutter/material.dart';


class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SignUpForm(), // Display the signup form
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to the login page
                    );
                  },
                  child: Text('Login here'), // Link to login page
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
