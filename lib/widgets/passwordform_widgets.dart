import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_islamic/validator.dart';
import '../constants/color_constant.dart';

class PasswordForm extends StatefulWidget {
  final TextEditingController passwordController;
  final String? Function(String?)? validator;
  final String? LabelText;

  const PasswordForm(
      {super.key,
      required this.passwordController,
      required this.validator,
      required this.LabelText});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 20.0, right: 16.0),
          child: Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                widget.LabelText.toString(),
                style:
                    GoogleFonts.poppins(fontSize: 16, color: colorAppTextWhite),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 16, left: 16),
          child: TextFormField(
            controller: widget.passwordController,
            validator: isValidEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: '* * * * * * * * * * * *',
              filled: true,
              fillColor: colorAppTextWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.black87),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}
