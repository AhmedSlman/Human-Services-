import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../Widget/Theme/theme_constants.dart';

class Refer extends StatefulWidget {
  const Refer({super.key});

  @override
  State<Refer> createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  final String textToCopy = 'MAN458';
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        surfaceTintColor: colorScheme.surface,
        elevation: 0.0,
        title: Text('Refer to Earnrd',style: textTheme.titleLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 455,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: AppColor.kWhiteColor),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Image(image: AssetImage('images/icon.png')),
                      const SizedBox(
                        height:24,
                      ),
                      Text('Invite Friends. Get Cashback',style: textTheme.titleLarge,),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Get \$100.00 cashback for every friend who \nregisters and Orders at '
                          'least \$250.00\n for their first Order using your referral code!',maxLines: 3,overflow: TextOverflow.ellipsis,style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('Share your referral code',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffEAEAEA)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('MAN458',style: textTheme.titleSmall,),
                              InkWell(
                                onTap: (){
                                  Clipboard.setData(ClipboardData(text: textToCopy)).then((_) {
                                    // Show a snackbar to indicate the text has been copied
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Text copied to clipboard!'),
                                      ),
                                    );
                                  });
                                },
                                  child: Text('Copy',style: textTheme.titleSmall?.copyWith(color: colorScheme.primary),)),
                            ],
                          ),
                        ),

                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: (){
                          Share.share('Check out this cool Flutter package!', subject: 'Flutter Share Plus');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colorScheme.primary
                          ),
                          child: Text('Invite Friends',style: textTheme.bodyLarge?.copyWith(color: AppColor.kWhiteColor),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text('How Refferal Works',style: textTheme.titleLarge,),

              ListTile(
                leading: Container(
                  height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: colorScheme.primary,width: 1)),
                    child: Text('1',style: textTheme.bodySmall?.copyWith(color: colorScheme.primary),)),
                title: Text('Invite your friends',style: textTheme.titleSmall,),
                subtitle: Text('Share your refferal code to family or friends.',maxLines: 3,overflow: TextOverflow.ellipsis,style: textTheme.bodySmall?.copyWith(fontSize: 12),),
              ),
              const SizedBox(
                height: 16,
              ),
              ListTile(
                leading: Container(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: colorScheme.primary,width: 1)),
                    child: Text('2',style: textTheme.bodySmall?.copyWith(color: colorScheme.primary),)),
                title: Text('Fulfill the terms & conditions',style: textTheme.titleSmall,),
                subtitle: Text('Remind your refferals to complete their registration using the refferal code and fulfill all T&C requirements.',maxLines: 3,overflow: TextOverflow.ellipsis,style: textTheme.bodySmall?.copyWith(fontSize: 12)),
              ),
              const SizedBox(
                height: 16,
              ),
              ListTile(
                leading: Container(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: colorScheme.primary,width: 1)),
                    child: Text('3',style: textTheme.bodySmall?.copyWith(color: colorScheme.primary),)),
                title: Text('Win rewards',style: textTheme.titleSmall,),
                subtitle: Text('When your refferals have met the T&C requirements, you and your refferals will win rewards!',maxLines: 3,overflow: TextOverflow.ellipsis,style: textTheme.bodySmall?.copyWith(fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
