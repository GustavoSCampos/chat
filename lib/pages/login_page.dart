import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {

  // text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // tap to register
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // Login Method
  void login(BuildContext context) async {

    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 50),
          Text(
            "Welcome back, you've been missed!",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
          fontSize: 16),
          ),
          const SizedBox(height: 25),
          MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
          ),
          const SizedBox(height: 10),
           MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
           ),
          const SizedBox(height: 40),
          MyButton(text: 'Login', onTap: () => login(context)),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              const SizedBox(width: 3),
              GestureDetector(
                onTap: onTap,
                child: Text("Register now"),
              )
            ],
          )
        ],
      ),
    );
  }
}
