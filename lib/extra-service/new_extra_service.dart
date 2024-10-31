import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../Widget/Theme/theme_constants.dart';

class NewExtraService extends StatefulWidget {
  const NewExtraService({super.key});

  @override
  State<NewExtraService> createState() => _NewExtraServiceState();
}

class _NewExtraServiceState extends State<NewExtraService> {
  ImagePicker picker=ImagePicker();
  XFile ? _image;
  Future<void> getImage() async{
    XFile ? image=await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=image;
    });
  }
  List<String> itmeList = [
  'AC Cleaning and Sanitization',
  'Plumbing',
  'Electrical',
  'Carpet Cleaning',
  'Window Cleaning',
  'Dry Cleaning',
  'Pest Control',
  'Furniture Assembly',
  ];
  String selectedIndex ='Plumbing';
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor:  color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('Add New Extra Service',style: textTheme.titleLarge,),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: TextSpan(
                children:[
                  TextSpan(
                      text: 'Image',style: textTheme.bodySmall?.copyWith(color:AppColor.kTitleColor)
                  ),
                  TextSpan(
                    text: ' (Jpg, Png, Jpeg, Your can Use single image)',style: textTheme.bodySmall?.copyWith(fontSize: 12,fontWeight: FontWeight.w500),
                  )
                ]
            )),
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
                labelText: 'Select Service *',
                labelStyle: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight
                        .w500),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              //maxLines: 2,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  labelText:
                  'Price*',
                  labelStyle: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight
                          .w500),
                  hintText:
                  'EX: \$500',
                  hintStyle: textTheme
                      .titleMedium
                      ?.copyWith(color: AppColor.kLightNeaturalColor)),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  labelText:
                  'Description',
                  labelStyle: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight
                          .w500),
                  hintText:
                  'Write something',
                  hintStyle: textTheme
                      .titleMedium
                      ?.copyWith(color: AppColor.kLightNeaturalColor)),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color.primary,
            ),
            child: Text('Save',style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor),),
          ),
        ),
      ),
    );
  }
}
