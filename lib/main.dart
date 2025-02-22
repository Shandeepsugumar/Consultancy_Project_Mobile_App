import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'loginpage.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // ✅ Initialize background location tracking service
    initializeService();

    // ✅ Navigate to LoginPage after 5 seconds
    Timer(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  // ✅ Initialize and start the background location tracking service
  Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,  // ✅ Function to execute in the background
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId: 'background_service',
        initialNotificationTitle: 'Tracking Active',
        initialNotificationContent: 'Updating location in the background',
      ),
      iosConfiguration: IosConfiguration(
        onForeground: onStart,
        autoStart: true,
      ),
    );

    service.startService();
  }

  // ✅ Function to run in the background for tracking user location
  void onStart(ServiceInstance service) async {
    if (service is AndroidServiceInstance) {
      service.on('stopService').listen((event) {
        service.stopSelf();
      });
    }

    while (true) {
      await Future.delayed(Duration(seconds: 30)); // Adjust interval if needed

      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        await FirebaseFirestore.instance.collection('user_locations').doc('user123').set({
          'latitude': position.latitude,
          'longitude': position.longitude,
          'timestamp': DateTime.now(),
        });

        service.invoke('update');
      } catch (e) {
        print("Error fetching location: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 250,  // Ensured correct size
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Powered by SSM',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
