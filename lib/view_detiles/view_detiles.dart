import 'package:flutter/material.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:handyman_provider/message/acnoo_message_screen.dart';
import 'package:handyman_provider/view_detiles/service_schedule.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widget/Const Data/details.dart';

class ViewDetiles extends StatefulWidget {
  const ViewDetiles({super.key, required this.details});
  final EditDetails details;
  @override
  State<ViewDetiles> createState() => _ViewDetilesState();
}

class _ViewDetilesState extends State<ViewDetiles> {
  List<String> photo = [
    'images/9.jpeg',
    'images/8.jpeg',
    'images/view2.jpeg',
    'images/6.jpeg',
  ];
  List<String> name = [
    'Devon Lane',
    'Cameron William',
    'Jacob Jones',
    'Jane Cooper',
  ];
  List<String> service = [
    'AC & Fridge repair experts',
    'Cooking experts',
    'Cleaning experts',
    'Shifting experts',
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  List<bool> staff = [];
  //////////////////////////////////
  void approveDilog(context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.only(left: 20,right: 20.0),
            backgroundColor: color.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // Add rounded corners for a better look
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 105,
                    // width: 335,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/Star.png'))),
                    child: const Image(image: AssetImage('images/check.png')),
                  ),
                  const SizedBox(
                      height: 24
                  ),
                  Text('Are You Sure',style: textTheme.headlineLarge,),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'You want to approve this request',
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.kGreyTextColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: color.primary,width: 1)),
                            child: Text(
                              'No, Rejected',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:color.primary),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),

                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            availablestaff(context);

                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color.primary),
                            child: Text(
                              'Yes, Sure',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),



                ],
              ),
            ),
          );
        });
  }
  //////////////////////////////////
  void availablestaff (context){
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return StatefulBuilder(
              builder:
                  (BuildContext
              context,
                  setState) {
                return Container(
                  height: 510,
                  decoration: const BoxDecoration(
                      color: Color(
                          0xffFFFFFF),
                      borderRadius: BorderRadius
                          .only(
                          topRight: Radius
                              .circular(
                              24),
                          topLeft: Radius
                              .circular(
                              24))),
                  child: Column(
                    children: [
                      Container(
                        height: 48,
                        width: double
                            .infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(
                                        0xffE6E6E9),
                                    width: 1))),
                        child:
                        Padding(
                          padding: const EdgeInsets
                              .only(
                              left:
                              20,
                              right:
                              10),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              const Text(
                                'Available Staff',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight
                                        .bold),
                              ),
                              CloseButton(
                                onPressed:
                                    () {
                                  Navigator
                                      .pop(
                                      context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets
                            .all(
                            20.0),
                        child: Column(
                          children: [
                            ListView
                                .builder(
                              //padding: const EdgeInsets.all(16.0),
                                itemCount: 4,
                                shrinkWrap: true,
                                itemBuilder: (
                                    context,
                                    index) {
                                  if (staff
                                      .isEmpty) {
                                    staff=
                                        List
                                            .generate(
                                            name
                                                .length, (
                                            _) => false);
                                  }
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        for (int i = 0; i <
                                            staff
                                                .length; i++) {
                                          staff[i] =
                                          false;
                                        }
                                        // Set the current index to true
                                        staff[index] =
                                        true;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets
                                          .only(
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                          color: staff[index]
                                              ? const Color(
                                              0xffEDE6FD)
                                              : AppColor.kWhiteColor,
                                          borderRadius: const BorderRadius
                                              .all(
                                              Radius
                                                  .circular(
                                                  8)),boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xff848484).withOpacity(0.1),
                                            offset: const Offset(0, 4),
                                            blurRadius: 24,
                                            spreadRadius: -4
                                        )
                                      ]
                                      ),
                                      child: ListTile(
                                        visualDensity: const VisualDensity(),
                                        isThreeLine: false,
                                        leading: Badge(
                                          backgroundColor: const Color(
                                              0xff16A34A),
                                          child: Container(
                                            height: 56,
                                            width: 56,
                                            decoration: BoxDecoration(
                                                borderRadius: const BorderRadius
                                                    .all(
                                                  Radius
                                                      .circular(
                                                      4),
                                                ),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        photo[index]),
                                                    fit: BoxFit
                                                        .cover)),
                                          ),
                                        ),
                                        title: Text(
                                          name[index],
                                          style: const TextStyle(
                                              fontWeight: FontWeight
                                                  .bold,
                                              fontSize: 16,
                                              color: Color(
                                                  0xff1C1C1C)),
                                        ),
                                        subtitle: Text(
                                          service[index],
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 16,
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              color: staff[index]
                                                  ? AppColor
                                                  .kTitleColor
                                                  : const Color(
                                                  0xff6F6F6F)),
                                        ),
                                        trailing: staff[index]
                                            ? Icon(
                                          Icons
                                              .check_circle,
                                          size: 20,
                                          color: color
                                              .primary,
                                        )
                                            : const Icon(
                                          Icons
                                              .circle_outlined,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height:
                              24,
                            ),
                            InkWell(
                              onTap:(){
                                Navigator.pop(context);
                                bookDilog(context);
                              },
                              //     () {
                              //   showDialog(
                              //       context: context,
                              //       builder: (
                              //           context) {
                              //         return AlertDialog(
                              //           backgroundColor: color
                              //               .surface,
                              //           content: Container(
                              //             alignment: Alignment
                              //                 .center,
                              //             height: 105,
                              //             // width: 335,
                              //             decoration: const BoxDecoration(
                              //                 image: DecorationImage(
                              //                     image: AssetImage(
                              //                         'images/Star1.png'))
                              //             ),
                              //             child: const Image(
                              //                 image: AssetImage(
                              //                     'images/check.png')),
                              //           ),
                              //
                              //           actions: [
                              //             Padding(
                              //               padding: const EdgeInsets
                              //                   .only(
                              //                   left: 15,
                              //                   right: 15),
                              //               child: Column(
                              //                 crossAxisAlignment: CrossAxisAlignment
                              //                     .center,
                              //                 children: [
                              //                   Text(
                              //                     'Congratulation!',
                              //                     style: textTheme
                              //                         .headlineLarge,),
                              //                   Text(
                              //                     'Job has been confirmed, Your check booking List',
                              //                     textAlign: TextAlign
                              //                         .center,
                              //                     style: textTheme
                              //                         .titleMedium
                              //                         ?.copyWith(
                              //                         fontWeight: FontWeight
                              //                             .w400,
                              //                         color: AppColor
                              //                             .kGreyTextColor),),
                              //                   const SizedBox(
                              //                     height: 15,
                              //                   ),
                              //                   const SizedBox(
                              //                     width: 10,
                              //                   ),
                              //                   InkWell(
                              //                     onTap: () {
                              //                       // Navigator
                              //                       //     .push(
                              //                       //     context,
                              //                       //     MaterialPageRoute(
                              //                       //         builder: (
                              //                       //             _) =>  ViewDetiles()));
                              //                     },
                              //                     child: Container(
                              //                       alignment: Alignment
                              //                           .center,
                              //                       height: 40,
                              //                       decoration: BoxDecoration(
                              //                           borderRadius: BorderRadius
                              //                               .circular(
                              //                               8),
                              //                           color: color
                              //                               .primary),
                              //                       child: Text(
                              //                         'Got it',
                              //                         style: textTheme
                              //                             .titleMedium
                              //                             ?.copyWith(
                              //                             fontWeight: FontWeight
                              //                                 .w600,
                              //                             color: AppColor
                              //                                 .kWhiteColor),),
                              //                     ),
                              //                   )
                              //
                              //                 ],
                              //               ),
                              //             )
                              //           ],
                              //         );
                              //       });
                              // },
                              child:
                              Container(
                                height:
                                48,
                                // width: 335,
                                decoration: const BoxDecoration(
                                    color: Color(
                                        0xff6850F3),
                                    borderRadius: BorderRadius
                                        .all(
                                        Radius
                                            .circular(
                                            8))),
                                child: const Center(
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold,
                                          color: Color(
                                              0xffFFFFFF),
                                          fontSize: 16),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              });
        });
  }
  //////////////////////////////////
  void bookDilog(context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.only(left: 20,right: 20.0),
            backgroundColor: color.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // Add rounded corners for a better look
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 105,
                    // width: 335,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/Star.png'))),
                    child: const Image(image: AssetImage('images/check.png')),
                  ),
                  const SizedBox(
                      height: 24
                  ),
                  Text('Congratulation!',style: textTheme.headlineLarge,),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Job has been confirmed, Your check booking List',
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.kGreyTextColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: color.primary),
                      child: Text(
                        'Got it',
                        style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.kWhiteColor),
                      ),
                    ),
                  ),



                ],
              ),
            ),
          );
        });
  }
////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        surfaceTintColor: colorScheme.surface,
        elevation: 0.0,
        title: Text(
          'View Details ',
          style: textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorScheme.primaryContainer,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: -4)
                    ]),
                child: Row(
                  children: [
                    Container(
                      height: 86,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          image: DecorationImage(
                              image: AssetImage(widget.details.image),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.details.name,
                          style: textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Ac Repair',
                          style: textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '\$5,000.00',
                          style: textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Budget Negotiate',
                              style: textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.kTitleColor)),
                          TextSpan(
                              text: ' (Optional)',
                              style: textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w500))
                        ]))),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Service Schedule',
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 64,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage('images/Date.png'),
                        fit: BoxFit.cover)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: colorScheme.primaryContainer),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '25',
                            style: textTheme.titleLarge,
                          ),
                          Text(
                            'DEC',
                            style: textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tuesday',
                                  style: textTheme.titleMedium,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                            const ScheduleOrder()));
                                  },
                                  child: Container(
                                    height: 24,
                                    alignment: Alignment.center,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color(0xffF9F9F9),
                                    ),
                                    child: const Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xff16A34A),
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            '3:00 PM - 4:00 PM',
                            style: textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 138,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorScheme.primaryContainer,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: -4)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Customer',
                        style: textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Stack(children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('images/view2.jpeg'),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              left: 62,
                              top: 5,
                              child: Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                    border: Border.all(
                                        color: AppColor.kWhiteColor,
                                        width: 1.6)),
                              ),
                            )
                          ]),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Will Jon',
                                  style: textTheme.headlineMedium,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                        onTap: () {
                                          _makePhoneCall('1234567890');
                                        },
                                        child: Container(
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: colorScheme.primary,
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.call,
                                                color: AppColor.kWhiteColor,
                                                size: 16,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Call',
                                                style: textTheme.titleSmall
                                                    ?.copyWith(
                                                    color:
                                                    AppColor.kWhiteColor),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const AcnooMessageScreen()));
                                        },
                                        child: Container(
                                          height: 32,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: colorScheme.primary,
                                                  width: 1)),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.message,
                                                color: colorScheme.primary,
                                                size: 16,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Message',
                                                style: textTheme.titleSmall
                                                    ?.copyWith(
                                                    color:
                                                    colorScheme.primary),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Title',
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'AC Jet Wash cleaning',
                style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.kGreyTextColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Description',
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                  'Lorem Ipsum is simply dummy text of '
                      'the printing and typesetting industry. '
                      'Lorem Ipsum has been the industry.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.kGreyTextColor)),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Your Address',
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 172,
                decoration: BoxDecoration(
                    color: AppColor.kWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: -4)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 5,
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 24,
                              width: 24,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFF902A)),
                              child: const Icon(
                                Icons.person,
                                size: 16,
                                color: AppColor.kWhiteColor,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Ibne Riead',
                              style: textTheme.titleLarge,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '+880 18365415421',
                        style: textTheme.bodyMedium?.copyWith(
                            color: AppColor.kGreyTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 80,
                        //width: 272,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 24,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffFF902A)),
                                  child: const Icon(
                                    Icons.home_filled,
                                    size: 16,
                                    color: AppColor.kWhiteColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Home',
                                  style: textTheme.titleLarge,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'House 57, Road 20, Block G, \nGulshan. Dhaka',
                              style: textTheme.bodyMedium?.copyWith(
                                  color: AppColor.kGreyTextColor,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                      Border.all(
                          color: const Color(0xffDC2626), width: 1)),
                  child: Text(
                    'Rejected',
                    style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffDC2626)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  approveDilog(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorScheme.primary),
                  child: Text(
                    'Approve',
                    style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.kWhiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
