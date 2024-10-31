// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:r_dotted_line_border/r_dotted_line_border.dart';
//
// import '../Widget/Theme/theme_constants.dart';
//
// class AddNewService extends StatefulWidget {
//   const AddNewService({super.key});
//
//   @override
//   State<AddNewService> createState() => _AddNewServiceState();
// }
//
// class _AddNewServiceState extends State<AddNewService> {
//   ImagePicker picker=ImagePicker();
//   XFile ? _image;
//   Future<void> getImage() async{
//     XFile ? image=await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image=image;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     ColorScheme color = Theme.of(context).colorScheme;
//     return Scaffold(
//       backgroundColor: color.surface,
//       appBar: AppBar(
//         surfaceTintColor: color.surface,
//         elevation: 0.0,
//         title: Text(
//           'Add New Service',
//           style: textTheme.titleLarge,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               RichText(
//                 maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   text: TextSpan(children: [
//                 TextSpan(
//                     text: 'Image ',
//                     style: textTheme.titleSmall
//                         ?.copyWith(fontWeight: FontWeight.w500)),
//                 TextSpan(
//                     text: '(Jpg, Png, Jpeg, Your can Use Multiple image)',
//                     style: textTheme.bodySmall
//                         ?.copyWith(fontSize: 12, fontWeight: FontWeight.w500))
//               ])),
//               const SizedBox(
//                 height: 8,
//               ),
//               _image !=null? Container(
//                 height: 100,
//                 width: 110,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: FileImage(File(_image!.path)))
//                 ),
//               ):GestureDetector(
//                 onTap: (){
//                   getImage();
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   width: 110,
//                   height: 100,
//                   decoration: BoxDecoration(
//                       border: RDottedLineBorder.all(
//                         color: AppColor.kGreyTextColor,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(8)
//                   ),
//                   child: const Icon(Icons.camera_alt_rounded,color: AppColor.kGreyTextColor,),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'dart:io';

import '../Widget/Theme/theme_constants.dart';

class AddNewService extends StatefulWidget {
  const AddNewService({super.key});

  @override
  State<AddNewService> createState() => _AddNewServiceState();
}

class _AddNewServiceState extends State<AddNewService> {
  ImagePicker picker = ImagePicker();
  List<XFile> _images = [];

  Future<void> getImages() async {
    List<XFile>? images = await picker.pickMultiImage();
    setState(() {
      _images = images;
    });
  }
  List<String> text = [
    'What if my AC is under Warranty?',
    'What if my AC is under Warranty?',
    'Why should I trust Hendayman Service pro',
    'Why should I trust Hendayman Service pro',
    'Why should I trust Hendayman Service pro',
  ];
  void _deleteItem(int index) {
    setState(() {
      text.removeAt(index);
    });
  }
  List<String> itmeList1=[
    'Percentage',
    'Price',
  ];
  String selectedIndex1='Price';
  DropdownButton<String> getDiscount(){
    List<DropdownMenuItem<String>> menuItemList=[];
    for(var des in itmeList1){
      var item= DropdownMenuItem(
          value: des,
          child: Text(des));
      menuItemList.add(item);
    }
    return DropdownButton(
      dropdownColor:const Color(0xffEAEAEA),
        items: menuItemList,
        value: selectedIndex1,
        onChanged: (value){
          setState(() {
            selectedIndex1=value!;
          });
        });
  }
  List<String> itmeList2=[
    'Hours',
    'Minute',
  ];
  String selectedIndex2='Hours';
  DropdownButton<String> getDuration(){
    List<DropdownMenuItem<String>> menuItemList=[];
    for(var des in itmeList2){
      var item= DropdownMenuItem(

          value: des,
          child: Text(des));
      menuItemList.add(item);
    }
    return DropdownButton(
      dropdownColor: const Color(0xffEAEAEA),
        items: menuItemList,
        value: selectedIndex2,
        onChanged: (value){
          setState(() {
            selectedIndex2=value!;
          });
        });
  }
  List<String> itmeList = [
    'AC Repair',
    'Plumbing',
    'Electrical',
    'Carpet Cleaning',
    'Window Cleaning',
    'Dry Cleaning',
    'Pest Control',
    'Furniture Assembly',
  ];
  String selectedIndex = 'AC Repair';
  List<String> status = ['Active', 'Unactive'];
  String selectedStatus = 'Active';
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
          'Add New Service',
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Images ',
                      style: textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: '(Jpg, Png, Jpeg, You can select multiple images)',
                      style: textTheme.bodySmall
                          ?.copyWith(fontSize: 12, fontWeight: FontWeight.w500))
                ]),
              ),
              const SizedBox(
                height: 8,
              ),
              _images.isNotEmpty
                  ? Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: _images.map((image) {
                        return Container(
                          height: 100,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(image.path)),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : GestureDetector(
                      onTap: () {
                        getImages();
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
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: AppColor.kGreyTextColor,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Service Name*',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter service name',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kLightNeaturalColor)),
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
                  hintStyle: textTheme.titleMedium
                      ?.copyWith(color: AppColor.kLightNeaturalColor),
                  labelText: 'Service Category*',
                  labelStyle: textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Price*',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'EX: \$500',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kLightNeaturalColor)),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Discount',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Ex: %20',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kLightNeaturalColor),
                  suffixIcon: Container(
                    alignment: Alignment.center,
                    width: 142,
                    decoration: const BoxDecoration( color: Color(0xffEAEAEA),borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),topRight: Radius.circular(8)),
                  ),
                     child: getDiscount(),
                    // child:   DropdownButton<String>(
                    //   value: _selectedValue,
                    //  // hint: Text('Select an option'),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       _selectedValue = newValue;
                    //     });
                    //   },
                    //   items: drop.map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toSet().toList(), // Ensure unique items by converting to Set
                    // ),
                ),
              ),
              ),
              const SizedBox(
                height: 32,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Duration ',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Ex: 2',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kLightNeaturalColor),
                  suffixIcon: Container(
                    alignment: Alignment.center,
                    width: 109,
                    decoration: const BoxDecoration( color: Color(0xffEAEAEA),borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),topRight: Radius.circular(8)),
                    ),
                    child: getDuration(),
                    // child:   DropdownButton<String>(
                    //   value: _selectedValue,
                    //  // hint: Text('Select an option'),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       _selectedValue = newValue;
                    //     });
                    //   },
                    //   items: drop.map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toSet().toList(), // Ensure unique items by converting to Set
                    // ),
                  ),),
              ),
              const SizedBox(
                height: 32,
              ),
              DropdownButtonFormField(
                dropdownColor: AppColor.kWhiteColor,
                value: selectedStatus,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: status.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedStatus = newValue!;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Select one',
                  hintStyle: textTheme.titleMedium
                      ?.copyWith(color: AppColor.kLightNeaturalColor),
                  labelText: 'Status',
                  labelStyle: textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Description',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Write something',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kLightNeaturalColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'FAQs',
                style: textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Question',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Enter question',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kLightNeaturalColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Answer',
                    labelStyle: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    hintText: 'Write answer',
                    hintStyle: textTheme.titleMedium
                        ?.copyWith(color: AppColor.kLightNeaturalColor)),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.center,
                height: 32,
                width: 61,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: color.primary),
                child: Text(
                  'Save',
                  style: textTheme.titleSmall
                      ?.copyWith(color: AppColor.kWhiteColor),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: text.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Slidable(
                            key: ValueKey(
                                text[index]), // Unique key for each item
                            // startActionPane: ActionPane(
                            //   motion: const ScrollMotion(),
                            //   children: [
                            //     SlidableAction(
                            //       onPressed: (context) {
                            //         // Handle delete action
                            //         ScaffoldMessenger.of(context).showSnackBar(
                            //           SnackBar(
                            //               content:
                            //                   Text('Deleted ${text[index]}')),
                            //         );
                            //       },
                            //       backgroundColor: Colors.red,
                            //       foregroundColor: Colors.white,
                            //       icon: Icons.delete,
                            //       label: 'Delete',
                            //     ),
                            //   ],
                            // ),
                            endActionPane:
                            ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: 0.25,
                              children: [
                                const SizedBox(width: 15,),
                              const Icon(Icons.edit_note,size: 25,color: AppColor.kGreenColor,),
                                const SizedBox(width: 8,),
                                InkWell(onTap: (){
                                  setState(() {
                                    _deleteItem(index);
                                  });
                                },
                                    child: const Icon(Icons.delete_outline_outlined,size: 25,color:Color(0xffDC2626),))
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color(0xffEAEAEA), width: 1),
                              ),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                              title: Text(
                              text[index],
                                style: textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              // onExpansionChanged: (bool expanded) {
                              //   setState(() {
                              //     _isExpandedList[index] = expanded;
                              //   });
                              // },
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10, 8, 10, 12),
                                  child: Text(
                                    'Yes, you can try us for free for 30 days. If you want, '
                                        'we’ll provide you with a free, personalized 30-minute session.',
                                    style: textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                                // ListTile(
                                //   title: Text(
                                //     text[index],
                                //     style: textTheme.titleMedium
                                //         ?.copyWith(fontWeight: FontWeight.w600),
                                //   ),
                                //   subtitle: Padding(
                                //     padding: const EdgeInsets.fromLTRB(
                                //         10, 8, 10, 12),
                                //     child: Text(
                                //       'Yes, you can try us for free for 30 days. If you want, '
                                //       'we’ll provide you with a free, personalized 30-minute session.',
                                //       style: textTheme.bodySmall?.copyWith(
                                //           fontWeight: FontWeight.w400),
                                //     ),
                                //   ),
                                // ),
                              ),
                            ),
                          ));
                      ///////////////////////////////////////////

                      //   Padding(
                      //   padding: const EdgeInsets.only(bottom: 16),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(4),
                      //         color: AppColor.kWhiteColor,
                      //         border: Border.all(
                      //             color: const Color(0xffEAEAEA), width: 1)),
                      //     child: Theme(
                      //       data: Theme.of(context)
                      //           .copyWith(dividerColor: Colors.transparent),
                      //       child: ExpansionTile(
                      //         title: Text(
                      //           text[index],
                      //           style: textTheme.titleMedium
                      //               ?.copyWith(fontWeight: FontWeight.w600),
                      //         ),
                      //         // onExpansionChanged: (bool expanded) {
                      //         //   setState(() {
                      //         //     _isExpandedList[index] = expanded;
                      //         //   });
                      //         // },
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.fromLTRB(
                      //                 10, 8, 10, 12),
                      //             child: Text(
                      //               'Yes, you can try us for free for 30 days. If you want, '
                      //                   'we’ll provide you with a free, personalized 30-minute session.',
                      //               style: textTheme.bodySmall?.copyWith(
                      //                   fontWeight: FontWeight.w400),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // );

                      /////////////////////////////////////////
                    }),
              ),
            ],
          ),
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
                borderRadius: BorderRadius.circular(8), color: color.primary),
            child: Text(
              'Save',
              style: textTheme.titleSmall?.copyWith(color: AppColor.kWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
