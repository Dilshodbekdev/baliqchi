import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageButton extends StatelessWidget {
  final String icon;
  final String title;
  final bool isCheck;
  final VoidCallback onClick;

  const LanguageButton({
    super.key,
    required this.icon,
    required this.title,
    required this.isCheck,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.mainColor1.withOpacity(0.06),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: ListTile(
          onTap: () => onClick(),
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SvgPicture.asset(icon,height: 40,)),
          title: Text(
            title,
            style: CustomTextStyle.h16M,
          ),
          trailing: Checkbox(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              value: isCheck,
              onChanged: (v)=>onClick()),
        ),
      ),
    );
  }
}
