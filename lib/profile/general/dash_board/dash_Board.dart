import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';

import '../../../Widget/Const Data/details.dart';
import 'fi.dart';
import '../../../our_staff/view_details_staff.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {





  List<String> itmeList1=[
    'This Month',
    'Month',
  ];
  String selectedIndex1='This Month';
  DropdownButton<String> getbutton(){
    List<DropdownMenuItem<String>> menuItemList=[];
    for(var des in itmeList1){
      var item= DropdownMenuItem(
          value: des,
          child: Text(des,style: TextStyle(color: Color(0xff6F6F6F),fontSize: 14),));
      menuItemList.add(item);
    }
    return DropdownButton(
        dropdownColor:const Color(0xffEAEAEA),
        items: menuItemList,
        value: selectedIndex1,
        onChanged: (value){
          setState(() {
            selectedIndex1=value!;
          });
        });
  }






  List<String> photo = [
    'images/frem1.png',
    'images/frem2.png',
    'images/frem3.png',
    'images/frem4.png',
  ];
  List<String> number = [
    '\$50,00,000',
    '12',
    '12',
    '12',
  ];
  List<String> text=[
    'Total Earning',
    'Total Booking',
    'Total Staff',
    'Total Service',
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
  List<dynamic> colr=[
    const Color(0xff16A34A),
    const Color(0xffFF902A),
    const Color(0xff3B82F6),
    const Color(0xff702EFC),
  ];

  List<String> svg = [
    'images/Wallet.svg',
    'images/Document.svg',
    'images/User.svg',
    'images/Category.svg',
  ];
  List<bool> switchs = [];
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
          'Dashboard',
          style: textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 68,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage('images/dash.png'), fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$500.00',
                      style: textTheme.titleLarge
                          ?.copyWith(color: AppColor.kWhiteColor),
                    ),
                    Text(
                      'Current Balance',
                      style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400, color: const Color(0xffEAEAEA)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GridView.builder(
                shrinkWrap: true,
                  primary: false,
                  itemCount:photo.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 9,
                      mainAxisSpacing: 9,
                      childAspectRatio: 1.3
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          //color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage(photo[index]),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              alignment: Alignment.center,
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                               color: colr[index],
                               // color:
                              ),
                              child: SvgPicture.asset(svg[index]),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(number[index],style: textTheme.headlineMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(text[index],style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),maxLines: 1,overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    );
                  }),

            SizedBox(
              height: 24,
            ),
              Container(
                //height: 282,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                    color: AppColor.kWhiteColor,
                    boxShadow: [
                  BoxShadow(
                      color: const Color(0xff848484).withOpacity(0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 24,
                      spreadRadius: -4
                  )
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text('Revenue',style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: 32,
                            width: 112,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Color(0xffEAEAEA),width: 1)),
                            child: getbutton(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Monthly Revenue In',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500,color: Color(0xff656565)),),
                      SizedBox(
                        height: 4,
                      ),
                      Text('\$50,000.00',style: textTheme.headlineMedium?.copyWith(color: Color(0xff00AE1C)),),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 150,
                        child: AreaChart(),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text('Active & Online Staffs',style: textTheme.titleLarge,),
              SizedBox(
                height: 16,
              ),

              SizedBox(
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
                                  Positioned(
                                    top: 125,
                                    left: 80.5,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColor.kWhiteColor,
                                              width: 1),
                                          color: AppColor.kGreenColor),
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(staffdetails.name,style: textTheme.titleMedium,),
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
            ],
          ),
        ),
      ),
    );
  }
}
