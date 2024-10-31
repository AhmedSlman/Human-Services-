import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:handyman_provider/profile/general/verify_account/add_id.dart';

class VerifyAccoount extends StatefulWidget {
  const VerifyAccoount({super.key});

  @override
  State<VerifyAccoount> createState() => _VerifyAccoountState();
}

class _VerifyAccoountState extends State<VerifyAccoount> {
  bool _isSelected = false;

  // Method to navigate to the second screen and handle the result
  void _navigateAndDisplaySelection() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddId(), // Navigate to VerifyAccount
      ),
    );

    // Update the state based on the result from the second screen
    if (result != null && result) {
      setState(() {
        _isSelected = true;
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
          'Verify Account',
          style: textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child:  Column(
            children: [
             _isSelected? Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Information',style: textTheme.headlineMedium,),
                 SizedBox(
                   height: 16,
                 ),
                 RichText(text: TextSpan(
                   children: [
                     TextSpan(
                       text: 'Name',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor)
                     ),
                     TextSpan(
                       text: '                  : Alfred Molina',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                     )
                   ]
                 )),
                 ////
                 SizedBox(
                   height: 16,
                 ),
                 RichText(text: TextSpan(
                     children: [
                       TextSpan(
                           text: 'Date of Birth',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor)
                       ),
                       TextSpan(
                           text: '      : 25 Nov 1958',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                       )
                     ]
                 )),
                 /////
                 SizedBox(
                   height: 16,
                 ),
                 RichText(text: TextSpan(
                     children: [
                       TextSpan(
                           text: 'NID Number',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor)
                       ),
                       TextSpan(
                           text: '       : 2610413965404',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                       )
                     ]
                 )),
                 ////
                 SizedBox(
                   height: 16,
                 ),
                 RichText(text: TextSpan(
                     children: [
                       TextSpan(
                           text: 'Father’s Name',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor)
                       ),
                       TextSpan(
                           text: '    : Jenny Wilson',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                       )
                     ]
                 )),
                 /////
                 SizedBox(
                   height: 16,
                 ),
                 RichText(text: TextSpan(
                     children: [
                       TextSpan(
                           text: 'Mother’s Name',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor)
                       ),
                       TextSpan(
                           text: '   : Kristin Watson',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                       )
                     ]
                 )),
                 ////
                 SizedBox(
                   height: 16,
                 ),
                 RichText(maxLines: 2,overflow: TextOverflow.ellipsis,
                     text: TextSpan(
                     children: [
                       TextSpan(
                           text: 'Address',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor)
                       ),
                       TextSpan(
                           text: '               : 23 Willow Way, Bletchley, MK2',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                       )
                     ]
                 )),
                 ////
                 SizedBox(
                   height: 16,
                 ),
                 RichText(text: TextSpan(
                     children: [
                       TextSpan(
                           text: 'Blood Group',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor)
                       ),
                       TextSpan(
                           text: '         : O+',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                       )
                     ]
                 )),

             ],):Column(
                children: [
                  InkWell(
                    onTap: (){
                      _navigateAndDisplaySelection();
                    },
                    child: Container(
                      height: 178,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.kWhiteColor,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 4),
                                color: const Color(0xff848484).withOpacity(0.1),
                                blurRadius: 24,
                                spreadRadius: -4)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: color.primary),
                                  child: SvgPicture.asset('images/id.svg'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('Goverment ID', style: textTheme.headlineMedium)
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Take a driver\'s license, national identity card or passport photo',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.kGreyTextColor),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_circle_outline,color: color.primary,size: 20,),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text('Add National ID & Passport ID',style: textTheme.titleMedium?.copyWith(color: color.primary),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 77,
                  ),
                SizedBox(
                  height: 279,
                width: double.infinity,
                child: SvgPicture.asset('images/fream2.svg',),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _isSelected?Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: InkWell(
          onTap: (){
            _navigateAndDisplaySelection();
            //Navigator.push(context, MaterialPageRoute(builder: (_)=>AddId()));
          },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color.primary,
            ),
            child: Text('Edit',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor),),
          ),
        ),
      ):SizedBox()
    );
  }
}
