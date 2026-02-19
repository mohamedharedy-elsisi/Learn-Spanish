import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Controller/CustomLogo.dart';
import '../Controller/elevatedbtn.dart';
import '../Controller/OrDivider.dart';
import '../Controller/TextFeild.dart';
import '../Screen/Home.dart';
import 'ForgetPassword.dart';
import 'Register.dart';

class Login extends StatefulWidget {

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 80),
              Customlogo(Height: 40),
              Textfeild(hint: 'Email', controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {return 'Email is required';}
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Enter a valid email (must be contain @)';
                  }
                  return null;
                },
              ),
              Textfeild(hint: 'Password', controller: passController, isObsecure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {return 'Password is required';}
                  if (value.length < 6) {return 'Password must be at least 6 characters';}
                  return null;
                },
                sizeBox: 70,
              ),
              Elevatedbtn(labelText: 'Login', btnColor: Colors.lightBlueAccent,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (_) => Home(),
                      ),
                    );
                  }
                },
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (_) => Forgetpassword(),
                      ),
                    );
                  },
                  child: Text('Forgotten your password?',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 14,),
                  ),
                ),
              ),
              SizedBox(height: 20),
              OrDivider(),
              SizedBox(height: 20,),
              Elevatedbtn(labelText: 'Create Account', btnColor: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (_) => Register(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )) ,
    );
  }
}
