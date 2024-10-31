import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman_provider/profile/general/verify_account/scan_id.dart';
import 'dart:typed_data';
import '../../../Widget/Theme/theme_constants.dart';
import 'scan.dart';

class AddId extends StatefulWidget {
  const AddId({Key? key}) : super(key: key);

  @override
  _AddIdState createState() => _AddIdState();
}

class _AddIdState extends State<AddId> {
  final ValueNotifier<Uint8List?> capturedImageNotifier = ValueNotifier<Uint8List?>(null);

  @override
  void dispose() {
    capturedImageNotifier.dispose();
    super.dispose();
  }
  Future<void> verifyDilog()async {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    final result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
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
                            image: AssetImage('images/Star.png'))),
                    child: const Image(image: AssetImage('images/check.png')),
                  ),
                  const SizedBox(
                      height: 24
                  ),
                  Text('NID Verify Successful !',style: textTheme.headlineLarge,),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Your account verify has been \ncomplete ',
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.kGreyTextColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context, true);
                      });

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: color.primary),
                      child: Text(
                        'Okay',
                        style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.kWhiteColor),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        });
    Navigator.pop(context, result);
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
        title: const Text('First Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children:[
              ValueListenableBuilder<Uint8List?>(
              valueListenable: capturedImageNotifier,
              builder: (context, capturedImage, child) {
                return capturedImage != null
                    ? Container(
                  height: 231,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color.primaryContainer,
                      border: Border.all(color: Color(0xffE8E8E8)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff848484).withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 24,
                            spreadRadius: -4
                        )
                      ]
                  ),
                  child: Image.memory(capturedImage),
                )
                    : Container(
                  height: 231,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color.primaryContainer,
                    border: Border.all(color: Color(0xffE8E8E8)),
                    borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff848484).withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 24,
                            spreadRadius: -4
                        )
                      ]
                  ),
                  child:Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                     SvgPicture.asset('images/nid.svg'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Front side',style: textTheme.titleLarge,),
                      SizedBox(
                        height: 8,
                      ),

                      Text('Take an identity card to check your \ninformation',textAlign: TextAlign.center,style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),)
                    ],
                  ),
                );
              },
            ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 100,
                  top: 210
                ),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>Scan(
                          onCapture: (capturedImage) {
                            capturedImageNotifier.value = capturedImage;
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 132,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: color.primary
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('images/scan.svg'),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Scan Id',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kWhiteColor),)

                      ],
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(
                  top: 300
                ),
                child: ValueListenableBuilder<Uint8List?>(
                  valueListenable: capturedImageNotifier,
                  builder: (context, capturedImage, child) {
                    return capturedImage != null
                        ? Container(
                      height: 231,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: color.primaryContainer,
                          border: Border.all(color: Color(0xffE8E8E8)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xff848484).withOpacity(0.1),
                                offset: const Offset(0, 4),
                                blurRadius: 24,
                                spreadRadius: -4
                            )
                          ]
                      ),
                      child: Image.memory(capturedImage),
                    )
                        : Container(
                      height: 231,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: color.primaryContainer,
                          border: Border.all(color: Color(0xffE8E8E8)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xff848484).withOpacity(0.1),
                                offset: const Offset(0, 4),
                                blurRadius: 24,
                                spreadRadius: -4
                            )
                          ]
                      ),
                      child:Column(
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          SvgPicture.asset('images/back.svg'),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Back side',style: textTheme.titleLarge,),
                          SizedBox(
                            height: 8,
                          ),

                          Text('Take an identity card to check your \ninformation',textAlign: TextAlign.center,style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),)
                        ],
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 100,
                    top:507
                ),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scan(
                          onCapture: (capturedImage) {
                            capturedImageNotifier.value = capturedImage;
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 132,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: color.primary
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('images/scan.svg'),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Scan Id',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kWhiteColor),)

                      ],
                    ),
                  ),
                ),
              )
           ]
          ),
        ),
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: InkWell(
          onTap: (){
            verifyDilog();
          },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffEDE6FD),
            ),
            child: Text('Submit',style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600,color: color.primary),),
          ),
        ),
      ),

    );
  }
}