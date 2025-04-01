import 'package:baliqchi/src/config/components/app_divider.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

class DetailsEconomicListTile extends StatelessWidget {
  final Color? color;
  final String title;
  final String currency;

  const DetailsEconomicListTile({
    super.key,
    required this.title,
    required this.currency,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              color!=null?
              Container(
                height: 12,
                width: 12,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ):const SizedBox(),
              Expanded(
                child: Text(
                  title,
                  style: CustomTextStyle.h16R,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                currency,
                style: CustomTextStyle.h16M,
              )
            ],
          ),
        ),
        const AppDivider()
      ],
    );
  }
}
