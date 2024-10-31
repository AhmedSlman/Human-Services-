import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import '../Widget/Theme/theme_constants.dart';
class AddNewStaffs extends StatefulWidget {
  const AddNewStaffs({super.key,  this.staffdetails});
  final EditDetails ?staffdetails;
  @override
  State<AddNewStaffs> createState() => _AddNewStaffsState();
}

class _AddNewStaffsState extends State<AddNewStaffs> {
  List<String> itmeList = [
    'AC Repair',
    'Carpenter',
    'Cleaning',
    'Cooking',
    'Shifting',
    'Plumber',
    'Laptop Repair',
    'Emergency',
    'Car Service',
    'Laundry',
  ];
  String selectedIndex ='AC Repair';
  ImagePicker picker=ImagePicker();
  XFile ? _image;
  Future<void> getImage() async{
    XFile ? image=await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=image;
    });
  }
  bool setPassword=true;
  bool conformPassword=true;
  TextEditingController setPasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color= Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('Add New Staffs',style: textTheme.titleLarge,),
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
              TextFormField(
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText:
                    'Full Name*',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter full Name',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),


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
                    'User Name*',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter user name',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),


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
                    'Phone Number*',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter phone number',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),


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
                    'Email* ',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Enter your email',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),


              ),
              const SizedBox(
                height: 24,
              ),
              // TextFormField(
              //   controller: confirmPasswordController,
              //   // maxLines: 3,
              //   keyboardType: TextInputType.multiline,
              //   decoration: InputDecoration(
              //       contentPadding: const EdgeInsets.all(10),
              //       label: RichText(text: TextSpan(
              //         children: [
              //           TextSpan(
              //             text: 'Password*',style: textTheme.titleSmall?.copyWith(
              //               fontWeight: FontWeight
              //                   .w500),
              //           ),
              //           TextSpan(
              //             text: '(For staffs log in)',style: textTheme.titleSmall?.copyWith(
              //               fontWeight: FontWeight
              //                   .w500,color: AppColor.kGreyTextColor),
              //           )
              //         ]
              //       )),
              //
              //       hintText:
              //       '********',
              //       hintStyle: textTheme
              //           .titleMedium
              //           ?.copyWith(color: AppColor.kGreyTextColor),
              //       suffixIcon: IconButton(
              //           onPressed: (){
              //             setState(() {
              //               conformPassword =! conformPassword;
              //             });
              //           },
              //           icon: conformPassword?const Icon(FeatherIcons.eyeOff,color: AppColor.kGreyTextColor,size: 20,):const Icon(FeatherIcons.eye,color: AppColor.kGreyTextColor,size: 20,))),
              //
              //
              // ),
              TextFormField(
                controller: setPasswordController,
                obscureText: setPassword,
                decoration: InputDecoration(
                        label: RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Password*',style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight
                                    .w500),
                            ),
                            TextSpan(
                              text: '(For staffs log in)',style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight
                                    .w500,color: AppColor.kGreyTextColor),
                            )
                          ]
                        )),
                    hintText: '******',
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            setPassword =! setPassword;
                          });
                        },
                        icon: setPassword?const Icon(FeatherIcons.eyeOff,color: AppColor.kGreyTextColor,size: 20,):const Icon(FeatherIcons.eye,color: AppColor.kGreyTextColor,size: 20,))
                ),
              ),
              const SizedBox(
                height: 24,
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
                  hintText: 'Select designation',
                  hintStyle: textTheme.titleMedium?.copyWith(color: AppColor.kLightNeaturalColor),
                  labelText: 'Designation*',
                  labelStyle: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight
                          .w500),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(

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
                    'Bio',
                    labelStyle: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight
                            .w500),
                    hintText:
                    'Write something',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            height: 48,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: color.primary),
            child: Text('Save',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor),),
          ),
        ),
      ),
    );
  }
}
