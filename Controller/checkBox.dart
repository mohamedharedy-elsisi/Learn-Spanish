import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class checkBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;
  final Color activeColor;
  final Color borderColor;
  const checkBox({super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    required this.activeColor
    , required this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: value ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: value ? activeColor : borderColor,
                width: 2,
              ),
            ),
            child: value ? Icon(
              Icons.check,
              size: 16,
              color: Colors.white,
            )
                : null,
          ),
          SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
