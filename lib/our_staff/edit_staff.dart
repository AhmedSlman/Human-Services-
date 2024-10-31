import 'package:flutter/material.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../Widget/Theme/theme_constants.dart';

class EditStaff extends StatefulWidget {
  const EditStaff({super.key, required this.staff});
  final EditDetails staff;

  @override
  State<EditStaff> createState() => _EditStaffState();
}

class _EditStaffState extends State<EditStaff> {
  List<String> item = [
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
  String selected = 'AC Repair';

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controlleruser = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = widget.staff.name;
    _controlleruser.text= widget.staff.userName;
    _controllerPhone.text=widget.staff.phone;
    _controllerAddress.text=widget.staff.address;
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor:  color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('Edit New Staffs',style: textTheme.titleLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Image ',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)
                  ),
                  TextSpan(
                    text: '(jpg, png)',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)
                  )
                ]
              )),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 100,
                width: 110,
                decoration: BoxDecoration(
                  border: RDottedLineBorder.all(
                    color:color.primary,width: 1
                  ),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: AssetImage(widget.staff.image),fit: BoxFit.cover)
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _controller,
                onChanged: (value){
                  setState(() {
                    widget.staff.name=value;
                  });
                },
                style:textTheme.titleMedium,
                decoration: InputDecoration(
                labelText: 'Full Name*',
                  labelStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    hintText:
                    'Enter full Name',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _controlleruser,
                onChanged: (value){
                  setState(() {
                    widget.staff.userName=value;
                  });
                },
                style:textTheme.titleMedium,
                decoration: InputDecoration(
                    labelText: 'User Name*',
                    labelStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    hintText:
                    'Enter user name',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _controllerPhone,
                onChanged: (value){
                  setState(() {
                    widget.staff.phone=value;
                  });
                },
                style:textTheme.titleMedium,
                decoration: InputDecoration(
                    labelText: 'Phone Number*',
                    labelStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    hintText:
                    'Enter phone number',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                style:textTheme.titleMedium,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    hintText:
                    'Enter your email',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              DropdownButtonFormField(
                dropdownColor: color.surface,
                value: selected,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: item.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selected = newValue!;
                  });
                },
                style:textTheme.titleMedium,
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
                height: 32,
              ),
              TextFormField(
                controller: _controllerAddress,
                onChanged: (value){
                  setState(() {
                    widget.staff.address=value;
                  });
                },
                style:textTheme.titleMedium,
                decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    hintText:
                    'Enter address',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                style:textTheme.titleMedium,
                maxLines: 2,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                    labelText: 'Bio',
                    labelStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    hintText:
                    'Write something',
                    hintStyle: textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.kGreyTextColor)
                ),
              ),
          
            ],
          ),
        ),
      ),
      
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
            color: color.primary,),
            child: Text('Update',style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor),),
          ),
        ),
      ),
    );
  }
}
