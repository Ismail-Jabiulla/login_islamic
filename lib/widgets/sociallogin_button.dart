import 'package:flutter/cupertino.dart';

import '../constants/color_constant.dart';

class SocialLoginButton extends StatefulWidget {
  final String? ButtonText;
  final ButtonImage;
  const SocialLoginButton({super.key, required this.ButtonImage, required this.ButtonText});

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 145,
      decoration: BoxDecoration(
          color: colorAppTextWhite,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Image.asset(widget.ButtonImage, height: 24, width: 24,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(widget.ButtonText.toString()),
          ),
        ],
      ),
    );
  }
}
