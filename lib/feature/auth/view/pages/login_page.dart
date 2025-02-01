import 'package:flutter/material.dart';
import 'package:zoom_clone/feature/homePage/view/widgets/custom_button.dart';
import 'package:zoom_clone/core/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final AuthServices _authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
              text: 'Google Sign In',
              onPressed: () async {
                bool result = await _authServices.signInWithGoogle(context);
                if (result && context.mounted) {
                  Navigator.pushNamed(context, '/home');
                }
              }),
        ],
      ),
    );
  }
}
