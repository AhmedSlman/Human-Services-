import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../Widget/Theme/theme_constants.dart';


class ScheduleOrder extends StatefulWidget {
  const ScheduleOrder({super.key});

  @override
  State<ScheduleOrder> createState() => _ScheduleOrderState();
}

class _ScheduleOrderState extends State<ScheduleOrder> {
  List<String> date = [
    'Today',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
  List<String> number = [
    '12',
    '13',
    '14',
    '15',
    '16',
  ];
  List<String> time = [
    '10 AM - 11 AM',
    '11 AM - 12 AM',
    '12 PM - 1 PM',
    '1 PM - 2 PM',
    '2 PM - 3 PM',
    '3 PM - 4 PM',
    '4 PM - 5 PM',
    '9 PM - 10 PM'
  ];
  List<String> booked = [
    'Booked',
    'Booked',
    'Booked',
    'Booked',
    '',
    '',
    '',
    '',
  ];

  List<dynamic> colorr = [
    const Color(0xffDCFCE7),
    const Color(0xffDCFCE7),
    const Color(0xffDCFCE7),
    const Color(0xffDCFCE7),
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ];
  List<bool> favouriteList1 = [];

  int selectedIndex = -1;
  List<bool> favouriteList = [];
  DateTime selectedDate = DateTime.now();
  // Variable to keep track of the single selected item
  int? singleSelectedIndex;

  @override
  void initState() {
    super.initState();
    favouriteList = List.generate(time.length, (_) => false);
  }

  Future<void> getDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }
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
          'Schedule Order',
          style: textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 92,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  border:RDottedLineBorder.all(
                      color: const Color(0xffFF902A)
                  ),
                  color: const Color(0xffFFF1E4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xffFFC48D), width: 1),
                            color: AppColor.kWhiteColor),
                        child: const Icon(Icons.thumb_up_alt_outlined,
                            color: Color(0xffFF902A))),
                  ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Select a Schedule Slot',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              'Please select between our available time slots below for deliveryof your order',
                              style: textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 116,
              //width: 335,
              decoration: BoxDecoration(
                color: AppColor.kWhiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Date',
                          style: textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                getDate(context);
                              });
                            },
                            child: const Icon(
                              Icons.calendar_month_outlined,
                              size: 20,
                              color: AppColor.kGreyTextColor,
                            ))
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ListView.builder(
                          itemCount: number.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (favouriteList1.isEmpty) {
                              favouriteList1 =
                                  List.generate(date.length, (_) => false);
                            }

                            return Padding(
                              padding:
                              const EdgeInsets.only(right: 10, bottom: 10),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    for (int i = 0; i < favouriteList1.length; i++) {
                                      favouriteList1[i] = false;
                                    }
                                    // Set the current index to true
                                    favouriteList1[index] = true;
                                  });

                                },
                                child: Container(
                                  height: 60,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: favouriteList1[index]?const Color(0xffEDE6FD):Colors.transparent,
                                      border: Border.all(
                                          color:favouriteList1[index]?color.primary:AppColor.kGreyTextColor,
                                          width: 1)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        date[index],
                                        style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w500,color: favouriteList1[index]?color.primary:AppColor.kTitleColor),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        number[index],
                                        style: textTheme.headlineMedium?.copyWith(color: favouriteList1[index]?color.primary:AppColor.kTitleColor),
                                      )
                                    ],
                                  ),
                                ),
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
              height: 294,
              //width: 335,
              decoration: BoxDecoration(
                  color: AppColor.kWhiteColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 10, left: 15, bottom: 10),
                    child: Text('At What time should the service',
                        style: textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: GridView.builder(
                        itemCount: time.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3,
                        ),
                        itemBuilder: (context, index) {
                          bool isSelectable = index >= 4; // Only items from index 4 onwards are selectable

                          return InkWell(
                            onTap: () {
                              if (isSelectable) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              }
                            },
                            child: Container(
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelectable
                                      ? (selectedIndex == index ?color.primary : const Color(0xffEAEAEA))
                                      : const Color(0xffBBF7D0),
                                  width: 1,
                                ),
                                color: isSelectable
                                    ? (selectedIndex == index ?const Color(0xffEDE6FD) : Colors.transparent)
                                    : const Color(0xffDCFCE7),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    time[index],
                                    style: TextStyle(
                                      color: isSelectable
                                          ? (selectedIndex == index ? color.primary: Colors.black)
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    booked[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            height: 48,
            //width: 335,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color.primary),
            child: Text(
              'Save',
              style: textTheme.bodyLarge?.copyWith(
                  color: AppColor.kWhiteColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}


