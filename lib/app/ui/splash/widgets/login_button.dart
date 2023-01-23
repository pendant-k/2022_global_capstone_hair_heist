import 'package:flutter/material.dart';

import '../../../config/global_styles.dart';
import '../../../config/palette.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.btnColor = Colors.white,
    this.textColor = Palette.fontPrimaryColor,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final Color btnColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btnColor,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GlobalStyle.primaryText.copyWith(color: textColor),
        ),
      ),
    );
  }
}
