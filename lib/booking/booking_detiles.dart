import 'dart:math';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widget/Theme/theme_constants.dart';
import '../message/acnoo_message_screen.dart';
import 'dart:typed_data' as td;


class BookingDtails extends StatefulWidget {
  const BookingDtails({super.key, required this.process});
  final int process;
  @override
  State<BookingDtails> createState() => _BookingDtailsState();
}

class _BookingDtailsState extends State<BookingDtails> {
  List<bool> staff = [];
  int selected = 0;
  bool writeCommand = false;
  bool isSelect = false;
  String? selectedStaff;
  List<String> option = [
    'Pending',
    'Accepted',
    'Rejected',
    'In Progress',
    'Completed',
  ];
  List<String> processList = [
    'Accepted',
    'In Progress',
    'Completed',
    'Rejected',
  ];
  List<String> number = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
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
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void showAvailableStaff() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return StatefulBuilder(builder: (BuildContext context, setNewState) {
            return Container(
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 48,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffE6E6E9), width: 1))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Available Staff',
                            maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          CloseButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ListView.builder(
                            //padding: const EdgeInsets.all(16.0),
                            itemCount: name.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setNewState(() {
                                    selectedStaff = name[index];
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: selectedStaff == name[index]
                                          ? const Color(0xffEDE6FD)
                                          : AppColor.kWhiteColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xff848484)
                                                .withOpacity(0.1),
                                            offset: const Offset(0, 4),
                                            blurRadius: 24,
                                            spreadRadius: -4)
                                      ]),
                                  child: ListTile(
                                    visualDensity: const VisualDensity(),
                                    isThreeLine: false,
                                    leading: Badge(
                                      backgroundColor: const Color(0xff16A34A),
                                      child: Container(
                                        height: 56,
                                        width: 56,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            image: DecorationImage(
                                                image: AssetImage(photo[index]),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    title: Text(
                                      name[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xff1C1C1C)),
                                    ),
                                    subtitle: Text(
                                      service[index],
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                          color: selectedStaff == name[index]
                                              ? AppColor.kTitleColor
                                              : const Color(0xff6F6F6F)),
                                    ),
                                    trailing: selectedStaff == name[index]
                                        ? const Icon(
                                            Icons.check_circle,
                                            size: 20,
                                            color: AppColor.kMainColor,
                                          )
                                        : const Icon(
                                            Icons.circle_outlined,
                                            size: 20,
                                          ),
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(height: 24),
                        InkWell(
                          onTap: () {
                            //print('dlkmklmcs');
                            setState(() {
                              isSelect = true;
                              // isSelect = !isSelect;
                            });
                            Navigator.pop(context);
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BookingDtails(process: 0)));
                          },
                          child: Container(
                            height: 48,
                            // width: 335,
                            decoration: const BoxDecoration(
                                color: Color(0xff6850F3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: const Center(
                                child: Text(
                              'Confirm',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFFFF),
                                  fontSize: 16),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          });
        });
  }

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
                  Text(
                    'Are You Sure',
                    style: textTheme.headlineLarge,
                  ),
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
                                border: Border.all(
                                    color:const Color(0xffDC2626), width: 1)),
                            child: Text(
                              'No, Rejected',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:const Color(0xffDC2626)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            showAvailableStaff();
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: color.surface,
        appBar: AppBar(
          surfaceTintColor: color.surface,
          title: Text(
            'Booking Details',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 32,
                    width: 84,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: widget.process == 0
                          ? const Color(0xffFFF2E5)
                          : widget.process == 1
                              ? const Color(0xffEDE6FD)
                              : widget.process == 2
                                  ? const Color(0xffEFF6FF)
                                  : widget.process == 3
                                      ? const Color(0xffDCFCE7)
                                      : const Color(0xffFEE2E2),
                    ),
                    child: Text(
                        widget.process == 0
                            ? 'Pending'
                            : widget.process == 1
                                ? 'Accepted'
                                : widget.process == 2
                                    ? 'In Progress'
                                    : widget.process == 3
                                        ? 'Completed'
                                        : 'Rejected',
                        style: textTheme.titleSmall?.copyWith(
                            color: widget.process == 0
                                ? const Color(0xffFF902A)
                                : widget.process == 1
                                    ? const Color(0xff6850F3)
                                    : widget.process == 2
                                        ? const Color(0xff2563EB)
                                        : widget.process == 3
                                            ? const Color(0xff16A34A)
                                            : const Color(0xffDC2626)),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColor.kWhiteColor,
                          border: Border.all(
                              color: const Color(0xffEAEAEA), width: 1)),
                      child: const Icon(
                        Icons.print,
                        size: 20,
                        color: AppColor.kGreyTextColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 234,
                  // width: 335,
                  decoration: BoxDecoration(
                      color: AppColor.kWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 48,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Booking Id: ',
                                        style: textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.shadowColor)),
                                    TextSpan(
                                        text: '245148',
                                        style: textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: color.primary))
                                  ])),
                                  Text(
                                    '12 May 2024 - 10:30AM',
                                    style: textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    isDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: 48,
                                                  // width: 375,
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Color(
                                                                  0xffE6E6E9)))),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 25,
                                                        right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Booking Status',
                                                          style: textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600),
                                                        ),
                                                        CloseButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                //////////////////////////////////////////

                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      // Text('Booking ID:2652412'),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                    'Booking ID:',
                                                                    style: textTheme
                                                                        .titleMedium
                                                                        ?.copyWith(
                                                                        fontWeight: FontWeight
                                                                            .w600,
                                                                        color:
                                                                        AppColor.kGreyTextColor)),
                                                                TextSpan(
                                                                  text:
                                                                  ' 2652412',
                                                                  style: textTheme
                                                                      .titleMedium
                                                                      ?.copyWith(
                                                                      fontWeight:
                                                                      FontWeight.w600),
                                                                )
                                                              ])),

                                                      TimelineTile(
                                                        axis: TimelineAxis
                                                            .vertical,
                                                        alignment:
                                                        TimelineAlign
                                                            .manual,
                                                        lineXY: 0.35,
                                                        isFirst: true,
                                                        startChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                            bottom: 12.0,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 15),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  '05 Sep 2024',
                                                                  style: textTheme
                                                                      .titleSmall
                                                                      ?.copyWith(
                                                                      fontWeight:
                                                                      FontWeight.w500),
                                                                ),
                                                                Text(
                                                                  '10:35 PM',
                                                                  style: textTheme.bodySmall?.copyWith(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      fontSize:
                                                                      12),
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        indicatorStyle:
                                                        IndicatorStyle(
                                                            width: 40,
                                                            indicator:
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: color
                                                                  .primary,
                                                            ),
                                                            // color:,
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right:
                                                                4.0,
                                                                top:
                                                                1)),
                                                        endChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              12.0),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 20),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                    'Assigned Booking',
                                                                    style: textTheme
                                                                        .titleSmall
                                                                        ?.copyWith(
                                                                        fontWeight: FontWeight.w500)),
                                                                Text(
                                                                  'Booing has been assigned ',
                                                                  style: textTheme.bodySmall?.copyWith(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      fontSize:
                                                                      12),
                                                                  //style: kTextStyle.copyWith(fontSize: 12,color: kSubTitleColor),
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        beforeLineStyle:
                                                        LineStyle(
                                                            color: color
                                                                .primary,
                                                            thickness: 1),
                                                      ),
                                                      TimelineTile(
                                                        axis: TimelineAxis
                                                            .vertical,
                                                        alignment:
                                                        TimelineAlign
                                                            .manual,
                                                        lineXY: 0.35,
                                                        startChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              12.0),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 20),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  '06 Sep 2024',
                                                                  style: textTheme
                                                                      .titleSmall
                                                                      ?.copyWith(
                                                                      fontWeight:
                                                                      FontWeight.w500),
                                                                ),
                                                                Text(
                                                                  '10:35 PM',
                                                                  style: textTheme.bodySmall?.copyWith(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      fontSize:
                                                                      12),
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        indicatorStyle:
                                                        IndicatorStyle(
                                                            width: 40,
                                                            indicator:
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: color
                                                                  .primary,
                                                            ),
                                                            color: color
                                                                .primary,
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right:
                                                                4.0,
                                                                top:
                                                                1)),
                                                        endChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              12.0),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 20),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  'Pending',
                                                                  style: textTheme
                                                                      .titleSmall
                                                                      ?.copyWith(
                                                                      fontWeight:
                                                                      FontWeight.w500),
                                                                ),
                                                                Text(
                                                                  'Booing has been assigned ',
                                                                  style: textTheme.bodySmall?.copyWith(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      fontSize:
                                                                      12),
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        beforeLineStyle:
                                                        LineStyle(
                                                            color: color
                                                                .primary,
                                                            thickness: 1),
                                                      ),
                                                      TimelineTile(
                                                        axis: TimelineAxis
                                                            .vertical,
                                                        alignment:
                                                        TimelineAlign
                                                            .manual,
                                                        lineXY: 0.35,
                                                        startChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                '05 Sep 2024',
                                                                style: textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              Text(
                                                                '10:35 PM',
                                                                style: textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    12),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        indicatorStyle:
                                                        IndicatorStyle(
                                                            width: 40,
                                                            indicator:
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: color
                                                                  .primary,
                                                            ),
                                                            // color:,
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right:
                                                                4.0,
                                                                top:
                                                                1)),
                                                        endChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                'Accepted',
                                                                style: textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              Text(
                                                                'Booing has been Accepted',
                                                                style: textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    12),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        beforeLineStyle:
                                                        LineStyle(
                                                          color:
                                                          color.primary,
                                                          thickness: 1,
                                                        ),
                                                      ),
                                                      TimelineTile(
                                                        axis: TimelineAxis
                                                            .vertical,
                                                        alignment:
                                                        TimelineAlign
                                                            .manual,
                                                        lineXY: 0.35,
                                                        startChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                '05 Sep 2024',
                                                                style: textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              Text(
                                                                '10:35 PM',
                                                                style: textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    12),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        indicatorStyle:
                                                        IndicatorStyle(
                                                            width: 40,
                                                            indicator:
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: color
                                                                  .primary,
                                                            ),
                                                            // color:,
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right:
                                                                4.0,
                                                                top:
                                                                1)),
                                                        endChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                'In progress',
                                                                style: textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              Text(
                                                                'Booing has been In progress',
                                                                style: textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    12),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        beforeLineStyle:
                                                        LineStyle(
                                                            color: color
                                                                .primary,
                                                            thickness: 1),
                                                      ),
                                                      TimelineTile(
                                                        axis: TimelineAxis
                                                            .vertical,
                                                        alignment:
                                                        TimelineAlign
                                                            .manual,
                                                        lineXY: 0.35,
                                                        startChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                '05 Sep 2024',
                                                                style: textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              Text(
                                                                '10:35 PM',
                                                                style: textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    12),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        indicatorStyle:
                                                        IndicatorStyle(
                                                            width: 40,
                                                            indicator:
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: color
                                                                  .primary,
                                                            ),
                                                            // color:,
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right:
                                                                4.0,
                                                                top:
                                                                1)),
                                                        endChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                'Completed',
                                                                style: textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              Text(
                                                                'Booing has been completed',
                                                                style: textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    12),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        beforeLineStyle:
                                                        LineStyle(
                                                            color: color
                                                                .primary,
                                                            thickness:
                                                            1.0),
                                                      ),
                                                      TimelineTile(
                                                        axis: TimelineAxis
                                                            .vertical,
                                                        alignment:
                                                        TimelineAlign
                                                            .manual,
                                                        lineXY: 0.35,
                                                        startChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                '05 Sep 2024',
                                                                style: textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              Text(
                                                                '10:35 PM',
                                                                style: textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    12),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        indicatorStyle:
                                                        IndicatorStyle(
                                                            width: 50,
                                                            indicator:
                                                            Container(
                                                              height: 25,
                                                              width: 25,
                                                              decoration:
                                                              const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Color(
                                                                    0xffEAEAEA),
                                                              ),
                                                              child:
                                                              const Icon(
                                                                CommunityMaterialIcons
                                                                    .circle,
                                                                size: 15,
                                                                color: Color(
                                                                    0xffB7B7B7),
                                                              ),
                                                            ),
                                                            //color: Colors.green,
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right:
                                                                4.0)),
                                                        endChild: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                'Rejected',
                                                                style: textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              Text(
                                                                'Booing has been pending',
                                                                style: textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500,
                                                                    fontSize:
                                                                    12),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        beforeLineStyle:
                                                        LineStyle(
                                                          thickness: 1,
                                                          color:
                                                          color.primary,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )

                                                ////////////////////////////////////////////
                                              ],
                                            );
                                      });
                                    });
                              },
                              child: Container(
                                height: 48,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: color.primary),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: AppColor.kWhiteColor,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'View',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: AppColor.kWhiteColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 80, // Increased height to accommodate text
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: processList.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: TimelineTile(
                                          axis: TimelineAxis.horizontal,
                                          alignment: TimelineAlign.manual,
                                          lineXY: 0.35,
                                          isFirst: index == 0,
                                          isLast:
                                              index == processList.length - 1,
                                          indicatorStyle: const IndicatorStyle(
                                            width: 20,
                                            indicator: Icon(
                                              Icons.check_circle,
                                              color: Color(
                                                  0xffEAEAEA), // Replace with your color
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0.5, vertical: 1),
                                          ),
                                          beforeLineStyle: const LineStyle(
                                            color: AppColor
                                                .kLightNeaturalColor, // Replace with your color
                                            thickness: 1,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 5),
                                      Text(
                                        processList[index],
                                        style: textTheme.titleSmall?.copyWith(
                                            fontSize: 12,
                                            color:
                                                AppColor.kLightNeaturalColor),
                                      ),
                                    ],
                                  );
                                })),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Booking Summary',maxLines: 1,overflow: TextOverflow.ellipsis,
                          style: textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Booking Date: ',
                              style: textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: '8 Dec 2024 - 11am 12 pm,',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w400))
                        ])),
                        RichText(overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Address: ',
                            style: textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                              text: 'House 57, Road 25, Block A, Banani',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w400))
                        ]))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 138,
                  // width: 335,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kWhiteColor),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(overflow: TextOverflow.ellipsis,maxLines: 1,
                          'About Customer ',
                          style: textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        ///////
                        const SizedBox(
                          height: 10,
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
                                        image:
                                            AssetImage('images/book1.jpeg'))),
                              ),
                              Positioned(
                                left: 66,
                                top: 10,
                                child: Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                      border: Border.all(
                                          color: AppColor.kWhiteColor,
                                          width: 1)),
                                ),
                              )
                            ]),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shaidul Islam',maxLines: 1,overflow: TextOverflow.ellipsis,
                                    style: textTheme.headlineMedium,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            _makePhoneCall('1234567890');
                                          },
                                          child: Container(
                                            height: 32,
                                            // width: 105,

                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: color.primary,
                                                    width: 1),
                                                color: color.primary),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.phone_in_talk,
                                                  color: AppColor.kWhiteColor,
                                                  size: 18,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Call',
                                                  style: textTheme.titleSmall
                                                      ?.copyWith(
                                                          color: AppColor
                                                              .kWhiteColor),
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
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const AcnooMessageScreen()));
                                          },
                                          child: Container(
                                            height: 32,
                                            //width: 105,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: color.primary,
                                                    width: 1)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.chat,
                                                  color: color.primary,
                                                  size: 18,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Chat',
                                                  style: textTheme.titleSmall
                                                      ?.copyWith(
                                                          color: color.primary),
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
                // if (isSelect == true)
                Visibility(
                  visible: selectedStaff?.isNotEmpty ?? false,
                  child: Container(
                    height: 148,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.kWhiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff848484).withOpacity(0.1),
                              offset: const Offset(0, 4),
                              blurRadius: 24,
                              spreadRadius: -4)
                        ]),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Staffs',
                            style: textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          ///////
                          const SizedBox(
                            height: 10,
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
                                          image:
                                              AssetImage('images/book2.jpeg'),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  left: 66,
                                  top: 10,
                                  child: Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                        border: Border.all(
                                            color: AppColor.kWhiteColor,
                                            width: 1)),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rakibul Islma',
                                      style: textTheme.headlineMedium,
                                    ),
                                    Text(
                                      'AC Service',
                                      style: textTheme.titleMedium?.copyWith(
                                          color: AppColor.kGreyTextColor),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              _makePhoneCall('1234567890');
                                            },
                                            child: Container(
                                              height: 32,
                                              // width: 105,

                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: color.primary,
                                                      width: 1),
                                                  color: color.primary),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.phone_in_talk,
                                                    color: AppColor.kWhiteColor,
                                                    size: 18,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Call',
                                                    style: textTheme.titleSmall
                                                        ?.copyWith(
                                                            color: AppColor
                                                                .kWhiteColor),
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
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          const AcnooMessageScreen()));
                                            },
                                            child: Container(
                                              height: 32,
                                              //width: 105,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: color.primary,
                                                      width: 1)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chat,
                                                    color: color.primary,
                                                    size: 18,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Chat',
                                                    style: textTheme.titleSmall
                                                        ?.copyWith(
                                                            color:
                                                                color.primary),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 118,
                  //width: 335,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kWhiteColor),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment Method',
                              style: textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 32,
                                width: 84,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xffFEF2F2)),
                                child: Text(
                                  'Unpaid',
                                  style: textTheme.titleMedium?.copyWith(
                                    color: const Color(0xffDC2626),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Payment by: ',
                              style: textTheme.titleMedium?.copyWith(
                                  color: AppColor.kGreyTextColor,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: 'Pay Offline',
                              style: textTheme.titleMedium?.copyWith(
                                  color: AppColor.kGreyTextColor,
                                  fontWeight: FontWeight.w400))
                        ])),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Total Amount: ',
                              style: textTheme.titleMedium?.copyWith(
                                  color: AppColor.kGreyTextColor,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: '\$900',
                              style: textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600))
                        ])),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 356,
                  // width: 335,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kWhiteColor),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 32,
                            //width: 315,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColor.kLightNeaturalColor,
                                        width: 1))),
                            child: Text(
                              'Service Summary',
                              style: textTheme.titleLarge,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 62,
                          //width: 315,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColor.kLightNeaturalColor,
                                      width: 1))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'AC Cooling Problem',
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Qty: ',
                                        style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text: '1',
                                        style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w500))
                                  ])),
                                  Text(
                                    '\$500',
                                    style: textTheme.titleSmall,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 86,
                          //width: 315,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: AppColor.kLightNeaturalColor,
                                  width: 1),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Extra Service',
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Ac Cleaning and Sanitization',
                                style: textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Qty: ',
                                        style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text: '1',
                                        style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w500))
                                  ])),
                                  Text(
                                    '\$500',
                                    style: textTheme.titleSmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total',
                              style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.kGreyTextColor),
                            ),
                            Text(
                              '\$1000.00',
                              style: textTheme.titleMedium,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.kGreyTextColor),
                            ),
                            Text(
                              '-\$50',
                              style: textTheme.titleMedium,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Coupon Discount',
                              style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.kGreyTextColor),
                            ),
                            Text(
                              '\$50',
                              style: textTheme.titleMedium,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: color.primary),
                            ),
                            Text(
                              '\$900',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: color.primary),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xffDC2626))),
                    child: Text(
                      'Rejected',
                      style: textTheme.titleMedium?.copyWith(
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
                    {
                      approveDilog(context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: color.primary),
                    child: Text(
                      'Approve',
                      style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.kWhiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        );
  }
}
