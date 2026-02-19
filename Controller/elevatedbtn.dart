import 'package:flutter/material.dart';

class Elevatedbtn extends StatelessWidget {
  final String labelText;
  final Color btnColor;
  final Widget? iconData;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double border;
  final Color colorText;
  final double spaceBottom;

  const Elevatedbtn({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.btnColor = Colors.green,
    this.iconData,
    this.height = 55,
    this.width = double.infinity,
    this.border = 12,
    this.colorText = Colors.white,
    this.spaceBottom = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconData != null) ...[
                  iconData!,
                  const SizedBox(width: 8),
                ],
                Text(
                  labelText,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colorText,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: spaceBottom),
      ],
    );
  }
}
