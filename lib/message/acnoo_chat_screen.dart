import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../Widget/Theme/theme_constants.dart';
import '../Widget/Const Data/golobal_button.dart';
import 'chat_data.dart';
import 'image_picker_popup.dart';

class AcnooChatScreen extends StatefulWidget {
  const AcnooChatScreen(
      {super.key, required this.receiver, required this.isActive});
  final MaanGigModel receiver;

  //For Activity status
  final bool isActive;

  @override
  State<AcnooChatScreen> createState() => _AcnooChatScreenState();
}

class _AcnooChatScreenState extends State<AcnooChatScreen> {
  List<MaanChatModel> messages = MaanDemoChat.chatList;

//---------For Picking and sending image----------//
  File? selectedImage;
  _getImage() async {
    //To close the dialog and open gallery
    Navigator.pop(context);

    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      sendImage();
    }
    return null;
  }

//---------For sending image----------//
  void sendImage() {
    setState(
          () {
        messages.add(MaanChatModel(
            file: selectedImage, date: DateTime.now(), isSentByMe: true));
        messageEditingController.clear();
      },
    );
  }

//---------For sending text msg----------//
  void sendMsg() {
    if (messageEditingController.text.isNotEmpty) {
      setState(
            () {
          messages.add(MaanChatModel(
              text: messageEditingController.text,
              date: DateTime.now(),
              isSentByMe: true));
          messageEditingController.clear();
        },
      );
    }
  }
  List<String> avatar = [
    'images/avatar.png',
    'images/avatar2.png',
    'images/avatar3.png',
    'images/avatar.png',
    'images/avatar2.png',
    'images/avatar3.png',
  ];
  List<bool> popularStates=[];
  List<String> popularImageList = [
    'images/popular2.png',
    'images/popular.png',
    'images/popular4.png',
    'images/popular5.png',
    'images/popular6.png',
    'images/popular3.png',
  ];

  _createOrderPopUP(BuildContext context){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        enableDrag: true,
        backgroundColor: AppColor.kBackgroundColor,
        builder: (BuildContext context){
          TextTheme textTheme=Theme.of(context).textTheme;
          ColorScheme color=Theme.of(context).colorScheme;
          return DraggableScrollableSheet(
              maxChildSize: 0.9,
              minChildSize: 0.3,
              initialChildSize: 0.8,
              expand: false,
              builder: (BuildContext context, ScrollController scrollController) {
                return StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16,left: 20,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Select One For Orders',style: textTheme.titleLarge?.copyWith(fontSize: 18),),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.close,size: 24,color: AppColor.kTitleColor,))
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Divider(
                          thickness: 1.0,
                          color: AppColor.kOutlineColor,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16,right: 16,top: 5
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: popularImageList.length,
                                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 0.66,
                                          crossAxisCount: 2),
                                      itemBuilder: (i,index){
                                        if (popularStates.isEmpty) {
                                          popularStates = List.generate(popularImageList.length, (_) => false);
                                        }
                                        return GestureDetector(
                                          onTap: (){
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ServiceDetails()));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: color.primaryContainer,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Stack(
                                                  // alignment: Alignment.bottomLeft,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          height: 120,
                                                          decoration: BoxDecoration(
                                                              borderRadius: const BorderRadius.only(
                                                                topRight: Radius.circular(8),
                                                                topLeft: Radius.circular(8),
                                                              ),
                                                              image: DecorationImage(fit: BoxFit.cover, image: AssetImage(popularImageList[index]))),
                                                        ),
                                                        index == 0
                                                            ? Stack(
                                                          alignment: Alignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 5),
                                                              child: Image.asset(
                                                                'images/offerIcon.png',
                                                                height: 20,
                                                                width: 42,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 4),
                                                              child: Text(
                                                                '12%',
                                                                style: textTheme.titleMedium?.copyWith(fontSize: 12, color: color.primaryContainer),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                            : Container(),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 105, left: 8),
                                                      child: Container(
                                                        height: 28,
                                                        width: 116,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(24),
                                                            color: color.primaryContainer,
                                                            boxShadow: [BoxShadow(color: const Color(0xff000F37).withOpacity(0.1), blurRadius: 40, spreadRadius: 0, offset: const Offset(0, 0))]),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 24,
                                                              width: 24,
                                                              decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(avatar[index]))),
                                                            ),
                                                            Text(
                                                              'Wade Warren',
                                                              style: textTheme.titleMedium?.copyWith(fontSize: 12),
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Best Social media advertising',
                                                        style: textTheme.titleMedium,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      Text(
                                                        'Baby Care',
                                                        style: textTheme.bodySmall,
                                                      ),
                                                      Row(
                                                        children: [
                                                          // RatingBar.builder(
                                                          //   itemSize: 12,
                                                          //   initialRating: 5,
                                                          //   minRating: 1,
                                                          //   direction: Axis.horizontal,
                                                          //   allowHalfRating: true,
                                                          //   itemCount: 5,
                                                          //   itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                          //   itemBuilder: (context, _) => const Icon(
                                                          //     Icons.star,
                                                          //     color: Colors.amber,
                                                          //   ),
                                                          //   onRatingUpdate: (rating) {
                                                          //     // print(rating);
                                                          //   },
                                                          // ),
                                                          const Text('(56)')
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          RichText(
                                                              text: TextSpan(text: '${currencySign}50 ', style: textTheme.titleMedium?.copyWith(fontSize: 14), children: [
                                                                TextSpan(
                                                                  text: '${currencySign}60',
                                                                  style: textTheme.titleMedium?.copyWith(
                                                                      fontSize: 14, color: AppColor.kGreyTextColor, decoration: TextDecoration.lineThrough, decorationColor: AppColor.kGreyTextColor),
                                                                )
                                                              ])),
                                                          const Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                popularStates[index] = !popularStates[index];
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 24,
                                                              width: 24,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: color.secondaryContainer,
                                                              ),
                                                              child: popularStates[index]
                                                                  ? Icon(
                                                                CommunityMaterialIcons.heart,
                                                                size: 18,
                                                                color: color.error,
                                                              )
                                                                  : const Icon(
                                                                FeatherIcons.heart,
                                                                size: 17,
                                                                color: AppColor.kGreyTextColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  const SizedBox(height: 30,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: color.primaryContainer,
                              boxShadow: [
                                BoxShadow(
                                    color: color.shadow.withOpacity(0.1),
                                    blurRadius: 60
                                )
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GlobalButton(
                                      color: Colors.transparent,
                                      buttonColor: Colors.red,
                                      bordersideColor: Colors.red,
                                      textTheme: textTheme,
                                      buttonText: 'Cancel',
                                      onpressed: (){
                                        Navigator.pop(context);
                                      }),
                                ),
                                const SizedBox(width: 20,),
                                Expanded(child: GlobalButton(
                                    textTheme: textTheme,
                                    buttonText: 'Continue',
                                    onpressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateAnOrder()));
                                    }))
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
          );
        });
  }

  final ScrollController customScrollController = ScrollController();

  final TextEditingController messageEditingController =
  TextEditingController();
  late FocusNode msgFocus;

  @override
  void initState() {
    super.initState();
    msgFocus = FocusNode();
    msgFocus.addListener(() {
      // msgFocus.hasFocus ? scrollController.position.maxScrollExtent : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme color=Theme.of(context).colorScheme;

    return Scaffold(

        backgroundColor: color.surface,
        appBar: AppBar(
          surfaceTintColor: color.surface,
          elevation: 0.0,
          title: Row(
            children: [
              SizedBox(
                height: 44,
                width: 44,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('images/avatar.png'))
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //TODO: Enter valid activity status logic when working with APIs
                            color: widget.isActive
                                ? const Color(0xff69B22A)
                                : const Color(0xffbfbfbf),
                            border: Border.all(color: AppColor.kWhiteColor)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text.rich(
                TextSpan(
                    text: '${widget.receiver.influencerName}\n',
                    style: textTheme.titleSmall,
                    children: [
                      TextSpan(
                          text: widget.isActive ? 'Online' : 'Offline',
                          style: textTheme.bodySmall)
                    ]),
              )
            ],
          ),
          // actions: [
          //   const Icon(CommunityMaterialIcons.file_document_outline,color: AppColor.kGreyTextColor,),
          //   PopupMenuButton(
          //     padding: EdgeInsets.zero,
          //     offset: const Offset(-10, 20),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(5)),
          //     itemBuilder: (context) => [
          //       PopupMenuItem(
          //           onTap: () => Future.delayed(
          //               Duration.zero,
          //                   () => showDialog(
          //                 context: context,
          //                 builder: (context) => BlockUserPopup(
          //                     userName: widget.receiver.influencerName),
          //               )),
          //           child: Text('Block',style: textTheme.bodyMedium,)),
          //       PopupMenuItem(
          //           child: Text('Report',style: textTheme.bodyMedium,)),
          //     ],
          //     icon: const Icon(CommunityMaterialIcons.dots_vertical,color: AppColor.kGreyTextColor,),
          //   )
          // ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    controller: customScrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      MaanChatModel data = messages[index];

                      DateTime prev = index != messages.length - 1
                          ? messages[index + 1].date
                          : messages[index].date;
                      DateTime presn = messages[index].date;

                      bool showTime = presn.difference(prev).inMinutes != 0 ||
                          index == messages.length - 1;
                      return chats(message: data, showTime: showTime);
                    }),
              ),
              Container(
                alignment: Alignment.center,
                height: 80,
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                decoration: BoxDecoration(
                    color: AppColor.kWhiteColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: color.shadow.withOpacity(0.05),
                          spreadRadius: 0,
                          offset: const Offset(0, -3),
                          blurRadius: 20)
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => MaanImagePickerPopup(
                              galleryImage: () => _getImage(),
                            ),
                          ),
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.chatFiledColor),
                            child: const Icon(FeatherIcons.link, size: 20),
                          )
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          focusNode: msgFocus,
                          controller: messageEditingController,
                          decoration: InputDecoration(
                            // fillColor: const Color(0xffe8e8e8),
                              filled: true,
                              fillColor: AppColor.chatFiledColor,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(27),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(27),
                                  borderSide: BorderSide.none
                              ),
                              hintText: 'Message...',
                              suffixIcon: IconButton(
                                  onPressed: () => sendMsg(),
                                  iconSize: 24,
                                  color: color.primary,
                                  icon: const Icon(Icons.send))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

//-----------Chat Bubble Widget--------------//
  Widget chats({required MaanChatModel message, required bool showTime}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
      !message.isSentByMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Visibility(
          visible: !message.isSentByMe,
          child: SizedBox(
            height: 44,
            width: 44,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/avatar.png')
                      )
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //TODO: Enter valid activity status logic when working with APIs
                        color: widget.isActive
                            ? const Color(0xff69B22A)
                            : const Color(0xffbfbfbf),
                        border: Border.all(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: message.isSentByMe
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            message.text != null
                ? Container(
                width: 210,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                    color: message.isSentByMe
                        ? AppColor.kMainColor
                        : const Color(0xffDADADA),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomLeft: message.isSentByMe
                          ? const Radius.circular(20)
                          : const Radius.circular(0),
                      bottomRight: message.isSentByMe
                          ? const Radius.circular(0)
                          : const Radius.circular(20),
                    )),
                child: Text(
                  message.text!,
                  style:  TextStyle(color: message.isSentByMe
                      ? AppColor.kWhiteColor
                      : AppColor.kTitleColor),
                ))
                : Container(
              height: 92,
              width: 116,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(message.file!))),
            ),
            // Visibility(
            //     visible: showTime,
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 8, bottom: 16),
            //       child: Text(
            //         DateFormat('hh:mm a').format(message.date),
            //         style: const TextStyle(color: AppColor.kGreyTextColor,fontSize: 12),
            //       ),
            //     )),
            SizedBox(
              height: 20,
            ),
            Visibility(visible: !showTime, child: const SizedBox(height: 16))
          ],
        )
      ],
    );
  }
}

// //-----------User blocking--------------//
// class BlockUserPopup extends StatelessWidget {
//   const BlockUserPopup({Key? key, required this.userName}) : super(key: key);
//   final String userName;
//
//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme=Theme.of(context).textTheme;
//     ColorScheme color=Theme.of(context).colorScheme;
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       insetPadding: EdgeInsets.all(24),
//       titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
//       contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 12),
//       actionsPadding: EdgeInsets.fromLTRB(20, 12, 20, 20),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('Block on Messenger',
//             style: textTheme.titleLarge,),
//           InkResponse(
//               onTap: () => Navigator.pop(context),
//               child: const Icon(Icons.close,
//                   size: 24, color: AppColor.kNeaturalColor))
//         ],
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'If you’re friens, blocking $userName, The conversation will stay in chats unless you hide it',
//             style: textTheme.bodyMedium?.copyWith(color: AppColor.kGreyTextColor),
//           )
//         ],
//       ),
//       actions: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Expanded(
//               child: GlobalButton(
//                   // spalashColor: color.error,
//                   bordersideColor: Colors.red,
//                   buttonText: 'Cancel',
//                   textTheme: textTheme,
//                   buttonColor: Colors.red,
//                   color: Colors.transparent,
//                   onpressed: (){
//                     Navigator.pop(context);
//                   }),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//                 child: GlobalButton(
//                     textTheme: textTheme,
//                     buttonText: 'Block',
//                     onpressed: (){
//
//                     }))
//           ],
//         )
//       ],
//     );
//   }
// }
