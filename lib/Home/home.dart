import 'package:flutter/material.dart';
import 'package:handyman_provider/booking/booking.dart';
import 'package:handyman_provider/message/acnoo_message_screen.dart';
import 'package:handyman_provider/my_service/my_service.dart';
import 'package:iconly/iconly.dart';
import '../Widget/Theme/theme_constants.dart';
import '../profile/profile.dart';
import 'home_screen.dart';

class AcnooHome extends StatefulWidget {
  const AcnooHome({super.key});

  @override
  State<AcnooHome> createState() => _AcnooHomeState();
}

class _AcnooHomeState extends State<AcnooHome> {

  int currentIndex=0;

  final List<Widget> _widgetList=[
    const HomeScreen(),
    const Booking(),
    const MyService(),
    const AcnooMessageScreen(),
    const ProfileScreen(),
  ];

  int activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme color=Theme.of(context).colorScheme;
    return Scaffold(
      body: _widgetList.elementAt(currentIndex),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: color.primaryContainer
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex=0;
                      });
                    },
                    child: Column(
                      children: [
                        currentIndex==0? Icon(IconlyBold.home,color: color.primary,size: 24,):const Icon(IconlyLight.home,color: AppColor.kGreyTextColor,size: 24,),
                        Text('Home',style: textTheme.titleMedium?.copyWith(color: currentIndex==0?AppColor.kMainColor:AppColor.kGreyTextColor,fontSize: 14),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex=1;
                      });
                    },
                    child: Column(
                      children: [
                        currentIndex==1? Icon(Icons.library_books,color: color.primary,size: 24,): const Icon(Icons.library_books,color: AppColor.kGreyTextColor,size: 24,),
                        Text('Booking',style: textTheme.titleMedium?.copyWith(color: currentIndex==1?AppColor.kMainColor:AppColor.kGreyTextColor,fontSize: 14),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex=2;
                      });
                    },
                    child: Column(
                      children: [
                        currentIndex==2? Icon(Icons.add_box,color: color.primary,size: 24,): const Icon(Icons.add_box,color: AppColor.kGreyTextColor,size: 24,),
                        Text('My Service',style: textTheme.titleMedium?.copyWith(color: currentIndex==2?AppColor.kMainColor:AppColor.kGreyTextColor,fontSize: 14),),

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex=3;
                      });
                    },
                    child: Column(
                      children: [
                        currentIndex==3? Icon(IconlyBold.message,color: color.primary,size: 24,):const Icon(IconlyLight.message,color: AppColor.kGreyTextColor,size: 24,),
                        Text('Message',style: textTheme.bodyMedium?.copyWith(color: currentIndex==3?AppColor.kMainColor:AppColor.kGreyTextColor,fontSize: 14),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex=4;
                      });
                    },
                    child: Column(
                      children: [
                        currentIndex==4? Icon(IconlyBold.profile,color: color.primary,size: 24,):const Icon(IconlyLight.profile,color: AppColor.kGreyTextColor,size: 24,),
                        Text('Profile',style: textTheme.titleMedium?.copyWith(color: currentIndex==4?AppColor.kMainColor:AppColor.kGreyTextColor,fontSize: 14),),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}