import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:handyman_provider/message/acnoo_message_screen.dart';
import 'package:handyman_provider/our_staff/edit_staff.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewDetailsStaff extends StatefulWidget {
  const ViewDetailsStaff({super.key, required this.staffdetails});
  final EditDetails staffdetails;
  @override
  State<ViewDetailsStaff> createState() => _ViewDetailsStaffState();
}

class _ViewDetailsStaffState extends State<ViewDetailsStaff> {
  bool _switchValue = false;
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
  final String textToCopy = 'example@gmail.com';

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: textToCopy)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied to clipboard!'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }
  final String contentToShare = 'Check out this awesome content!';

  void _shareContent() {
    Share.share(contentToShare);
  }

  void deleteDilog(context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.only(left: 20,right: 20.0),
            backgroundColor: color.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // Add rounded corners for a better look
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 105,
                    // width: 335,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/ss.png'))),
                    child: const Image(image: AssetImage('images/trash.png')),
                  ),
                  const SizedBox(
                      height: 24
                  ),
                  Text(
                    'Are You Sure',
                    style: textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'You want to approve this request',
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.kGreyTextColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xffDC2626), width: 1)),
                            child: Text(
                              'No, Rejected',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:const Color(0xffDC2626)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color.primary),
                            child: Text(
                              'Yes, Sure',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
     final staff = EditDetails(
         image: widget.staffdetails.image,
         name: widget.staffdetails.name,
         userName: widget.staffdetails.name == 'Wade Warren'?'WadeWarren':'Ralphedwards',
         address: 'Elgin St. Celina, Delaware 10299',
         designation: '',
         phone: widget.staffdetails.phone,
         subtitle: '', price: '', discount:'', time: 0, email: '', city: '', state: '', zipCode: 0, photo: []);
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text(
          'View Details',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    _makePhoneCall('0000000000000');
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffFF902A).withOpacity(0.15)),
                    child: const Icon(
                      Icons.call,
                      color: Color(0xffFF902A),
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (_)=>const AcnooMessageScreen()));
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffDCFCE7)),
                    child: const Icon(
                      Icons.message,
                      color: Color(0xff16A34A),
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: SizedBox(
                    height: 24,
                    width: 44,
                    child: Switch(
                        value: _switchValue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _switchValue = newValue;
                          });
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.kWhiteColor,
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Center(
                        child: Stack(
                          children: [Container(
                            padding: const EdgeInsets.all(6),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xff86EFAC),width: 1),
                              image:  DecorationImage(image:AssetImage(widget.staffdetails.image),fit: BoxFit.cover)
                            ),
                          ),
                            Positioned(
                              top: 67,
                              left: 90,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff16A34A)
                                ),
                              ),
                            )
                  ]
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(child: Text(widget.staffdetails.name,style: textTheme.titleMedium,)),
                      const SizedBox(
                        height: 2,
                      ),
                      Center(child: Text(widget.staffdetails.designation,style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),)),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColor.kLightNeaturalColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Member sine',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)
                            ),
                            TextSpan(
                                text: '      : 25 Jan 2024',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),
                      const SizedBox(height: 12,),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Full Name',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)
                            ),
                            TextSpan(
                                text: '           : ${widget.staffdetails.name} ',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),
                      const SizedBox(height: 12,),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'User Name',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)
                            ),
                            TextSpan(
                                text: '         : Ralphedwards',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),
                      const SizedBox(height: 12,), RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Phone Number',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)
                            ),
                            TextSpan(
                                text: '   : ${widget.staffdetails.phone}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),
                      const SizedBox(height: 12,), RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Email ',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)
                            ),
                            TextSpan(
                                text: '                  : N/A',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),
                      const SizedBox(height: 12,), RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Designation',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)
                            ),
                            TextSpan(
                                text: '        : ${widget.staffdetails.designation}',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)
                            )
                          ]
                      )),
                      const SizedBox(height: 12,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)),
                          Expanded(
                            child: Text( '     :  Elgin St. Celina, Delaware 10299',textAlign: TextAlign.end,style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bio',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)),
                          Expanded(
                            child: Text('                  :      Aliquam pulvinar vestib\nulum blandit.'
                                ' Donec sed\nnisl libero. Fusce dignis\nsim'
                                'luctus  eu dapibus.',overflow: TextOverflow.ellipsis,maxLines: 4,textAlign:TextAlign.end,
                                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Login Info',style: textTheme.titleLarge,),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: AppColor.kWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: -4
                      )
                    ]
                ),
                child:Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('example@gmail.com',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),),
                          Text('********',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        _copyToClipboard(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                            height: 32,
                            width: 82,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffEDE6FD)
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.copy,color:color.primary,size: 16,),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('Copy',style: textTheme.titleSmall?.copyWith(color: color.primary),)
                          ],
                        ),
                          ),
                    ),
                      const SizedBox(
                        width: 10,
                      ),
                       InkWell(
                         onTap: (){
                           _shareContent;
                         },
                           child: Icon(CommunityMaterialIcons.share,size: 25,color: color.primary,))
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {

                deleteDilog(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                      Border.all(
                          color: const Color(0xffDC2626), width: 1)),
                  child: Text(
                    'Delete',
                    style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffDC2626)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (_)=>  EditStaff(staff: staff,)));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: color.primary),
                  child: Text(
                    'Edit',
                    style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.kWhiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
