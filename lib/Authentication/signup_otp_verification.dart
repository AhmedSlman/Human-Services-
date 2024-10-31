import 'dart:async';
import 'package:flutter/material.dart';
import 'package:handyman_provider/Authentication/setup_your_business.dart';
import 'package:pinput/pinput.dart';
import '../../Widget/Theme/theme_constants.dart';
import '../Widget/Const Data/authetication_widget.dart';
import '../Widget/Const Data/golobal_button.dart';

class SignUpOtp extends StatefulWidget {
  const SignUpOtp({super.key});

  @override
  State<SignUpOtp> createState() => _SignUpOtpState();
}

class _SignUpOtpState extends State<SignUpOtp> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  bool isVerified = false;
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  int _secondsRemaining = 60;
  Timer? _timer;
  String code = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void showPopUp(BuildContext context)async{
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          TextTheme textTheme=Theme.of(context).textTheme;
          ColorScheme color=Theme.of(context).colorScheme;
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              decoration: BoxDecoration(
                  color: color.primaryContainer,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('images/sucess.png',height: 102,width: 102,),
                    const SizedBox(height: 15,),
                    Text('Success!',style: textTheme.titleLarge,),
                    const SizedBox(height: 10,),
                    Text('You are registered Successfully',style: textTheme.bodyMedium,textAlign: TextAlign.center,),
                    const SizedBox(height: 20,),
                    GlobalButton(
                        width: 170,
                        color: AppColor.kMainColor,
                        textTheme: textTheme,
                        buttonText: 'Got It',
                        onpressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
                        })
                  ],
                ),
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme color=Theme.of(context).colorScheme;
    return AuthenticationWidget(
        color: color,
        textTheme: textTheme,
        bodyTitle: 'Check Your Email',
        bodyDescription: '6-digits pin has been sent to your email address,maantheme@gmail.com',
        title: 'OTP Verification',
        widget: Column(
          children: [
            Center(
              child: Pinput(
                length: 6,
                showCursor: true,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                focusedPinTheme: PinTheme(
                  height: 50,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: color.primary),
                  ),
                ),
                defaultPinTheme: PinTheme(
                  height: 55,
                  width: 55,
                  textStyle: textTheme.titleMedium?.copyWith(color: AppColor.kTitleColor),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: color.outline,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Visibility(
              visible: _secondsRemaining > 0,
              child: Center(
                child: Text(
                  '00:$_secondsRemaining',
                  style: textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t receive code?',
                  style: textTheme.bodySmall,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _secondsRemaining = 60;
                      _startTimer();

                    });
                  },
                  child: Text(
                    'Resend Code',
                    style: textTheme.titleSmall?.copyWith(color: color.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            GlobalButton(
                color: AppColor.kMainColor,
                textTheme: textTheme,
                buttonText: 'Verify',
                onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SetupYourBusiness()));
                })
          ],
        ));
  }
}