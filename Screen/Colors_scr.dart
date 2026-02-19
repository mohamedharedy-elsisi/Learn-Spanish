import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Controller/CustomCard2.dart';
import '../Models/ColorL.dart';

class ColorsScr extends StatefulWidget {
  const ColorsScr({super.key});

  @override
  State<ColorsScr> createState() => _ColorsScrState();
}

class _ColorsScrState extends State<ColorsScr> with SingleTickerProviderStateMixin {
  // late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colors'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: ColorL.length,
        itemBuilder: (context, index) {
          final item = ColorL[index];
          return Customcard2(
            imagePath: item.image,
            word: item.englishName,
            spanishWord: item.spanishName,
            audioPath: item.audio,
          );
        },
      ),
    );
  }
}
