import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrDivider  extends StatelessWidget {
  const OrDivider ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('OR',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(thickness: 1, color: Colors.grey,),
        ),
      ],
    );
  }
}
