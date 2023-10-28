import 'package:flutter/material.dart';
import 'login/loginpages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const BikeRental());
}

class BikeRental extends StatelessWidget {
  const BikeRental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bike Rental",
      theme: ThemeData.light(),
      home: const LoginPage(),
    );
  }
}
