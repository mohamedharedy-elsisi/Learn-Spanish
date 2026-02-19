import 'package:flutter/material.dart';
import 'package:learnspanish/Controller/checkBox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/CustomLogo.dart';
import '../Controller/elevatedbtn.dart';
import '../Controller/elevatedbtn.dart';
import '../Controller/OrDivider.dart';
import '../Controller/TextFeild.dart';
import '../Screen/Home.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool remember_me = false;

  bool isHidden=true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  Future<void> loadRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      remember_me = prefs.getBool('remember_me') ?? false;
      if (remember_me) {
        nameController.text = prefs.getString('name') ?? '';
        emailController.text = prefs.getString('email') ?? '';
        passController.text = prefs.getString('password') ?? '';
      }
    });
  }
  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (remember_me) {
      await prefs.setBool('remember_me', true);
      await prefs.setString('name', nameController.text);
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passController.text);
    } else {
      await prefs.setBool('remember_me', false);
      await prefs.remove('name');
      await prefs.remove('email');
      await prefs.remove('password');
    }
  }

  @override
  void initState() {
    super.initState();
    loadRememberMe();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }


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
                Customlogo(Height: 40),
                Textfeild(hint: 'Your Name', controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {return 'Name is required';}
                    return null;
                  },
                ),
                Textfeild(hint: 'Email', controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {return 'Email is required';}
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                Textfeild(hint: 'Password',
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      icon: Icon(isHidden ? Icons.visibility_off:Icons.visibility))
                  ,controller: passController, isObsecure: isHidden,
                  validator: (value) {
                    if (value == null || value.isEmpty) {return 'Password is required';}
                    if (value.length < 6) {return 'Password must be at least 6 characters';}
                    return null;
                  },
                ),
                checkBox(value: remember_me,
                  onChanged: (value) async {
                    setState(() {
                      remember_me = value;
                    });
                    await saveUserData();
                  },
                  text: 'Remember Me',
                  activeColor: Colors.blueAccent,
                  borderColor: Colors.black,
                ),

                SizedBox(height: 20),
                Elevatedbtn(labelText: 'Create Account', btnColor: Colors.lightBlueAccent,
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
                OrDivider(),
                SizedBox(height: 20),
                Elevatedbtn(labelText: 'Login', btnColor: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (_) => Login(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Elevatedbtn(labelText: 'Google',
                        iconData: Image.asset('assets/Icons/google.png', width: 20, height: 20,),
                        btnColor: Colors.white70,
                        colorText: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Elevatedbtn(labelText: 'Facebook', iconData: Icon(Icons.facebook, color: Colors.blue, size: 20,),
                        btnColor: Colors.white70,
                        colorText: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
