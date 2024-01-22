import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_islamic/validator.dart';
import '../constants/color_constant.dart';

class NameForm extends StatefulWidget {
  @override
  State<NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 20.0, right: 16.0),
          child: Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                'Name',
                style:
                    GoogleFonts.poppins(fontSize: 16, color: colorAppTextWhite),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 16, left: 16),
          child: TextFormField(
            validator: isValidEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Enter Your Name',
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
