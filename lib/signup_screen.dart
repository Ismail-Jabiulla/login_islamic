import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_islamic/constants/color_constant.dart';
import 'package:login_islamic/signin_screen.dart';
import 'package:login_islamic/validator.dart';
import 'package:login_islamic/widgets/emailform_widgets.dart';
import 'package:login_islamic/widgets/name_widgets.dart';
import 'package:login_islamic/widgets/passwordform_widgets.dart';
import 'package:login_islamic/widgets/sociallogin_button.dart';
import 'package:login_islamic/widgets/submit_button_widgets.dart';
import 'constants/image_constants.dart';
import 'constants/text_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.1, 0.5 ],
                colors: [
              colorAppBackgroundDeep,
              colorAppBackgroundLow,
            ])),
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                      child: Text(
                    TextSignupToApp,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: colorAppTextWhite)),
                  )),
                  Center(
                      child: Text(
                    TextSignupToApp_sub,
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 16, color: colorAppTextWhite)),
                  )),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: NameForm(),
                  ),

                  ///-------Email--------
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16),
                    child: EmailForm(
                      emailController: _emailController,
                      validator: isValidEmail,
                    ),
                  ),

                  ///-------Password--------
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16),
                    child: PasswordForm(
                      passwordController: _passwordController,
                      validator: isValidpassword,
                      LabelText: TextEnterPassword,
                    ),
                  ),

                  ///-------Confirm Password--------
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16),
                    child: PasswordForm(
                      passwordController: _confirmPasswordController,
                      validator: isValidpassword,
                      LabelText: TextEnterConfirmPassword,
                    ),
                  ),

                  ///--------Sign In Button--------------------
                      Padding(
                    padding: EdgeInsets.only(top: 32.0),
                    child: GestureDetector(
                      onTap: (){
                        _showDialog(context);
                      },
                      child: SubmitButtonWidget(
                        height: 52,
                        width: 302,
                        TextColor: Colors.black87,
                        ButtonText: TextSignUp,
                      ),
                    ),
                  ),

                  ///---------Divider-------------
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          indent: 40,
                          endIndent: 20,
                          color: Colors.grey,
                          thickness: 2,
                        )),
                        Text(
                          TextDivider,
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: colorAppTextGrey),
                        ),
                        const Expanded(
                            child: Divider(
                          indent: 20,
                          endIndent: 40,
                          color: Colors.grey,
                          thickness: 2,
                        )),
                      ],
                    ),
                  ),

                  ///------Social Login Button--------------
                  const Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialLoginButton(
                          ButtonImage: imageGoogle,
                          ButtonText: 'Google',
                        ),
                        SocialLoginButton(
                          ButtonImage: imageFacebook,
                          ButtonText: 'Facebook',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: TextHaveAnyAccount,
                              style: GoogleFonts.poppins(fontSize: 16)),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                              },
                              child: Text(
                                TextSignIn,
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: colorAppTextGreen),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 125.0),
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                height: 400,
                width: 328,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imageDialogShape),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Congratulations!',
                        style: GoogleFonts.barlow(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Your new account has been \ncreated successfully.',
                      style: GoogleFonts.barlow(
                        textStyle: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SubmitButtonWidget(height: 56, width: 140, TextColor: Colors.black87, ButtonText: 'Continue',),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 19.0),
                        child: Text(
                          'Close',
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            color: Colors.grey, // Adjust the color as needed
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
