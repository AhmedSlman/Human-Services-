import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_provider/profile/about/about_us.dart';
import 'package:handyman_provider/profile/about/help_support.dart';
import 'package:handyman_provider/profile/about/privacy_policy.dart';
import 'package:handyman_provider/profile/about/terms_conditions.dart';
import 'package:handyman_provider/profile/general/change_passworld.dart';
import 'package:handyman_provider/profile/general/dash_board/dash_Board.dart';
import 'package:handyman_provider/profile/general/general_setting/general_settings.dart';
import 'package:handyman_provider/profile/general/my_profile/my_profile.dart';
import 'package:handyman_provider/profile/general/my_wallet.dart';
import 'package:handyman_provider/profile/general/refer_to_earned.dart';
import 'package:handyman_provider/profile/general/subscription_plan.dart';
import '../Widget/Theme/theme_constants.dart';
import '../extra-service/extra_service.dart';
import '../our_staff/our_staff.dart';
import 'general/verify_account/verify_accoount.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<dynamic> name = [
    'My Profile',
    'Dashboard',
    'Extra Service',
    'Staff List ',
    'My wallet',
    'Verify Account',
    'Subscription  Plan',
    'General Settings',
    'Refer to Earned',
    'Change Password',
  ];
  List<dynamic> pic = [
    'images/g1.svg',
    'images/g2.svg',
    'images/g3.svg',
    'images/g4.svg',
    'images/g5.svg',
    'images/g6.svg',
    'images/g7.svg',
    'images/g8.svg',
    'images/g9.svg',
    'images/g10.svg',
  ];

  List<dynamic> svg = [
    'images/a1.svg',
    'images/a2.svg',
    'images/a3.svg',
    'images/a4.svg',
  ];
  List<dynamic> name2 = [
    'About us',
    'Privacy & policy',
    'Terms & conditions',
    'Help & Support',
  ];
  List<dynamic> generalScreen= [
    const MyProfile(),
    const DashBoard(),
    const ExtraService(),
    const OurStaff(),

    const MyWallet(),
    const VerifyAccoount(),
    const SubscriptionPlan(),
    const GeneralSettings(),
    const Refer(),
    const ChangePassword(),
  ];
  List<dynamic> aboutscreen=[
    const About(),
    const PrivacyPolicy(),
    const TermsConditions(),
    const HelpSupport(),
  ];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 64,
              width: double.infinity,
              color: AppColor.kWhiteColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('images/chat7.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Shaidul Islam',
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        'shaidulislam@gmail.com',
                        style: textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 330,
                    // width: 335,
                    decoration: BoxDecoration(
                        color: AppColor.kWhiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            'General',
                            style: textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
        
                        // Text('General',style: textTheme.titleLarge,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 5, left: 5, bottom: 5),
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: name.length,
                                padding: const EdgeInsets.all(5),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 4,
                                        childAspectRatio: 0.90),
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    //alignment: Alignment.center,
                                    height: 83,
                                    width: 74,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (_)=>generalScreen[index]));
                                            //index == 8 ? null : Navigator.push(context, MaterialPageRoute(builder: (_) => page[index]));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 48,
                                            width: 48,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffEDE6FD)),
                                            child: SvgPicture.asset(pic[index]),
                                          ),
                                        ),
                                        Text(
                                          name[index],
                                          textAlign: TextAlign.center,
                                          style: textTheme.bodySmall?.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 148,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.kWhiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text(
                            'About Our App',
                            style: textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: name2.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:const EdgeInsets.only(right: 5),
                                  child: SizedBox(
                                    height: 83,
                                    width: 74,
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                           Navigator.push(context, MaterialPageRoute(builder: (_) =>aboutscreen[index]));
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 48,
                                              width: 48,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xffEDE6FD)),
                                              child:
                                                  SvgPicture.asset(svg[index])),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          name2[index],
                                          textAlign: TextAlign.center,
                                          style: textTheme.bodySmall?.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (_) => FirstScreen()));
                    },
                    child: Container(
                        height: 40,
                        //width: 335,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: const Color(0xffFF902A), width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Log Out',
                              style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffFF902A)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Color(0xffFF902A),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
