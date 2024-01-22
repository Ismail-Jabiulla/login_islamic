import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_islamic/constants/color_constant.dart';
import 'package:login_islamic/signup_screen.dart';
import 'package:login_islamic/validator.dart';
import 'package:login_islamic/widgets/emailform_widgets.dart';
import 'package:login_islamic/widgets/name_widgets.dart';
import 'package:login_islamic/widgets/passwordform_widgets.dart';
import 'package:login_islamic/widgets/sociallogin_button.dart';
import 'package:login_islamic/widgets/submit_button_widgets.dart';
import 'constants/image_constants.dart';
import 'constants/text_constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [
            0.1,
            0.5
          ],
              colors: [
            colorAppBackgroundDeep,
            colorAppBackgroundLow,
          ])),
      child: Form(
        key: _globalKey,
          child: ListView(
            children:[ Column(
        children: [
            SizedBox(
              height: 133,
            ),
            Center(
                child: Text(
              TextGreeting,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: colorAppTextWhite)),
            )),
            Center(
                child: Text(
              TextSignInsubTitle,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 16, color: colorAppTextWhite)),
            )),
            const SizedBox(height: 32,),
            ///-------Email--------
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: EmailForm(
                emailController: _emailController,
                validator: isValidEmail,
              ),
            ),
            ///-------Password--------
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: PasswordForm(
                passwordController: _passwordController,
                validator: isValidpassword, LabelText: TextEnterPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    TextForgotPassword,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorAppTextGreen),
                  )),
            ),
            ///--------Sign In Button--------------------
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: SubmitButtonWidget(
                height: 52,
                width: 302,
                TextColor: Colors.black87,
                ButtonText: TextSignIn,
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
                  SocialLoginButton(ButtonImage: imageGoogle, ButtonText: 'Google',),
                  SocialLoginButton(ButtonImage: imageFacebook, ButtonText: 'Facebook',),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: TextDidHaveAccount, style: GoogleFonts.poppins(fontSize: 16)),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                      },
                      child: Text(
                        TextRegistration,
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: colorAppTextGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),]
          )),
    ));
  }
}
