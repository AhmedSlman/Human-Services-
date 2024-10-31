import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyman_provider/Authentication/sign_up.dart';
import 'package:handyman_provider/Home/home.dart';
import '../Widget/Const Data/consstant_data.dart';
import '../Widget/Const Data/golobal_button.dart';
import '../Widget/Theme/theme_constants.dart';
import 'forgot_password.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool _hidePassword=true;
  bool _isChecked=true;
  List<String> provider =[
    'Service Provider',
    'Staff',
  ];
  List<bool> favouriteList = [];
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme color=Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.primaryContainer,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(),
            Column(
              children: [
                Image.asset(AppInfo.logo,height: 146,width: 120,),
                Text(AppInfo.appsName,style: textTheme.titleSmall?.copyWith(fontSize: 10),),
                const SizedBox(
                  height: 20,
                ),
                Text('What kind of Role do you want?',textAlign: TextAlign.center,style: textTheme.headlineLarge,),
                const SizedBox(height: 32,),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    //width: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color:_selectedIndex==0?color.primary:AppColor.kGreyTextColor,width: 1)),
                                    child: Text('Service Provider',style: textTheme.titleSmall?.copyWith(color:_selectedIndex==0? color.primary:AppColor.kGreyTextColor),),
                                  ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Container(
                           alignment: Alignment.center,
                                    height: 40,
                                    //width: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color:_selectedIndex==1?color.primary:AppColor.kGreyTextColor,width: 1)),
                                    child: Text("Staff",style: textTheme.titleSmall?.copyWith(color:_selectedIndex==1?color.primary:AppColor.kGreyTextColor),),
                                  ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email / Phone Number*',
                      hintText: 'Enter email or phone number'
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                      labelText: 'Password*',
                      hintText: '********',
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _hidePassword =! _hidePassword;
                            });
                          },
                          icon: _hidePassword?const Icon(Icons.visibility_off_outlined,color: AppColor.kGreyTextColor,):const Icon(Icons.visibility,color: AppColor.kGreyTextColor,))
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                        visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                        value: _isChecked,
                        side: const BorderSide(
                            color: AppColor.kGreyTextColor
                        ),
                        onChanged: (bool?onChange){
                          setState(() {
                            _isChecked=onChange!;
                          });
                        }),
                    const SizedBox(width: 8,),
                    Text('Remember me',style: textTheme.titleMedium?.copyWith(color: AppColor.kGreyTextColor,fontSize: 14),),
                   // const Spacer(),
                    GestureDetector(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassword())),
                        child: Text('Forgot Password',style: textTheme.titleMedium?.copyWith(color: AppColor.kMainColor,fontSize: 14),))
                  ],
                ),
                const SizedBox(height: 20,),
                GlobalButton(
                    textTheme: textTheme,
                    buttonText: 'Log in',
                    onpressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const AcnooHome()));
                    }),

                const SizedBox(
                  height: 24,
                ),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Don’t have an account? ',style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor)
                      ),
                      WidgetSpan(child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUPScreen()));
                          }, child: Text(' Sign Up',style: textTheme.titleMedium?.copyWith(color: color.primary),)))
                    ]
                )),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            Column(
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Continue As ',
                        style: textTheme.bodyMedium?.copyWith(color: AppColor.kGreyTextColor),
                        children: [
                          WidgetSpan(child:
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>AcnooHome()));
                            },
                            child: Text('Guest',style: textTheme.titleMedium?.copyWith(color: AppColor.kGreenColor)),
                          )),
                        ]
                    )
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
