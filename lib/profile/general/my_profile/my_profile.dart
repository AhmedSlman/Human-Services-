import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:handyman_provider/profile/general/my_profile/edit_profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final edit = EditDetails(
        image:'images/profile.jpeg',
        name: 'Shaidul Islam',
        userName: '',
        address: 'Elgin St. Celina, Delaware 10299',
        designation: '',
        phone: '01863251459',
        subtitle: 'Ralph Edawars Service',
        price: '',
        discount: '',
        time: 0,
        email: 'ralphedwards@gmail.com',
        city: 'Dhaka',
        state: 'Dhaka',
        zipCode: 5652, photo: []);
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('My Profile',style: textTheme.titleLarge,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>EditProfile(edit: edit,)));
              },
              child: Container(
                alignment: Alignment.center,
                height: 32,
                width: 32,
                decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xffEDE6FD)),
                child: SvgPicture.asset('images/edit.svg'),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(shape: BoxShape.circle,
                              image: DecorationImage(image:AssetImage(edit.image),fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Center(child: Text(edit.name,style: textTheme.titleMedium,)),
                      const SizedBox(
                        height: 2,
                      ),
                      Center(child: Text('Member sine: 20 Jan 2024',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),)),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        color: Color(0xffEAEAEA),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Full Name',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: '         : ${edit.name}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                          )
                        ]
                      )),
                      const SizedBox(
                        height: 12,
                      ),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Phone Number',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: ' : ${edit.phone}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),  const SizedBox(
                        height: 12,
                      ),
                      RichText(
                        maxLines: 1,
                          overflow:TextOverflow.ellipsis,
                          text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Email ',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: '                : ${edit.email}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),  const SizedBox(
                        height: 12,
                      ),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Business type',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: '   : Agency',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),  const SizedBox(
                        height: 12,
                      ),
                      RichText(
                        maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Business Name',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: ' : ${edit.subtitle}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),  const SizedBox(
                        height: 12,
                      ),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'City',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: '                    : ${edit.city}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),  const SizedBox(
                        height: 12,
                      ),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'State',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: '                  : ${edit.state}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),  const SizedBox(
                        height: 12,
                      ),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Zip Code',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: '            : ${edit.zipCode}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),  const SizedBox(
                        height: 12,
                      ),
                      RichText(
                        maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Address',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
          
                                text: '              : Elgin St. Celina, Delaware 10299',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),
          
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('About Us',style: textTheme.titleLarge,),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry. \nLorem Ipsum has been the industry',
                        style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor),),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('leap into electronic typesetting, \nremaining essentially unchanged.'
                          ' It was\npopularised in the 1960s with the \nrelease of Letraset sheets containing \nLorem Ipsum passages,',
                          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
