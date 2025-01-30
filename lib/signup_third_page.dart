import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildSignUpPage(context),
    );
  }

  Widget _buildSignUpPage(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/registeration.png', height: 150),
          Text(
            "Sign UP",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue[900]),
          ),
          SizedBox(height: 10),
          Text("Welcome To the SSM Please Sign Up To Continue",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 20),
          _buildTextField("Aadhar Number (Optional)"),
          _buildTextField("Photo"),
          _buildTextField("Signature Verification"),
          _buildTextField("PAN Number (Optional)"),
          _buildTextField("EPF/UAN Number"),
          _buildTextField("ESI/IP Number"),
          _buildTextField("Bank Name"),
          _buildTextField("Account Holder Name"),
          _buildTextField("Account Number"),
          _buildTextField("IFSC Code"),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color(0xFF00008B), // Set the color of text/icon on the button
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Sign Up Completed"),
                  content: Text("Your information has been submitted successfully!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            },
            child: Text("SUBMIT", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
