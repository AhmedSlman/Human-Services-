import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Widget/Const Data/consstant_data.dart';
import '../Widget/Theme/theme_constants.dart';
import '../model/purchase_model/purchase_model.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getInit() async {
    await Future.delayed(const Duration(seconds: 3)).then(
      (value) => checkUser(),
    );
  }

  checkUser() async {
    await PurchaseModel().isActiveBuyer().then((value) {
      if (value) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Not Active User"),
            content: Text("Please use the valid purchase code to use the app."),
            actions: [
              TextButton(
                onPressed: () {
                  //Exit app
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else {
                    exit(0);
                  }
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 198,
                width: 198,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kWhiteColor.withOpacity(0.3),
                ),
              ),
              Image.asset(
                AppInfo.splashLogo,
                height: 128,
                width: 121,
              )
            ],
          ),
          const Spacer(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppInfo.appsName,
                  style: textTheme.titleMedium?.copyWith(fontSize: 20, color: AppColor.kWhiteColor),
                ),
                Text('Version ${AppInfo.appsVersion}', style: textTheme.titleMedium?.copyWith(color: AppColor.kWhiteColor)),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
