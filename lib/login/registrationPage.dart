import 'package:bike_rental/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:bike_rental/login/loginpages.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber[50],
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomInputField(
                hintText: "Enter Email",
                isPassword: false,
                labelText: "Email",
                icon: Icons.email_rounded,
              ),
              const CustomInputField(
                hintText: "Enter Password",
                isPassword: true,
                labelText: "Password",
                icon: Icons.password_rounded,
              ),
              const CustomInputField(
                hintText: "Confirm Password",
                isPassword: true,
                labelText: "Confirm Password",
                icon: Icons.password_rounded,
              ),
              const CustomSubmitButton(),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("Sign in with", style: TextStyle(fontSize: 15),),
              ),
              GoogleSignInButton(
                googleOnTap: () => AuthService().signInWithGoogle(),
                appleOnTap: () => AuthService().signInWithGoogle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}