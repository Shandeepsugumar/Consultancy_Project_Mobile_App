import 'package:flutter/material.dart';
import 'signup_second_page.dart';

class FirstPage extends StatelessWidget {
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
          _buildTextField("Name"),
          _buildTextField("Education Qualification"),
          _buildTextField("Experience"),
          Row(
            children: [
              Expanded(child: _buildTextField("DOB")),
              SizedBox(width: 8),
              Expanded(child: _buildTextField("AGE")),
            ],
          ),
          _buildGenderSelection(),
          _buildTextField("Permanent Address"),
          Row(
            children: [
              Expanded(child: _buildTextField("District")),
              SizedBox(width: 8),
              Expanded(child: _buildTextField("State")),
            ],
          ),
          _buildTextField("Mobile Number"),
          _buildTextField("Alternative Mobile Number"),
          _buildTextField("WhatsApp Number"),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color(0xFF00008B), // Set the color of text/icon on the button
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 16)),
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

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        RadioListTile(value: "Male", groupValue: "Gender", onChanged: (value) {}, title: Text("Male")),
        RadioListTile(value: "Female", groupValue: "Gender", onChanged: (value) {}, title: Text("Female")),
        RadioListTile(value: "Other", groupValue: "Gender", onChanged: (value) {}, title: Text("Other")),
      ],
    );
  }
}
