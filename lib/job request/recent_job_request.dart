import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Widget/Const Data/details.dart';
import '../Widget/Theme/theme_constants.dart';
import '../view_detiles/view_detiles.dart';

class RecentJobRequest extends StatefulWidget {
  const RecentJobRequest({super.key});

  @override
  State<RecentJobRequest> createState() => _RecentJobRequestState();
}

class _RecentJobRequestState extends State<RecentJobRequest> {
  List<String> pic = [
    'images/recent1.jpeg',
    'images/recent2.png',
    'images/recent1.jpeg',
    'images/recent2.png',
    'images/recent1.jpeg',
    'images/recent2.png',
  ];
  List<String> service = [
    'Gas Stove Leak Repair',
    'AC Cooling Problem',
    'Gas Stove Leak Repair',
    'AC Cooling Problem',
    'Gas Stove Leak Repair',
    'AC Cooling Problem',
  ];
  int selected = 0;
  String searchQuery = '';
  List<String> filteredLanguageList = [];
  @override
  void initState() {
    super.initState();
    filteredLanguageList = service;
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
          'Recent Job Request',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              height: 20,
              width: 54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 0;
                        });
                      },
                      // Text()
                      child: selected == 1
                          ? SvgPicture.asset(
                              'images/grid.svg',
                              color: AppColor.kGreyTextColor,
                            )
                          : SvgPicture.asset(
                              'images/grid.svg',
                              color: color.primary,
                            )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 1;
                        });
                      },
                      child: selected == 1
                          ? Icon(
                              Icons.grid_view,
                              color: color.primary,
                              size: 20,
                            )
                          : const Icon(
                              Icons.grid_view,
                              color: AppColor.kGreyTextColor,
                              size: 20,
                            ))
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Column(
          children: [
            Container(
              height: 42,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: AppColor.kWhiteColor),
              child: TextFormField(
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                    // Update filtered list when query changes
                    filteredLanguageList = service.where((language) {
                      return language
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase());
                    }).toList();
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), // Replace FeatherIcons.search
                  prefixIconColor: Color(0xff25314C),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 13.0),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: selected == 0
                    ? filteredLanguageList.isNotEmpty
                        ? requestListView(color, textTheme)
                        : Center(
                            child: Text(
                              'No Result Fount',
                              style: textTheme.bodyMedium,
                            ),
                          )
                    : requestGridView(color, textTheme))
          ],
        ),
      ),
    );
  }

  ///////////////////////////////////

  ListView requestListView(ColorScheme color, TextTheme textTheme) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filteredLanguageList.length,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          final details = EditDetails(
            name: filteredLanguageList[index],
            image: pic[index],
            userName: '',
            address: '',
            designation: '',
            phone: '',
            subtitle: '', price: '', discount: '', time: 0, email: '', city: '', state: '', zipCode: 0, photo: [],
          );
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ViewDetiles(
                              details: details,
                            )));
              },
              child: Container(
                height: 127,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: color.primaryContainer,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
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
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: AssetImage(details.image),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 7, 8, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '25 March 2024',maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              details.name,maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '\$5,000.00',maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: color.primary, width: 1)),
                              child: Text(
                                'Requested',maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: textTheme.titleSmall
                                    ?.copyWith(color: color.primary),
                              ),
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
        });
  }

  /////////////////////////////
  Column requestGridView(ColorScheme color, TextTheme textTheme) {
    return Column(
      children: [
        filteredLanguageList.isNotEmpty ?? false
            ? Expanded(
                child: GridView.builder(
                    itemCount: filteredLanguageList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 0.70,
                    ),
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final details = EditDetails(
                        name: filteredLanguageList[index],
                        image: pic[index],
                        userName: '',
                        address: '',
                        designation: '',
                        phone: '',
                        subtitle: '', price: '', discount: '', time: 0, email: '', city: '', state: '', zipCode: 0, photo: [],
                      );
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ViewDetiles(
                                        details: details,
                                      )));
                        },
                        child: Container(
                          height: 228,
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
                              Container(
                                height: 112,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                        image: AssetImage(details.image),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '25 March 2024',maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      details.name,
                                      style: textTheme.titleMedium,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '\$5,000.00',maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 32,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: color.primary, width: 1)),
                                      child: Text(
                                        'Requested',maxLines: 1,overflow: TextOverflow.ellipsis,
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
                      );
                    }),
              )
            : Center(
                child: Text(
                  'No Result Fount',
                  style: textTheme.bodyMedium,
                ),
              )
      ],
    );
  }
}
