import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Widget/Theme/theme_constants.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  int selected = 0;
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

  Future<void> _launchEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        print('Cannot launch URL: $launchUri');
        throw 'Could not launch email client.';
      }
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
          title: Text('Help & Support',style: textTheme.titleLarge,)
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            //height: 422,
            //width: 335,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),color: AppColor.kWhiteColor,
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xffADADAD).withOpacity(0.1),
                      blurRadius: 16,
                      spreadRadius: -3,
                      offset: const Offset(0, 2)
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Center(child: SvgPicture.asset('images/ii.svg')),
                  const SizedBox(
                    height: 24,
                  ),
                  Text('Contact us ',style: textTheme.titleLarge,),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('You can send us email through',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),),
                  RichText(text: TextSpan(
                      children: [
                        WidgetSpan(child: Icon(Icons.email_outlined,size: 16,color: colorScheme.primary,),),
                        TextSpan(
                            text: '  maantheme@gmail.com',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                        )
                      ]
                  )),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Contact us our customer care number',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),),
        
                  RichText(text: TextSpan(
                      children: [
                        WidgetSpan(child: Icon(Icons.phone_in_talk,size: 16,color:colorScheme.primary,)),
                        TextSpan(
                            text: '  +8801100000001',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                        )
                      ]
                  )),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            _launchEmail('maantheme@gmail.com');
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              //width: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color:colorScheme.primary,width: 1),
                                  color: selected==1?colorScheme.primary:Colors.transparent
                              ),
                              child: RichText(text: TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(Icons.email_outlined,size: 18,color:colorScheme.primary)),
                                    TextSpan(
                                        text: '  Email',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color:colorScheme.primary)
                                    )
                                  ]
                              ))
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            _makePhoneCall('+8801100000001');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            // width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color:colorScheme.primary,width: 1),
                                color: colorScheme.primary
                            ),
                            child:RichText(text: TextSpan(
                                children: [
                                  const WidgetSpan(child: Icon(Icons.phone_in_talk,size: 18,color: AppColor.kWhiteColor,)),
                                  TextSpan(
                                      text: '  Call',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor)
                                  )
                                ]
                            )) ,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
