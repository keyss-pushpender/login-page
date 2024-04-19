import 'package:flutter/material.dart';
import 'package:login_page/commonWidgets/custom_text_form_field.dart';
import 'package:login_page/commonWidgets/utils.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                constraints: const BoxConstraints(maxWidth: 400.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      vGap(),
                      CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter full name';
                          }
                          return null;
                        },
                        labelText: 'Full name',
                      ),
                      vGap(),
                      CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        labelText: 'Email',
                      ),
                      vGap(),
                      CustomTextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        labelText: 'Password',
                      ),
                      vGap(),
                      CustomTextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Please enter Confirm Password';
                          } else if(value != passwordController.text) {
                            return "Password and confirm Password should be same";
                          }
                          return null;
                        },
                        labelText: 'Confirm Password',
                      ),
                      vGap(),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Create Account'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
