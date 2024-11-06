import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {

  // text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to register
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get Auth service
    final _auth = AuthService();

    // password match --> create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text,
            _pwController.text
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            )
        );
      }
    }

    // password don't match --> tell user to fix
    else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Password don't match")
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
            "Hello there. Let's create an account for you",
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
          const SizedBox(height: 10),
          MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPwController
          ),
          const SizedBox(height: 40),
          MyButton(text: 'Register', onTap: () => register(context)),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already a member?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              const SizedBox(width: 3),
              GestureDetector(
                onTap: onTap,
                child: const Text("Login now"),
              )
            ],
          )
        ],
      ),
    );
  }
}
