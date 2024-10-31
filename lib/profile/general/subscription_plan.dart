import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widget/Theme/theme_constants.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  List<String> date = [
    '05 Jan 2025 - Expired',
    '05 Jan 2025',
  ];
  List<String> date2 = ['Monthly', 'Annual', 'Lifetime'];
  List<String> money2 = [
    '\$50.00',
    '\$200.00',
    '\$1500.00',
  ];
  List<String> discount = [
    '\$100.00',
    '\$400.00',
    '\$3000.00',
  ];
  List<bool> subscribe = [];

  List<String> money = ['\$80.00', 'Free'];
  List<String> dm = ['Monthly', 'Freee'];
  bool istab = false;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text(
          'Subscription Plan',
          style: textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              istab == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Active Plan',
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 124,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: color.primaryContainer,
                              borderRadius: BorderRadius.circular(16),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Stack(
                                  children: [
                                    const SizedBox(
                                      height: 96,
                                      width: 96,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Color(0xffEDE6FD),
                                        value: 250 / 365,
                                        strokeWidth: 10.0,
                                      ),
                                    ),
                                    Positioned(
                                      left: 15,
                                      top: 30,
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Days Left',
                                            style: textTheme.bodySmall?.copyWith(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '250',
                                            style: textTheme.titleLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 32,
                                    width: 82,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xffEDE6FD)),
                                    child: Text(
                                      'Active',
                                      style: textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: color.primary),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Package: Free',
                                    style: textTheme.titleMedium,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              istab = !istab;
                            });
                          },
                          child: Container(
                            height: 62,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                    image: AssetImage('images/plan.png'),
                                    fit: BoxFit.cover)),
                            child: ListTile(
                              leading: Container(
                                  alignment: Alignment.center,
                                  height: 38,
                                  width: 38,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffFF902A),
                                  ),
                                  child: SvgPicture.asset('images/sub.svg')),
                              title: Text(
                                'Upgrade your  premium Plan \nby App Name',
                                style: textTheme.titleSmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: AppColor.kGreyTextColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'History',
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SizedBox(
                                  // color: Colors.red,
                                  height: 42,
                                  // width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Standard Package',
                                            style: textTheme.bodyMedium?.copyWith(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            date[index],
                                            style: textTheme.bodySmall?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            money[index],
                                            style: textTheme.bodySmall?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: color.primary),
                                          ),
                                          Text(dm[index],
                                              style: textTheme.bodySmall
                                                  ?.copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 168,
                          width: double.infinity,
                          child: SvgPicture.asset(
                            'images/frem.svg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 32,
                            width: 159,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xffFF902A)),
                            child: Text(
                              'Days Left: 02 Days',
                              style: textTheme.titleSmall
                                  ?.copyWith(color: AppColor.kWhiteColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Get Awesome Access With',
                                      style: textTheme.headlineLarge?.copyWith(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                      text: '50% off',
                                      style: textTheme.headlineLarge?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: color.primary))
                                ],
                              )),
                        ),
                        isSelected == false
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 32,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.check,
                                      size: 18,
                                      color: color.primary,
                                    )),
                                    TextSpan(
                                        text: '   Free Lifetime Update',
                                        style: textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.kGreyTextColor))
                                  ])),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.check,
                                      size: 18,
                                      color: color.primary,
                                    )),
                                    TextSpan(
                                        text: '   Unlimited Usage',
                                        style: textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.kGreyTextColor))
                                  ])),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.check,
                                      size: 18,
                                      color: color.primary,
                                    )),
                                    TextSpan(
                                        text: '   47+ Languages',
                                        style: textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.kGreyTextColor))
                                  ])),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.check,
                                      size: 18,
                                      color: color.primary,
                                    )),
                                    TextSpan(
                                        text: '   Premium Customer Support',
                                        style: textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.kGreyTextColor))
                                  ])),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.check,
                                      size: 18,
                                      color: color.primary,
                                    )),
                                    TextSpan(
                                        text: '   Unlimited Usage',
                                        style: textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.kGreyTextColor))
                                  ])),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.check,
                                      size: 18,
                                      color: color.primary,
                                    )),
                                    TextSpan(
                                        text: '   Android & iOS App Support',
                                        style: textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.kGreyTextColor))
                                  ])),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: ListView.builder(
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      if (subscribe.isEmpty) {
                                        subscribe =
                                            List.generate(date2.length, (_) => false);
                                      }
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 17),
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {for (int i = 0; i < subscribe.length;
                                            i++) {subscribe[i] = false; }
                                            subscribe[index] = true;
                                            });
                                          },
                                          child: Container(
                                            height: 56,
                                            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color:subscribe[index]?Color(0xffEDE6FD):color.primaryContainer,
                                                border: Border.all(
                                                    color:subscribe[index]?color.primary:Color(0xffDAC0FE))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  date2[index],
                                                  style: textTheme.bodyLarge,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      money2[index],
                                                      style: textTheme.bodyLarge
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight.w600),
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Text(discount[index],style: textTheme.bodySmall?.copyWith(fontSize: 12,color: AppColor.kGreyTextColor),),
                                                        Positioned.fill(
                                                          child: Align(
                                                            alignment: Alignment.center,
                                                            child: Container(
                                                              height: 2, // Adjust the thickness of the line
                                                              color: Colors.black54, // Adjust the color of the line
                                                              margin: EdgeInsets.symmetric(horizontal: 1),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                      ],
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: istab == true
          ? Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: color.primary),
                  child: Text(
                    'Subscribe',
                    style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.kWhiteColor),
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
