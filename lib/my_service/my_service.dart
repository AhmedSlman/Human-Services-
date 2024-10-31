
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:handyman_provider/my_service/add_new_service.dart';
import 'package:handyman_provider/my_service/service_details.dart';

import '../Widget/Const Data/details.dart';

class MyService extends StatefulWidget {
  const MyService({super.key});

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  bool isSelected = false;
  List<String> pic=[
    'images/recent1.jpeg',
    'images/recent2.png',
    'images/recent3.jpeg',
    'images/Services.jpeg',
    'images/view1.jpeg',
    'images/recent2.png',
  ];
  List<String> service=[
    'Ac Servicing ',
    'Gas Stove Leak Repair',
    'AC Cooling Problem',
    'House cleaning ',
    'House cleaning service',
    'House cleaning ',
  ];
  List<String> service2=[
    'Stove Repair',
    'AC Repair',
    'Stove Repair',
    'AC Repair',
    'Stove Repair',
    'AC Repair',
  ];
  String searchQuery = '';
  List<String> filteredLanguageList = [];
  List<bool> favouriteList = [];
  @override
  void initState() {
    super.initState();
    filteredLanguageList = service;
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color =Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('My Service'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddNewService()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 32,
                width: 86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: color.primary,width: 1),
                ),
                child: Text('Add New',style: textTheme.titleSmall?.copyWith(color: color.primary),),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.kWhiteColor,
                    borderRadius: BorderRadius.circular(30)
                  ),
                    child: TextFormField(
                      onChanged: (query) {
                        setState(() {
                          searchQuery = query;
                          // Update filtered list when query changes
                          filteredLanguageList = service.where((language) {
                            return language.toLowerCase().contains(searchQuery.toLowerCase());
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
                    ),)),
                const SizedBox(width: 10,),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){
                  setState(() {
                    isSelected=!isSelected;
                  });
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(shape: BoxShape.circle,color: AppColor.kWhiteColor),
                    child:isSelected==true?SvgPicture.asset(
                      'images/list.svg',
                    ):Icon(Icons.grid_view,size: 25,color: color.primary,),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child:isSelected==true?
                filteredLanguageList.isNotEmpty?
            serviceListView( color, textTheme): Center(
                  child: Text('No Result Fount',style: textTheme.bodyMedium,),
                ):serviceGridView(color, textTheme))
          ],
        ),
      ),
    );
  }



  ///////////////////////////My Service List/////////////////////////





  ListView serviceListView (ColorScheme color,TextTheme textTheme) {
    return  ListView.builder(
        scrollDirection: Axis.vertical,
       // shrinkWrap: true,
        itemCount:filteredLanguageList.length,
        physics: const ScrollPhysics(),
        itemBuilder:(context,index){
        final myView= EditDetails(
            name: filteredLanguageList[index],
            subtitle:service2[index],
            image: pic[index], userName: '', address: '', designation: '',
            phone: '', price: '\$5,000.00', discount: '', time: 0, email: '', city: '', state: '', zipCode: 0,
            photo: [
              'images/recent1.jpeg',
              'images/recent2.png',
              'images/recent3.jpeg',
              'images/Services.jpeg',
              'images/view1.jpeg',
              'images/recent2.png',]);
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: (){
               Navigator.push(context,MaterialPageRoute(builder: (_)=>ServicesDetails(myView: myView, initialIndex: index,)));
              },
              child: Container(
                height: 112,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:color.primaryContainer ,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: -4
                      )
                    ]
                ),
                child: Row(
                  children: [
                    Container(
                      height:112,
                      width: 100,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
                          image: DecorationImage(image: AssetImage(myView.photo[index % myView.photo.length]),fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 7, 8, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(myView.name,style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(myView.subtitle,style:textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,maxLines: 1,),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(myView.price,style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star,color: AppColor.kRatingColor,size: 14,),
                                RichText(maxLines: 1,overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '4.5 ',style: textTheme.bodyMedium?.copyWith(fontSize: 12,fontWeight: FontWeight.w400)
                                    ),
                                    TextSpan(
                                      text: '(20 Review)',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400,fontSize: 12)
                                    )
                                  ]
                                ))
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
        });
  }



  /////////////////////////////My Service Grid/////////////////////////


  Column serviceGridView(ColorScheme color, TextTheme textTheme) {
    return Column(
      children: [
        filteredLanguageList.isNotEmpty
            ? Expanded(
          child: GridView.builder(
              itemCount: filteredLanguageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.68,
              ),
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final myView = EditDetails(
                    name: filteredLanguageList[index],
                    subtitle: service2[index],
                    image: pic[index],
                    userName: '',
                    address: '',
                    designation: '',
                    phone: '',
                    price: '\$5,000.00',
                    discount: '',
                    time: 0,
                    email: '',
                    city: '',
                    state: '',
                    zipCode: 0,
                    photo: [
                      'images/recent1.jpeg',
                      'images/recent2.png',
                      'images/recent3.jpeg',
                      'images/Services.jpeg',
                      'images/view1.jpeg',
                      'images/recent2.png',
                    ]);
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ServicesDetails(
                                myView: myView, initialIndex: index,)));
                  },
                  child: Container(
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
                                  image: AssetImage(myView.photo[
                                  index % myView.photo.length]),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myView.name,
                                style: textTheme.titleMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                myView.subtitle,maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                myView.price,maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColor.kRatingColor,
                                    size: 14,
                                  ),
                                  RichText(maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: '4.5 ',
                                            style: textTheme.bodyMedium
                                                ?.copyWith(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w400)),
                                        TextSpan(
                                            text: '(20 Review)',
                                            style: textTheme.bodySmall
                                                ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12))
                                      ]))
                                ],
                              )
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
            'No Result Found',
            style: textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
