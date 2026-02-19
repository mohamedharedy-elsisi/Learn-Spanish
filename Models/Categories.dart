import 'dart:ui';


import 'package:learnspanish/Screen/Colors_scr.dart';
import 'package:learnspanish/Screen/Family_scr.dart';
import 'package:learnspanish/Screen/Number_scr.dart';

import '../Screen/Music.dart';
import 'Category.dart';

final List<Category> categories = [
  Category(title: 'Family', image: 'assets/Image/family.png', page: FamilyScr()),
  Category(title: 'Colors', image: 'assets/Image/colour.png',page: ColorsScr()),
  Category(title: 'Numbers', image: 'assets/Image/number-blocks.png',page: NumberScr()),
  Category(title: 'Music', image: 'assets/Image/music/music.png', page: MusicPage()),
];
