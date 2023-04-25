import 'package:flutter/material.dart';

import '../services/app_strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const id = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.register)),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Insert email'),
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
              child: const Text(AppStrings.register),
            ),
          ],
        ),
      ),
    );
  }
}
