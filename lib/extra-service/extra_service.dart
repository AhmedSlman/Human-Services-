import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:handyman_provider/extra-service/extra_service_details.dart';
import 'package:handyman_provider/extra-service/new_extra_service.dart';

import '../Widget/Theme/theme_constants.dart';

class ExtraService extends StatefulWidget {
  const ExtraService({super.key});

  @override
  State<ExtraService> createState() => _ExtraServiceState();
}

class _ExtraServiceState extends State<ExtraService> {
  List<String> service = [
    'Ac Cleaning and Sanitization',
    'Ac Cleaning ',
    'Ac Cleaning and Sanitization',
    'Ac Cleaning',
    'Ac Cleaning and Sanitization',
    'Ac Cleaning ',
    'Ac Cleaning and Sanitization',
    'Ac Cleaning ',
  ];

  List<String> servicePhoto = [
    'images/recent2.png',
    'images/Services.jpeg',
    'images/view1.jpeg',
    'images/recent2.png',
    'images/Services.jpeg',
    'images/view1.jpeg',
    'images/recent2.png',
    'images/Services.jpeg',
  ];
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
    return  Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('Extra Service',style: textTheme.titleLarge,),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const NewExtraService()));
                },
                child: Container(
                  height: 32,
                  width: 86,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: color.primary,width: 1)),
                  child: Text('Add New',style: textTheme.titleSmall?.copyWith(color: color.primary),),
                ),
              ),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 42,
              decoration:  const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),color: AppColor.kWhiteColor
              ),
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
                  prefixIcon: Icon(FeatherIcons.search),
                  prefixIconColor: Color(0xff25314C),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 13.0), // Adjust padding as needed
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,

                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            filteredLanguageList.isNotEmpty?
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: filteredLanguageList.length,
                  itemBuilder:(context,index){
                  final details = EditDetails(
                      name:filteredLanguageList[index],
                      image: servicePhoto[index],
                      userName: '',
                      address: '',
                      designation: '',
                      phone: '',
                      subtitle: '', 
                      price: '', discount: '', time: 0, email: '', city: '', state: '', zipCode: 0, photo: []);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> ExtraServiceDetails(details: details,)));
                      },
                      child: Container(
                        height: 76,
                        decoration: BoxDecoration(
                          color: AppColor.kWhiteColor,
                          borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xff848484).withOpacity(0.1),
                                  offset: const Offset(0, 4),
                                  blurRadius: 24,
                                  spreadRadius: -4
                              )
                            ]
                        ),
                        child:  Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 66,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: AssetImage(details.image),
                                        fit: BoxFit.cover)
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    details.name,
                                    maxLines: 1,
                                    style: textTheme.titleMedium
                                        ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ),
                                  ///////////////////////


                                  Text(
                                    '\$100',
                                    style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
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
            ):const Center(
              child: Text('No Result Fount'),
            )
          ],
        ),
      ),
    );
  }
}
