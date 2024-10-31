import 'dart:io';
import 'package:flutter/material.dart';
import 'package:handyman_provider/Home/home.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class SetupYourBusiness extends StatefulWidget {
  const SetupYourBusiness({super.key});

  @override
  State<SetupYourBusiness> createState() => _SetupYourBusinessState();
}

class _SetupYourBusinessState extends State<SetupYourBusiness> {
  List<String> itmeList = [
    'Agency',
    'Freelance service',
  ];
  String selectedIndex ='Agency';
  ImagePicker picker=ImagePicker();
  XFile ? _image;
  Future<void> getImage() async{
    XFile ? image=await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=image;
    });
  }
  ///////////////////////
  void okDilog(context) {
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
                            image: AssetImage('images/Star.png'))),
                    child: const Image(image: AssetImage('images/check.png')),
                  ),
                  const SizedBox(
                      height: 24
                  ),
                  Text('Congratulation!',style: textTheme.headlineLarge,),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Congratulations and Best Wishes on your create account!',
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
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const AcnooHome()));

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
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
  }
  //////////////////////
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
          'Setup Your Business',
          style: textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Logo',
                    style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.kTitleColor)),
                TextSpan(
                    text: '(jpg, png)',
                    style: textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500))
              ])),
              const SizedBox(
                height: 8,
              ),
              _image !=null? Container(
                height: 100,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(_image!.path)))
                ),
              ):GestureDetector(
                onTap: (){
                  getImage();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 110,
                  height: 100,
                  decoration: BoxDecoration(
                    border: RDottedLineBorder.all(
                      color: AppColor.kGreyTextColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Icon(Icons.camera_alt_rounded,color: AppColor.kGreyTextColor,),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              DropdownButtonFormField(
                dropdownColor: AppColor.kWhiteColor,
                value: selectedIndex,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: itmeList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedIndex = newValue!;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Select one',
                  hintStyle: textTheme.titleMedium?.copyWith(color: AppColor.kLightNeaturalColor),
                  labelText: 'Business Type*',
                  labelStyle: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight
                          .w500),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText:
                    'Business Name*',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter Name',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
          
          
              ),
              const SizedBox(
                height: 24,
              ), TextFormField(
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText:
                    'City*',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter city',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
          
          
              ),
              const SizedBox(
                height: 24,
              ), TextFormField(
               // maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText:
                    'State',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter state',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
          
          
              ),
              const SizedBox(
                height: 24,
              ), TextFormField(
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText:
                    'Zip Code',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter zip code',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
          
          
              ),
              const SizedBox(
                height: 24,
              ), TextFormField(
          
               // maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText:
                    'Address',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter address',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
          
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText:
                    'About Us',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Write something',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: (){
                  okDilog(context);
                  // showDialog(context: context, builder: (context){
                  //   return AlertDialog(
                  //     backgroundColor: color.surface,
                  //     content: Container(
                  //       alignment: Alignment.center,
                  //       height: 105,
                  //       // width: 335,
                  //       decoration: const BoxDecoration(
                  //           image: DecorationImage(image: AssetImage('images/Star.png'))
                  //       ),
                  //       child:const Image(image: AssetImage('images/check.png')),
                  //     ),
                  //     actions: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 15,right: 15),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Text('Congratulation!',textAlign: TextAlign.center,style: textTheme.headlineLarge,),
                  //             const SizedBox(
                  //               height: 15,
                  //             ),
                  //             Text('Congratulations and Best Wishes on your create account!',maxLines: 2,overflow: TextOverflow.ellipsis,style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor),),
                  //             const SizedBox(
                  //               height: 10,
                  //             ),
                  //             InkWell(
                  //               onTap: (){
                  //                 Navigator.push(context, MaterialPageRoute(builder: (_)=>const AcnooHome()));
                  //               },
                  //               child: Container(
                  //                 alignment: Alignment.center,
                  //                 height: 48,
                  //                 // width: 335,
                  //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:color.primary),
                  //                 child: Text('Okay',style: textTheme.bodyLarge?.copyWith(color:
                  //                 AppColor.kWhiteColor,fontWeight: FontWeight.w600),),
                  //               ),
                  //             ),
                  //             // TextButton(onPressed: (){
                  //             //   Navigator.pop(context);
                  //             // }, child:Text('Back to Home',style:
                  //             // textTheme.titleMedium?.copyWith(color: AppColor.kGreyTextColor),))
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   );
                  // });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: color.primary),
                  child: Text('Continue',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
