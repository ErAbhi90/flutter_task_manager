import 'package:flutter/material.dart';

import '../screens/forgot_password_screen.dart';
import '../screens/register_screen.dart';
import '../services/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.login)),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: AppStrings.insertEmailLabel),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.emailError;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: AppStrings.insertPasswordLabel),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.passwordError;
                    } else if (value.length < 6) {
                      return AppStrings.passwordMinError;
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                },
                child: const Text(AppStrings.login),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegisterScreen.id);
                  },
                  child: const Text(AppStrings.accountNotAvailable)),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ForgotPasswordScreen.id);
                  },
                  child: const Text(AppStrings.forgotPassword)),
            ],
          ),
        ),
      ),
    );
  }
}
