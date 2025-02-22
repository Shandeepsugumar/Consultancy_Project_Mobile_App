import 'package:flutter/material.dart';
import 'package:ssm/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

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
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF00008B),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(cameras: cameras)));


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

class SecondPage extends StatelessWidget {
  final List<CameraDescription> cameras;

  SecondPage({required this.cameras, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/registeration.png', height: 150),
            const SizedBox(height: 10),
            Text(
              "Sign UP",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Welcome To the SSM. Please Sign Up To Continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ..._buildTextFields(),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF00008B),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage(cameras: cameras)),
                );
              },
              child: const Text("NEXT", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  /// Generates the input fields dynamically
  List<Widget> _buildTextFields() {
    final List<String> fields = [
      "Native",
      "Religion",
      "Cast",
      "Email ID",
      "Emergency Contact No",
      "Blood Group",
      "Father Name",
      "Mobile Number",
      "Mother Name",
      "Spouse Name",
    ];

    return fields.map((hint) => _buildTextField(hint)).toList();
  }

  /// Reusable TextField widget
  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final List<CameraDescription> cameras;

  ThirdPage({required this.cameras});

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

  void _showUploadDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showImageSourceDialog(context);
              },
              child: Text("Upload"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose an option"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CameraPage(cameras: cameras)),
                );
              },
              child: Text("Take Photo"),
            ),
            TextButton(
              onPressed: () async {
                final pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  print("Gallery Image Path: ${pickedFile.path}");
                }
                Navigator.pop(context);
              },
              child: Text("Choose from Gallery"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
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
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
          SizedBox(height: 10),
          Text(
              "Welcome To the SSM Please Sign Up To Continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 20),
          _buildTextField("Aadhar Number (Optional)"),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _showUploadDialog(context, "Photo"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("Aadhar Card Photo",
                style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _showUploadDialog(context, "Signature Verification"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("Signature Verification",
                style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
          SizedBox(height: 20),
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
              foregroundColor: Colors.white, backgroundColor: Color(0xFF00008B),
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
            child: Text("SUBMIT",
                style: TextStyle(color: Colors.white, fontSize: 16)),
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
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraPage({required this.cameras});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture(BuildContext context) async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      print("Captured Image Path: ${image.path}");
      Navigator.pop(context, image);
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Take a Photo")),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _takePicture(context),
        child: Icon(Icons.camera),
      ),
    );
  }
}

