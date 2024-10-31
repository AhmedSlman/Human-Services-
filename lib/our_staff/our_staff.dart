import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:handyman_provider/message/acnoo_message_screen.dart';
import 'package:handyman_provider/our_staff/add_new_staffs.dart';
import 'package:handyman_provider/our_staff/view_details_staff.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widget/Theme/theme_constants.dart';

class OurStaff extends StatefulWidget {
  const OurStaff({super.key});
  @override
  State<OurStaff> createState() => _OurStaffState();
}
class _OurStaffState extends State<OurStaff> {
  List<String> name =[
    'Wade Warren',
    'Ralph Edwards',
    'Wade Warren',
    'Ralph Edwards',
    'Wade Warren',
    'Ralph Edwards',
  ];
  List<String> work = [
    'Ac Service',
    'Cleaner',
    'Ac Service',
    'Cleaner',
    'Ac Service',
    'Cleaner',
  ];
  List<String> photo=[
    'images/staff1.jpeg',
    'images/staff2.jpeg',
    'images/staff3.jpeg',
    'images/staff4.jpeg',
    'images/staff5.jpeg',
    'images/staff6.jpeg',
  ];
  String searchQuery = '';
  List<String> filteredLanguageList = [];
  @override
  void initState() {
    super.initState();
    filteredLanguageList = name;
  }
  List<bool> staff = [];
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
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
       backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('Our Staffs',style: textTheme.titleLarge,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddNewStaffs()));
              },
              child: Container(
                height: 32,
                width: 86,
               alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: color.primary,width: 1)
                ),
                child: Text('Add New',style: textTheme.titleSmall?.copyWith(color: color.primary),),
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
              decoration:  const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),color: AppColor.kWhiteColor
              ),
              child: TextFormField(
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                    // Update filtered list when query changes
                    filteredLanguageList = name.where((language) {
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
              child: GridView.builder(
                itemCount: filteredLanguageList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio:.70
                  ),
                  itemBuilder:(context,index){
                  final staffdetails =EditDetails(
                      designation:work[index],
                      image: photo[index],
                      name:filteredLanguageList[index],
                      userName: '',
                      address: '',
                      phone: '01863251459',
                    subtitle: '', price: '', discount: '', time: 0, email: '', city: '', state: '', zipCode: 0, photo: [], );
                    if (staff.isEmpty) {
                      staff = List.generate(work.length, (_) => false);
                    }
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> ViewDetailsStaff(staffdetails:staffdetails,)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                            color: color.primaryContainer,
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xff848484).withOpacity(0.1),
                                  offset: const Offset(0, 4),
                                  blurRadius: 24,
                                  spreadRadius: -4
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children:[ Container(
                                height: 135,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)
                                  ),
                                  image: DecorationImage(image: AssetImage(staffdetails.image),fit: BoxFit.cover)
                                ),
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 130,
                                    left: 75
                                  ),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color:AppColor.kWhiteColor,width: 1),
                                      color: Colors.green
                                    ),
                                  ),
                                )
                        ]
                            ),
                            const SizedBox(
                              height: 6
                            ),
                            Text(staffdetails.name,style: textTheme.titleLarge,),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(staffdetails.designation,style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),),
                            Padding(
                              padding:const EdgeInsets.fromLTRB(10, 10,10,7),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      _makePhoneCall('000000000000000');
                                    },
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(shape: BoxShape.circle,color: const Color(0xffFF902A).withOpacity(0.15)),
                                      child: const Icon(Icons.call,color: Color(0xffFF902A),size: 16,),
                                    ),
                                  ),
                                   const SizedBox(
                                    width: 12,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const AcnooMessageScreen()));
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          decoration: const BoxDecoration(shape: BoxShape.circle,color:  Color(0xffDCFCE7)),
                                          child:  const Icon(Icons.message,color: Color(0xff16A34A),size: 16,),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Transform.scale(
                                        scale: 0.8,
                                        child: SizedBox(
                                          height: 24,
                                          width: 44,
                                          child: Switch(
                                              value:staff[index],
                                              onChanged:(value){
                                                setState(() {
                                                  staff[index] = value;
                                                });
                                              }

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ):
                const Center(
                  child: Text('No Result Fount'),
                )
          ],
        ),
      ),
    );
  }
}
