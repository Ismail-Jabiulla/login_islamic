import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color_constant.dart';


class SubmitButtonWidget extends StatefulWidget {

  final double? height;
  final double? width;
  final TextColor;
  final String? ButtonText;

  const SubmitButtonWidget({
    super.key, required this.height,required this.width,required this.TextColor, required this.ButtonText,});

  @override
  State<SubmitButtonWidget> createState() => _SubmitButtonWidgetState();
}

class _SubmitButtonWidgetState extends State<SubmitButtonWidget> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  colorAppButtonDeep,
                  colorAppButtonLow,
                ])),
        child: Center(
          child: Text(
            widget.ButtonText.toString(),
            style: GoogleFonts.barlow(
                fontWeight: FontWeight.w600, fontSize: 16, color: widget.TextColor),
          ),
        ),
      ),
    );
  }
}

