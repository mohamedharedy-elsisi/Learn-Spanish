import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customlogo extends StatelessWidget {
  double Height;
  Customlogo({super.key,
    this.Height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'L',
            style: TextStyle(color: Colors.red[200], fontSize: 50,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
            children: [
              TextSpan(
                text: 'spanish',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Height)
      ],
    );
  }
}
