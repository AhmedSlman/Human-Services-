import 'package:flutter/material.dart';
import '../../Widget/Const Data/authetication_widget.dart';
import '../Widget/Const Data/golobal_button.dart';
import 'otp_verification.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme color=Theme.of(context).colorScheme;
    return AuthenticationWidget(
      color: color,
      textTheme: textTheme,
      title: 'Forgot Password',
      bodyTitle: 'Forgot Password',
      bodyDescription: 'Enter your email address and we will send you code',
      widget: Column(
        children: [
          const SizedBox(height: 15,),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter Email'
            ),
          ),
          const SizedBox(height: 40,),
          GlobalButton(
              textTheme: textTheme,
              buttonText: 'Verify',
              onpressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpVerification()));
              })
        ],
      ),
    );
  }
}


