import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../Widget/Const Data/authetication_widget.dart';
import '../../Widget/Const Data/golobal_button.dart';
import '../../Widget/Theme/theme_constants.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool setPassword=true;
  bool conformPassword=true;
  TextEditingController setPasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme color=Theme.of(context).colorScheme;
    return AuthenticationWidget(
        color: color,
        textTheme: textTheme,
        title: 'Change Password',
        bodyTitle: 'Set Up New Password',
        bodyDescription: 'Reset your password to recovery and \nlog in your account',
        widget: Column(
          children: [
            TextFormField(
              controller: setPasswordController,
              obscureText: setPassword,
              decoration: InputDecoration(
                  labelText: 'Password*',
                  hintText: '******',
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          setPassword =! setPassword;
                        });
                      },
                      icon: setPassword?const Icon(FeatherIcons.eyeOff,color: AppColor.kGreyTextColor,size: 20,):const Icon(FeatherIcons.eye,color: AppColor.kGreyTextColor,size: 20,))
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: conformPassword,
              decoration: InputDecoration(
                  labelText: 'Confirm Password*',
                  hintText: '******',
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          conformPassword =! conformPassword;
                        });
                      },
                      icon: conformPassword?const Icon(FeatherIcons.eyeOff,color: AppColor.kGreyTextColor,size: 20,):const Icon(FeatherIcons.eye,color: AppColor.kGreyTextColor,size: 20,))
              ),
            ),
            const SizedBox(height: 20,),
            GlobalButton(
                color: AppColor.kMainColor,
                textTheme: textTheme,
                buttonText: 'Continue',
                onpressed: (){
                  Navigator.pop(context);
                })
          ],
        ));
  }
}
