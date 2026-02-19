import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Controller/CustomLogo.dart';
import '../Controller/elevatedbtn.dart';
import '../Controller/TextFeild.dart';
import 'Login.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});
  @override
  State<Forgetpassword> createState() => _Forgetpassword();
}
class _Forgetpassword extends State<Forgetpassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 80),
                      Customlogo(),
                      Textfeild(hint: 'Email', controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {return 'Email is required';}
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'Enter a valid email (must contain @)';
                          }
                          return null;
                        },
                      ),
                      Elevatedbtn(labelText: 'Send verification Email', btnColor: Colors.lightBlueAccent,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(
                                    'Reset email send to ${emailController.text}'
                                ),
                                  backgroundColor: Colors.green,
                                )
                            );
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                builder: (_) => Login(),
                              ),
                            );
                          }
                        },
                      ),
                    ]
                ),
              ),
            )
        )
    );
  }
}
