import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssm/signup_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar( // Wrap SingleChildScrollView with Scrollbar
        thumbVisibility: true, // Makes the scrollbar thumb visible
        child: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(height: 50), // Add some space
    Image.asset(
    'assets/login_page.webp', // Replace with your login image
    height: 150,
    ),
              SizedBox(height: 50),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome To the SSM Please Login To Continue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'UserName or Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: Text('LOGIN',style: TextStyle(color: Colors.white,),),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Handle forgot password logic
                },
                child: Text(
                  'Forget Password',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
