import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final VoidCallback? onClick;

  const AppElevatedButton(
      {super.key, required this.text, required this.onClick, this.textColor, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor??AppColors.mainColor2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onClick!=null? () => onClick!():null,
        child: Text(
          text,
          style: TextStyle(
            color: textColor??Colors.white,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
