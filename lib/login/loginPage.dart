import 'package:bike_rental/login/loginpages.dart';
import 'package:bike_rental/services/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bike_rental/home/homepages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
              const CustomSubmitButton(),
              const SizedBox(
                height: 15,
              ),
              const ClickableText(),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Sign in with",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              GoogleSignInButton(
                googleOnTap: () async {
                  User? user = await AuthService().signInWithGoogle();
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage())
                    );
                  }
                },
                appleOnTap: () => AuthService().signInWithGoogle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final String labelText;
  final IconData icon;

  const CustomInputField(
      {super.key,
      required this.hintText,
      required this.isPassword,
      required this.labelText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: TextField(
          obscureText: isPassword,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                icon,
                size: 20,
              ),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 15, color: Colors.black),
            labelText: labelText,
            labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 70),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: const Center(
              child: Text("Submit"),
            )),
      ),
    );
  }
}

class ClickableText extends StatelessWidget {
  const ClickableText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 17),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistrationPage()));
          },
          child: const Text(
            "Sign up.",
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ),
        )
      ],
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  final Function()? googleOnTap;
  final Function()? appleOnTap;
  const GoogleSignInButton(
      {super.key, required this.googleOnTap, required this.appleOnTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: googleOnTap,
            child: Container(
              child: Image.network(
                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          GestureDetector(
            onTap: appleOnTap,
            child: Container(
              child: Image.asset(
                'assets/images/apple.png',
                fit: BoxFit.cover,
                height: 65,
              ),
            ),
          )
        ],
      ),
    );
  }
}
