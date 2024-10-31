import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:handyman_provider/booking/booking_detiles.dart';

class Booking extends StatefulWidget {
  const Booking({
    super.key,
  });

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<String> option = [
    'All',
    'Pending',
    'Accepted',
    'In progress',
    'Completed',
    'Rejected',
  ];
  List<String> option2 = [
    'Pending',
    'Accepted',
    'In progress',
    'Completed',
    'Rejected',
  ];
  List<String> optionphoto = [
    'images/recent1.jpeg',
    'images/recent2.png',
    'images/recent3.jpeg',
    'images/view1.jpeg',
    'images/Services.jpeg',
  ];

  bool isSearch = false;
  bool istab = false;
  String selectedFilter = 'All';
  List<bool> status = [];
  int _selectedIndex = 0;

  String searchQuery = '';
  List<String> filteredLanguageList = [];
  @override
  void initState() {
    super.initState();
    filteredLanguageList =option2;
  }


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Scaffold(
            backgroundColor: color.surface,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: color.surface,
              elevation: 0.0,
              title: isSearch
                  ? TypeAheadField(
                      suggestionsCallback: (pattern) {
                        return filteredLanguageList
                            .where((fruit) => fruit
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      builder: (context, controller, focusNode) {
                        return TextFormField(
                            onChanged: (query) {
                              setState(() {
                                searchQuery = query;
                                // Update filtered list when query changes
                                filteredLanguageList =option2.where((language) {
                                  return language
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase());
                                }).toList();
                              });
                            },
                            controller: controller,
                            focusNode: focusNode,
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: mTextStyle,
                                suffixIcon: const Icon(
                                  FeatherIcons.search,
                                  color: AppColor.kGreyTextColor,
                                )));
                      },
                      itemBuilder: (context, suggestion) {
                        return Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColor.kLightNeaturalColor,
                                      width: 1))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                            child: Text(suggestion.toString()),
                          ),
                        );
                      },
                      onSelected: (suggestion) {
                        setState(() {
                          //selectPlace = suggestion.toString();
                        });
                      },
                    )
                  : const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Booking'),
                    ),
              actions: [
                if (!isSearch)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSearch = !isSearch;
                      });
                    },
                    child: const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          FeatherIcons.search,
                        )),
                  )
              ],
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                //dragStartBehavior:DragStartBehavior.,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelPadding: const EdgeInsets.only(right: 12),
                indicatorWeight: 1,
                indicatorColor: Colors.transparent,
                padding: EdgeInsets.zero,
                isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                tabs: List.generate(6, (index) {
                  final isSelected = _selectedIndex == index;
                  return Container(
                    height: 40,
                    margin: EdgeInsets.only(left: index == 0 ? 0 : 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected ? color.primary : Colors.transparent,
                        border: Border.all(
                            color: AppColor.kLightNeaturalColor, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        option[index],
                        style: textTheme.titleMedium?.copyWith(
                            color: isSelected
                                ? AppColor.kWhiteColor
                                : AppColor.kGreyTextColor),
                      ),
                    ),
                  );
                }),
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
                children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: option2.length,
                    scrollDirection: Axis.vertical,
                    //physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BookingDtails(
                                          process: index,
                                        )));
                          },
                          child: Container(
                            height: 127,
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
                                          image:
                                              AssetImage(optionphoto[index]),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Booing ID: 215464',maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: textTheme.titleMedium,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: 'Price:',
                                              style: textTheme.bodySmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400)),
                                          TextSpan(
                                              text: '\$900',
                                              style: textTheme.bodySmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColor
                                                          .kTitleColor))
                                        ])),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          'Date: 8 Dec 2024 - 11am 12 pm',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.bodySmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.w400),
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
                                                        BorderRadius.circular(
                                                            4),
                                                    color: 'Pending' ==
                                                            option2[index]
                                                        ? const Color(
                                                            0xffFFF2E5)
                                                        : 'Accepted' ==
                                                                option2[index]
                                                            ? const Color(
                                                                0xffEDE6FD)
                                                            : 'In progress' ==
                                                                    option2[
                                                                        index]
                                                                ? const Color(
                                                                    0xffEFF6FF)
                                                                : 'Completed' ==
                                                                        option2[
                                                                            index]
                                                                    ? const Color(
                                                                        0xffDCFCE7)
                                                                    : const Color(
                                                                        0xffFEE2E2)),
                                                child: Text(
                                                 option2[index],maxLines: 1,overflow: TextOverflow.ellipsis,

                                                  // 'Pending'==option[index]?
                                                  //   'Pending':
                                                  //   'Accepted'==option[index]?
                                                  //       'Accepted':
                                                  //   'In progress'==option[index]?
                                                  //           'In progress':
                                                  //   'Completed'==option[index]?
                                                  //               'Completed':
                                                  //   'Rejected'==option[index]?
                                                  //                   'Rejected':
                                                  // option2[index],
                                                  style: textTheme.bodySmall
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: 'Pending' ==
                                                                  option2[
                                                                      index]
                                                              ? const Color(
                                                                  0xffFF902A)
                                                              : 'Accepted' ==
                                                                      option2[
                                                                          index]
                                                                  ? const Color(
                                                                      0xff6850F3)
                                                                  : 'In progress' ==
                                                                          option2[
                                                                              index]
                                                                      ? const Color(
                                                                          0xff2563EB)
                                                                      : 'Completed' ==
                                                                              option2[index]
                                                                          ? const Color(0xff16A34A)
                                                                          : const Color(0xffDC2626)),
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
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                        color: AppColor
                                                            .kLightNeaturalColor,
                                                        width: 1)),
                                                child: Text(
                                                  'View Details ',maxLines: 1,overflow: TextOverflow.ellipsis,
                                                  style: textTheme.bodySmall
                                                      ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500,
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
                        ),
                      );
                    }),
              ),
              /////////////////////////////////////////////////// Pending ///////////////////////////
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: option2.length,
                    scrollDirection: Axis.vertical,
                    //physics: const ScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>BookingDtails(process: index,)));
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
                                          image: AssetImage(optionphoto[index]),
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
                                          'Booing ID: 215464',maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: textTheme.titleMedium,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        RichText(
                                          maxLines: 1,overflow: TextOverflow.ellipsis,
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
                                          'Date: 8 Dec 2024 - 11am 12 pm',maxLines: 1,overflow: TextOverflow.ellipsis,
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
                                                    color: const Color(0xffFFF2E5)
                                                    // 'Pending'==option2[index]?
                                                    // const Color(0xffFFF2E5):
                                                    // 'Accepted'==option2[index]?
                                                    // const Color(0xffEDE6FD):
                                                    // 'In progress'==option2[index]?
                                                    // const Color(0xffEFF6FF):
                                                    // 'Completed'==option2[index]?
                                                    // const Color(0xffDCFCE7):
                                                    // const Color(0xffFEE2E2)
                                                ),
                                                child: Text('Pending',maxLines: 1,overflow: TextOverflow.ellipsis,
                                                  style: textTheme.bodySmall
                                                      ?.copyWith(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: const Color(0xffFF902A)
                                                      // 'Pending'==option2[index]?
                                                      // const Color(0xffFF902A):
                                                      // 'Accepted'==option2[index]?
                                                      // const Color(0xff6850F3):
                                                      // 'In progress'==option2[index]?
                                                      // const Color(0xff2563EB):
                                                      // 'Completed'==option2[index]?
                                                      // const Color(0xff16A34A):
                                                      // const Color(0xffDC2626)
                                                  ),
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
                                                  'View Details ',maxLines: 1,overflow: TextOverflow.ellipsis,
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
                        ),
                      );
                    }),
              ),
              /////////////////////////////////////////////////// Accepted ///////////////////////////
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: option2.length,
                    scrollDirection: Axis.vertical,
                    //physics: const ScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>BookingDtails(process: index,)));
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
                                          image: AssetImage(optionphoto[index]),
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
                                          'Booing ID: 215464',overflow: TextOverflow.ellipsis,maxLines: 1,
                                          style: textTheme.titleMedium,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        RichText(maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                        Text(overflow: TextOverflow.ellipsis,maxLines: 1,
                                          'Date: 8 Dec 2024 - 11am 12 pm',
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
                                                    color: const Color(0xffEDE6FD)
                                                  // 'Pending'==option2[index]?
                                                  // const Color(0xffFFF2E5):
                                                  // 'Accepted'==option2[index]?
                                                  // const Color(0xffEDE6FD):
                                                  // 'In progress'==option2[index]?
                                                  // const Color(0xffEFF6FF):
                                                  // 'Completed'==option2[index]?
                                                  // const Color(0xffDCFCE7):
                                                  // const Color(0xffFEE2E2)
                                                ),
                                                child: Text('Accepted',
                                                  style: textTheme.bodySmall
                                                      ?.copyWith(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: const Color(0xff6850F3)
                                                    // 'Pending'==option2[index]?
                                                    // const Color(0xffFF902A):
                                                    // 'Accepted'==option2[index]?
                                                    // const Color(0xff6850F3):
                                                    // 'In progress'==option2[index]?
                                                    // const Color(0xff2563EB):
                                                    // 'Completed'==option2[index]?
                                                    // const Color(0xff16A34A):
                                                    // const Color(0xffDC2626)
                                                  ),
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
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
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
                        ),
                      );
                    }),
              ),
              /////////////////////////////////////////////////// In Progress ///////////////////////////
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: option2.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>BookingDtails(process: index,)));
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
                                          image: AssetImage(optionphoto[index]),
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
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.titleMedium,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        RichText(maxLines: 1,overflow: TextOverflow.ellipsis,
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
                                          'Date: 8 Dec 2024 - 11am 12 pm',overflow: TextOverflow.ellipsis,maxLines: 1,
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
                                                    color: const Color(0xffEFF6FF)
                                                  // 'Pending'==option2[index]?
                                                  // const Color(0xffFFF2E5):
                                                  // 'Accepted'==option2[index]?
                                                  // const Color(0xffEDE6FD):
                                                  // 'In progress'==option2[index]?
                                                  // const Color(0xffEFF6FF):
                                                  // 'Completed'==option2[index]?
                                                  // const Color(0xffDCFCE7):
                                                  // const Color(0xffFEE2E2)
                                                ),
                                                child: Text('In Progress',
                                                  maxLines: 1,overflow: TextOverflow.ellipsis,
                                                  style: textTheme.bodySmall
                                                      ?.copyWith(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: const Color(0xff2563EB)
                                                    // 'Pending'==option2[index]?
                                                    // const Color(0xffFF902A):
                                                    // 'Accepted'==option2[index]?
                                                    // const Color(0xff6850F3):
                                                    // 'In progress'==option2[index]?
                                                    // const Color(0xff2563EB):
                                                    // 'Completed'==option2[index]?
                                                    // const Color(0xff16A34A):
                                                    // const Color(0xffDC2626)
                                                  ),
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
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
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
                        ),
                      );
                    }),
              ),
              /////////////////////////////////////////////////// Completed ///////////////////////////
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: option2.length,
                    scrollDirection: Axis.vertical,
                    //physics: const ScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>BookingDtails(process: index,)));
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
                                          image: AssetImage(optionphoto[index]),
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
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.titleMedium,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        RichText(
                                          maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
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
                                                    color: const Color(0xffDCFCE7)
                                                  // 'Pending'==option2[index]?
                                                  // const Color(0xffFFF2E5):
                                                  // 'Accepted'==option2[index]?
                                                  // const Color(0xffEDE6FD):
                                                  // 'In progress'==option2[index]?
                                                  // const Color(0xffEFF6FF):
                                                  // 'Completed'==option2[index]?
                                                  // const Color(0xffDCFCE7):
                                                  // const Color(0xffFEE2E2)
                                                ),
                                                child: Text('Completed',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: textTheme.bodySmall
                                                      ?.copyWith(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: const Color(0xff16A34A)
                                                    // 'Pending'==option2[index]?
                                                    // const Color(0xffFF902A):
                                                    // 'Accepted'==option2[index]?
                                                    // const Color(0xff6850F3):
                                                    // 'In progress'==option2[index]?
                                                    // const Color(0xff2563EB):
                                                    // 'Completed'==option2[index]?
                                                    // const Color(0xff16A34A):
                                                    // const Color(0xffDC2626)
                                                  ),
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
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
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
                        ),
                      );
                    }),
              ),
              /////////////////////////////////////////////////// Rejected ///////////////////////////
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: option2.length,
                    scrollDirection: Axis.vertical,
                    //physics: const ScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>BookingDtails(process: index,)));
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
                                          image: AssetImage(optionphoto[index]),
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
                                          'Booing ID: 215464',maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.titleMedium,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        RichText(
                                          maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                                    color: const Color(0xffFEE2E2)
                                                  // 'Pending'==option2[index]?
                                                  // const Color(0xffFFF2E5):
                                                  // 'Accepted'==option2[index]?
                                                  // const Color(0xffEDE6FD):
                                                  // 'In progress'==option2[index]?
                                                  // const Color(0xffEFF6FF):
                                                  // 'Completed'==option2[index]?
                                                  // const Color(0xffDCFCE7):
                                                  // const Color(0xffFEE2E2)
                                                ),
                                                child: Text('Rejected',
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: textTheme.bodySmall
                                                      ?.copyWith(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: const Color(0xffDC2626)
                                                    // 'Pending'==option2[index]?
                                                    // const Color(0xffFF902A):
                                                    // 'Accepted'==option2[index]?
                                                    // const Color(0xff6850F3):
                                                    // 'In progress'==option2[index]?
                                                    // const Color(0xff2563EB):
                                                    // 'Completed'==option2[index]?
                                                    // const Color(0xff16A34A):
                                                    // const Color(0xffDC2626)
                                                  ),
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
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
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
                        ),
                      );
                    }),
              ),

            ]
            )
        ) //
        );
  }
}
