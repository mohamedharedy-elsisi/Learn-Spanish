import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Controller/CustomCard.dart';
import '../Controller/CustomCard2.dart';
import '../Models/FamilyL.dart';

class FamilyScr extends StatefulWidget {
  const FamilyScr({super.key});

  @override
  State<FamilyScr> createState() => _FamilyScrState();
}

class _FamilyScrState extends State<FamilyScr> with SingleTickerProviderStateMixin {
  //late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: familyWords.length,
        itemBuilder: (context, index) {
          final item = familyWords[index];
          return Customcard2(
            imagePath: item.image,
            word: item.originalWord,
            spanishWord: item.spanishWord,
            audioPath: item.sound,
          );
        },
      ),
    );
  }
}
