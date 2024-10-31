import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:handyman_provider/booking/booking.dart';
import 'package:handyman_provider/booking/booking_detiles.dart';
import 'package:handyman_provider/job%20request/recent_job_request.dart';
import 'package:handyman_provider/my_service/my_service.dart';
import 'package:handyman_provider/my_service/service_details.dart';
import 'package:handyman_provider/our_staff/our_staff.dart';
import 'package:handyman_provider/profile/general/subscription_plan.dart';
import 'package:handyman_provider/view_detiles/view_detiles.dart';

import '../our_staff/view_details_staff.dart';
import 'notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> text = [
    '\$50,00,000',
    '12',
    '12',
    '12',
  ];
  List<bool> switchs = [];

  List<Icon> icon = [
    const Icon(
      Icons.wallet,
      color: Color(0xff16A34A),
      size: 20,
    ),
    const Icon(
      Icons.library_books,
      color: Color(0xffFF902A),
      size: 20,
    ),
    const Icon(
      Icons.people_sharp,
      color: Color(0xff3B82F6),
      size: 20,
    ),
    const Icon(
      Icons.grid_view_rounded,
      color: Color(0xff702EFC),
      size: 20,
    ),
  ];
  List<String> text2 = [
    'Total Earning',
    'Total Booking',
    'Total Staff',
    'Total Service',
  ];
  List<Color> colors = [
    const Color(0xffDCFCE7),
    const Color(0xffFF902A).withOpacity(0.15),
    const Color(0xffDBEAFE),
    const Color(0xffE6DBFE),
  ];
  List<String> recent = [
    'Gas Stove Leak Repair',
    'AC Cooling Problem',
    'House cleaning service',
  ];
  List<String> recentimage = [
    'images/recent1.jpeg',
    'images/recent2.png',
    'images/recent3.jpeg',
  ];
  List<String> upcomingimage = [
    'images/recent1.jpeg',
    'images/recent2.png',
    'images/recent3.jpeg',
    'images/recent1.jpeg',
  ];
  List<String> staffname = [
    'Wade Warren',
    'Ralph Edwards',
    'Rakibul Islam',
    'Wade Warren',
  ];
  List<String> staffwork = [
    'Ac Service',
    'Cleaner',
    'Ac Service',
    'Cleaner',
  ];
  List<String> staffpic = [
    'images/staff1.jpeg',
    'images/staff2.jpeg',
    'images/staff1.jpeg',
    'images/staff2.jpeg',
  ];
  List<String> servicespic = [
    'images/recent1.jpeg',
    'images/recent2.png',
    'images/Services.jpeg',
    'images/recent3.jpeg',
  ];
  List<String> servicename = [
    'Gas Stove Leak Repair',
    'AC Cooling Problem',
    'Ac Jet Wash',
    'Gas Stove Leak Repair',
  ];
  List<String> servicename2 = [
    'Stove Repair',
    'Stove Repair',
    'AC Repair',
    'Stove Repair',
  ];
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 264,
                  width: double.infinity,
                  //height: MediaQuery.of(context).size.height / 3.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/top.png'),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 10,
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColor.kWhiteColor, width: 1),
                                image: const DecorationImage(
                                    image: AssetImage('images/profile.jpeg'),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xff848484)
                                          .withOpacity(0.1),
                                      offset: const Offset(0, 4),
                                      blurRadius: 24,
                                      spreadRadius: -4)
                                ]),
                          ),
                          title: Text(
                            'Ralph Edwards',
                            style: textTheme.titleLarge
                                ?.copyWith(color: AppColor.kWhiteColor),
                          ),
                          subtitle: Text(
                            'Free Plan',
                            style: textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffF9F9F9)),
                          ),
                          trailing: InkWell(
                            onTap: (){

                              Navigator.push(context, MaterialPageRoute(builder: (_)=>const NotificationScreen()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColor.kWhiteColor, width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xff848484)
                                            .withOpacity(0.1),
                                        offset: const Offset(0, 4),
                                        blurRadius: 24,
                                        spreadRadius: -4)
                                  ]),
                              child: const Badge(
                                  child: Icon(
                                Icons.notifications_none,
                                color: AppColor.kWhiteColor,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Text('\$17,000.00',
                                  style: textTheme.headlineLarge?.copyWith(
                                      fontSize: 30,
                                      color: AppColor.kWhiteColor)),
                              Text(
                                'Today Earning',
                                style: textTheme.titleMedium
                                    ?.copyWith(color: AppColor.kWhiteColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 190),
                  child: Container(

                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        //color: color.primaryContainer,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xffADADAD).withOpacity(0.1),
                              blurRadius: 16,
                              spreadRadius: -3,
                              offset: const Offset(0, 2))
                        ]),
                    child: Column(
                        children: [
                      SizedBox(
                        height: 115,
                        child: ListView.builder(
                            physics: const ScrollPhysics(),
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: text.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: 14, left: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.zero,
                                      height: 105,
                                      width: 140,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColor.kWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xff848484)
                                                    .withOpacity(0.1),
                                                offset: const Offset(0, 4),
                                                blurRadius: 24,
                                                spreadRadius: -4)
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: colors[index]),
                                            child: icon[index],
                                          ),
                                          Text(
                                            text[index],
                                            style: textTheme.headlineMedium,
                                          ),
                                          Text(
                                            text2[index],
                                            style: textTheme.bodySmall
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ]),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const SubscriptionPlan()));
                },
                child: Container(
                  height: 62,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage('images/plan.png'),
                          fit: BoxFit.cover)),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 38,
                        width: 38,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFF902A),
                        ),
                        child: SvgPicture.asset('images/sub.svg')
                      ),
                    ),
                    title: RichText(
                      maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Free Plan ',
                          style: textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: '(Left 7 day)',
                          style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColor.kGreyTextColor))
                    ])),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Update your subscription',
                        maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColor.kGreyTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Job Request',
                    style: textTheme.titleLarge,
                    maxLines: 1,overflow: TextOverflow.ellipsis,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentJobRequest()));
                    },
                    child: Text(
                      'See All',
                      style: textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 0, 24),
              child: SizedBox(
                height: 228,
                child: ListView.builder(
                    itemCount: recent.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final details =EditDetails(
                          name: recent[index],
                          image: recentimage[index],
                          userName: '',
                          address: '',
                          designation: '',
                          phone: '',
                          subtitle: '', price: '', discount: '', time: 0, email: '', city: '', state: '', zipCode: 0, photo: []);
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewDetiles(details: details)));
                          },
                          child: Container(
                            height: 228,
                            width: 161,
                            decoration: BoxDecoration(
                                color: color.primaryContainer,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xff848484)
                                          .withOpacity(0.1),
                                      offset: const Offset(0, 4),
                                      blurRadius: 24,
                                      spreadRadius: -4)
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  height: 112,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8)),
                                      image: DecorationImage(
                                          image: AssetImage(details.image),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '25 March 2024',maxLines: 1,overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodySmall?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        details.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.titleMedium,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        '\$5,000.00',overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: color.primary, width: 1)),
                                        child: Text(
                                          'Requested',
                                          maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: textTheme.titleSmall
                                              ?.copyWith(color: color.primary),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Booking',
                    maxLines: 1,overflow: TextOverflow.ellipsis,
                    style: textTheme.titleLarge,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const Booking()));
                    },
                    child: Text(
                      'See All',
                      style: textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 24),
              child: SizedBox(
                height: 270,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: upcomingimage.length,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.37,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>BookingDtails(process: index)));
                        },
                        child: Container(
                          height: 127,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: color.primaryContainer,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        const Color(0xff848484).withOpacity(0.1),
                                    offset: const Offset(0, 4),
                                    blurRadius: 24,
                                    spreadRadius: -4)
                              ]),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 111,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage(upcomingimage[index]),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Booing ID: 215464',
                                        style: textTheme.titleMedium,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Price:',
                                            style: textTheme.bodySmall?.copyWith(
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: '\$900',
                                            style: textTheme.bodySmall?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.kTitleColor))
                                      ])),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Date: 8 Dec 2024 - 11am 12 pm',
                                        maxLines: 1,overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: const Color(0xffFFF2E5)),
                                              child: Text(
                                                'Pending',
                                                style: textTheme.bodySmall
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xffFF902A)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 9,
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: AppColor
                                                          .kLightNeaturalColor,
                                                      width: 1)),
                                              child: Text(
                                                'View Details ',
                                                style:
                                                    textTheme.bodySmall?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Our Staffs',
                    style: textTheme.titleLarge,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const OurStaff()));
                    },
                    child: Text(
                      'See All',
                      style: textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 24),
              child: SizedBox(
               height: 227,
                child: ListView.builder(
                    itemCount: staffname.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final staffdetails = EditDetails(
                          image: staffpic[index],
                          name: staffname[index],
                          userName: '',
                          address: '',
                          designation: staffwork[index],
                          phone: '01863251459',
                          subtitle: '', price: '', discount: '', time: 0, email: '', city: '', state: '', zipCode: 0, photo: []

                      );
                      if (switchs.isEmpty) {
                        switchs =
                            List.generate(staffname.length, (_) => false);
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewDetailsStaff(staffdetails:staffdetails,)));
                          },
                          child: Container(
                            height: 227,
                            width: 161,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color.primaryContainer,
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xff848484)
                                          .withOpacity(0.1),
                                      offset: const Offset(0, 4),
                                      blurRadius: 24,
                                      spreadRadius: -4)
                                ]),
                            child: Column(
                              children: [
                                Stack(children: [
                                  Container(
                                    height: 135,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        image: DecorationImage(
                                            image: AssetImage(staffdetails.image),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 130,
                                      left: 75
                                    ),
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColor.kWhiteColor,
                                              width: 1),
                                          color: AppColor.kGreyTextColor),
                                    ),
                                  )
                                ]),
                                // const SizedBox(
                                //   height: 7,
                                // ),
                                Text(staffdetails.name,style: textTheme.titleMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(staffdetails.designation,style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0,10,7),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(shape: BoxShape.circle,color: const Color(0xffFF902A).withOpacity(0.15)),
                                        child: const Icon(Icons.call,color: Color(0xffFF902A),size: 16,),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xffDCFCE7)),
                                        child: const Icon(Icons.message,color: Color(0xff16A34A),size: 16,),
                                      ),
                                      const SizedBox(
                                        width: 37,
                                      ),
                                      Transform.scale(
                                        scale: 0.8,
                                        child: SizedBox(
                                          height: 24,
                                          width: 44,
                                          child: Switch(
                                            value:switchs[index],
                                            onChanged:(value){
                                              setState(() {
                                                switchs[index] = value;
                                              });
                                            }

                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Services',
                    style: textTheme.titleLarge,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const MyService()));
                    },
                    child: Text(
                      'See All',
                      style: textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 24),
              child: SizedBox(
                height: 236,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: upcomingimage.length,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.37,
                    ),
                    itemBuilder: (context, index) {
                      final myView = EditDetails (
                        name: servicename[index],
                        subtitle:servicename2[index],
                        image: servicespic[index],
                        userName: '',
                        address: '',
                        designation: '',
                        phone: '', price: '', discount: '', time: 0, email: '', city: '', state: '', zipCode: 0, photo: [],
                      );
                      return InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (_)=>ServicesDetails(myView: myView, initialIndex: index,)));
                        },
                        child: Container(
                          height: 112,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: color.primaryContainer,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                    const Color(0xff848484).withOpacity(0.1),
                                    offset: const Offset(0, 4),
                                    blurRadius: 24,
                                    spreadRadius: -4)
                              ]),
                          child: Row(
                            children: [
                              Container(
                                width: 104,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8)
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(myView.image),
                                        fit: BoxFit.cover)),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(myView.name,maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(myView.subtitle,style: textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w400)),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$5000',
                                          style: textTheme.bodySmall?.copyWith(
                                              fontWeight: FontWeight.w500,color: AppColor.kTitleColor),
                                        ),
                                        const SizedBox(
                                          width:60 ,
                                        ),
                                        selectedIndex==index ? Container(
                                          alignment: Alignment.center,
                                          height: 21,
                                          width: 69,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color: const Color(0xffFEF2F2)),
                                          child: const Text(
                                            '30% OFF',
                                            style: TextStyle(
                                                color: Color(0xffDC2626),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ):const SizedBox(),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star,size: 16,color: AppColor.kRatingColor,),
                                        RichText(text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '4.5',style: textTheme.bodySmall?.copyWith(fontSize: 12,color: AppColor.kTitleColor,fontWeight: FontWeight.w400)
                                            ),
                                            TextSpan(
                                              text: '(20 Review)',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400,fontSize: 12)
                                            ),

                                          ]
                                        )),
                                      ],
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
