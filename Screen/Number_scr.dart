import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Controller/CustomCard2.dart';
import '../Models/NumberL.dart';

class NumberScr extends StatefulWidget {
  const NumberScr({super.key});

  @override
  State<NumberScr> createState() => _NumberScrState();
}

class _NumberScrState extends State<NumberScr> with SingleTickerProviderStateMixin {
  // late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: numbersList.length,
        itemBuilder: (context, index) {
          final item = numbersList[index];
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
