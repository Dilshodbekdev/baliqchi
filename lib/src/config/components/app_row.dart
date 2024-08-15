import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AppRow extends StatelessWidget {
  final String text1;
  final String text2;

  const AppRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: CustomTextStyle.hint,
        ),
        const SizedBox(width: 16),
        Text(
          text2,
          style: CustomTextStyle.h16SB,
        )
      ],
    );
  }
}
