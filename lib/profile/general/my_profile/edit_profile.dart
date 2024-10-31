import 'dart:io';
import 'package:flutter/material.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.edit});
final EditDetails edit;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> itmeList = [
    'Agency',
    'Freelance service',
  ];
  String selectedIndex = 'Agency';
  ImagePicker picker = ImagePicker();
  XFile? _image;
  Future<void> getImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  final TextEditingController _controllername = TextEditingController();
  final TextEditingController _controlleremail = TextEditingController();
  final TextEditingController _controllerphone = TextEditingController();
  final TextEditingController _controllerbusinessname = TextEditingController();
  final TextEditingController _controllercity = TextEditingController();
  final TextEditingController _controllerstate = TextEditingController();
  final TextEditingController _controllerzip = TextEditingController();
  final TextEditingController _controlleraddress = TextEditingController();
  @override
  void initState(){
    super.initState();
    _controllername.text = widget.edit.name;
    _controlleremail.text = widget.edit.email;
    _controllerphone.text = widget.edit.phone;
    _controllerbusinessname.text = widget.edit.subtitle;
    _controllercity.text = widget.edit.city;
    _controllerstate.text = widget.edit.state;
    _controllerzip.text= widget.edit.zipCode.toString();
    _controlleraddress.text = widget.edit.address;
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
          'Edit Profile',
          style: textTheme.titleLarge,
        ),
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
              _image != null
                  ? Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: color.primary,width: 1),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(_image!.path)))),
                    )
                  : GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Stack(children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: color.primary,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(widget.edit.image),fit: BoxFit.cover)),
                          // child: Icon(
                          //   Icons.camera_alt_rounded,
                          //   color: AppColor.kGreyTextColor,
                          // ),
                        ),
                        Positioned(
                          top: 64,
                          left: 63,
                          child: Container(
                            height: 36,
                            width: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.kWhiteColor,
                                border:
                                    Border.all(color: color.primary, width: 1)),
                            child: Icon(Icons.camera_alt_rounded,size:20,color: color.primary,),
                          ),
                        )
                      ]),
                    ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _controllername,
                onChanged: (value){
                  setState(() {
                    widget.edit.name=value;
                  });
                },
                style: textTheme.titleMedium,
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Full Name*',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter Full Name',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _controlleremail,
                onChanged: (value){
                  setState(() {
                    widget.edit.email=value;
                  });
                },
                style: textTheme.titleMedium,
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Email *',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter Email',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _controllerphone,
                onChanged: (value){
                  setState(() {
                    widget.edit.phone=value;
                  });
                },
                style: textTheme.titleMedium,
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Phone Number',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter Number',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
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
                  hintText: 'Select one',
                  hintStyle: textTheme.titleMedium
                      ?.copyWith(color: AppColor.kLightNeaturalColor),
                  labelText: 'Business Type*',
                  labelStyle: textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _controllerbusinessname,
                onChanged: (value){
                  setState(() {
                    widget.edit.subtitle=value;
                  });
                },
                style: textTheme.titleMedium,
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Business Name*',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter Name',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _controllercity,
                onChanged: (value){
                  setState(() {
                    widget.edit.city=value;
                  });
                },
                style: textTheme.titleMedium,
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'City*',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter city',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _controllerstate,
                onChanged: (value){
                  setState(() {
                    widget.edit.state=value;
                  });
                },
                style: textTheme.titleMedium,
                // maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'State',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter state',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _controllerzip,
                onChanged: (value){
                  setState(() {
                    widget.edit.time = int.tryParse(value) ?? 0;
                  });
                },
                style: textTheme.titleMedium,
                //maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Zip Code',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter zip code',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _controlleraddress,
                onChanged: (value){
                  setState(() {
                    widget.edit.address=value;
                  });
                },
                style: textTheme.titleMedium,
                // maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Address',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter address',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                maxLines: 3,
                style: textTheme.titleMedium,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'About Us',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Write something',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Container(
            alignment: Alignment.center,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color.primary),
            child: Text(
              'Update',
              style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.kWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
