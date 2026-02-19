import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnspanish/Screen/Family_scr.dart';

import '../Controller/CustomCard.dart';
import '../Models/Categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Customcard(
              imagePath: categories[index].image,
              title: categories[index].title, onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => categories[index].page)
                );
              },
            );
          },
        ),
      ),
    );
  }
}
