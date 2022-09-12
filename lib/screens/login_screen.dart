// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';
import 'package:flutter_instagram_clone/resources/auth_methods.dart';
import 'package:flutter_instagram_clone/screens/home_screen.dart';
import 'package:flutter_instagram_clone/screens/signup_screen.dart';
import 'package:flutter_instagram_clone/utils/utils.dart';
import 'package:flutter_instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void login() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == 'success') {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text('Copygram', style: Constants().logoStyle),
                ),
                Text(
                  'Log In to See Photos and Videos From',
                  style: Constants().loginStyle,
                ),
                Text(
                  'Your Friends',
                  style: Constants().loginStyle,
                ),
                const SizedBox(height: 60),
                TextFieldInput(
                  textController: _emailController,
                  isPass: false,
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextFieldInput(
                    textController: _passwordController,
                    isPass: true,
                    hintText: 'Password',
                    inputType: TextInputType.text),
                TextButton(
                  onPressed: login,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'Log In',
                          style: Constants().textButtonStyle,
                        ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ));
                  },
                  child: Text(
                    'Don\'t Have an Account? Sign Up',
                    style: Constants().textButtonStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
