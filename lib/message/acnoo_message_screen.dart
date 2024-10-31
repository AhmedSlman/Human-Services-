import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../../Widget/Theme/theme_constants.dart';
import 'acnoo_chat_screen.dart';
import 'chat_data.dart';

class AcnooMessageScreen extends StatefulWidget {
  const AcnooMessageScreen({super.key});

  @override
  State<AcnooMessageScreen> createState() => _AcnooMessageScreenState();
}

class _AcnooMessageScreenState extends State<AcnooMessageScreen> {
  //TODO: These lists is taken for demo purpose. replace with real data when working with APIs
  final users = MaanDemoGig.gigs;
  final List<String> demoTimes = [
    'Just Now',
    '4 hours ago',
    '2 days ago',
    '1 week ago',
    '26 Jun 2023',
    '26 Jun 2023',
    '26 Jun 2023',
    '26 Jun 2023',
    '26 Jun 2023',
    '26 Jun 2023',
  ];
  List<String> coustomer=[
    'Guy Hawkins',
    'Marvin McKinney',
    'Eleanor Pena',
    'Ronald Richards',
    'Annette Black',
    'Theresa Webb',
    'Arlene McCoy',
    'Darlene Robertson',
    'Robert Fox',
    'Savannah Nguyen',
  ];
  bool isSearch=false;
  bool showContainer=false;
  String selectPlace = '';
  String searchQuery = '';
  List<String> filteredLanguageList = [];
  @override
  void initState() {
    super.initState();
    filteredLanguageList = coustomer;
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme color=Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: color.surface,
        appBar: AppBar(
          surfaceTintColor: color.surface,
          elevation: 0.0,
          title: isSearch ?  TypeAheadField(
            suggestionsCallback: (pattern) {
              return coustomer
                  .where((fruit) => fruit.toLowerCase().contains(pattern.toLowerCase()))
                  .toList();
            },
            builder: (context, controller, focusNode) {
              return TextFormField(
                  onChanged: (query) {
                    setState(() {
                      searchQuery = query;
                      // Update filtered list when query changes
                      filteredLanguageList = coustomer.where((language) {
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
                      suffixIcon: const Icon(FeatherIcons.search,color: AppColor.kGreyTextColor,)
                  )
              );
            },
            itemBuilder: (context, suggestion) {
              return Container(
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.kLightNeaturalColor,width: 1))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                  child: Text(suggestion.toString()),
                ),
              );
            },
            onSelected: (suggestion) {
              setState(() {
                selectPlace = suggestion.toString();
              });
            },
          ): const Text('Messages'),
          actions: [
            if(!isSearch)
              GestureDetector(
                onTap: (){
                  setState(() {
                    isSearch = !isSearch;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xffEDE6FD)),
                      child: Icon(FeatherIcons.search,color: color.primary,),
                    )
                ),
              )
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          itemCount: users.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcnooChatScreen(
                        receiver: users[index], isActive: index < 3),
                  )),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: color.primaryContainer
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 44,
                        width: 44,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage(users[index].influencerImage.toString()))
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 0,
                              child: Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //TODO: Enter valid activity status logic when working with APIs
                                    color: index < 3
                                        ? const Color(0xff69B22A)
                                        : const Color(0xffbfbfbf),
                                    border:
                                    Border.all(color: AppColor.kWhiteColor)),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  users[index].influencerName,
                                  style: bTextStyle,
                                ),
                                Text(
                                  demoTimes[index],
                                  style: textTheme.bodySmall?.copyWith(fontSize: 12,color: const Color(0xffA4A4A4)),
                                )
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Hello Sir, How are you?',
                              style: textTheme.bodySmall,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
