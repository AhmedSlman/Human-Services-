import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:handyman_provider/Authentication/signup_otp_verification.dart';
import '../Widget/Const Data/consstant_data.dart';
import '../Widget/Const Data/golobal_button.dart';
import '../Widget/Theme/theme_constants.dart';
import 'login_screen.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}
 bool isChecked = false;
class _SignUPScreenState extends State<SignUPScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController referalController=TextEditingController();
  bool hidePassword=true;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme color=Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.primaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppInfo.logo,height: 145,width: 120,),
                Text(AppInfo.appsName,style: textTheme.titleSmall,),
                const SizedBox(height: 48,),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Full Name*',
                      hintText: 'Enter Full Name'
                  ),
                ),
                const SizedBox(height: 32,),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email Address*',
                      hintText: 'Enter email or phone number'
                  ),
                ),
                const SizedBox(height: 32,),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter phone number'
                  ),
                ),
                const SizedBox(height: 32,),
                TextFormField(
                  obscureText: hidePassword,
                  controller: passwordController,
                  decoration:  InputDecoration(
                      labelText: 'Password*',
                      hintText: '********',
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              hidePassword =!hidePassword;
                            });
                          }, icon: hidePassword?const Icon(FeatherIcons.eyeOff,color: AppColor.kGreyTextColor,size: 20,):const Icon(FeatherIcons.eye,color: AppColor.kGreyTextColor,size: 20,))
                  ),
                ),
                const SizedBox(height: 32,),
                TextFormField(
                  controller: referalController,
                  decoration: const InputDecoration(
                      labelText: 'Referral Code',
                      hintText: 'Enter referral doe'
                  ),
                ),
                const SizedBox(height: 24,),

                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged:(bool? newValue){
                          setState(() {
                            isChecked=newValue!;
                          });
                        }),
                    RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'I agree to the',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400,fontSize: 12)
                        ),
                        TextSpan(
                          text: ' Terms of service',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400,color: color.primary,fontSize: 12)
                        ),
                        TextSpan(
                          text: ' &',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400,fontSize: 12)
                        ),
                        TextSpan(
                          text: ' Privacy policy.',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400,color: color.primary,fontSize: 12)
                        )
                      ]
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                GlobalButton(
                    textTheme: textTheme,
                    buttonText: 'Sign Up',
                    onpressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpOtp()));
                    }),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style: textTheme.bodyMedium?.copyWith(color: AppColor.kGreyTextColor),
                        children: [
                          TextSpan(
                              text: 'Log in',
                              recognizer: TapGestureRecognizer()..onTap=()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen())),
                              style: textTheme.titleMedium?.copyWith(color: AppColor.kMainColor)
                          )
                        ]
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
