import 'package:flutter/material.dart';

class Textfeild extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final bool isObsecure;
  final double sizeBox;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  final Widget? suffixIcon;

  const Textfeild({
    super.key,
    required this.hint,
    this.controller,
    this.isObsecure = false,
    this.sizeBox = 20,
    this.validator,
    this.keyboardType = TextInputType.text,

    this.suffixIcon,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: isObsecure,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(

            suffixIcon: suffixIcon,
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        SizedBox(height: sizeBox),
      ],
    );
  }
}
