import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:readmore/readmore.dart';

import '../../Widget/Theme/theme_constants.dart';


class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  List<String> name = [
    'Paypal',
    'Stripe',
    'Paytm',
    'Razorpay',
  ];
  List<String> image =[
    'images/pal.png',
    'images/pal1.png',
    'images/pal2.png',
    'images/pal3.png',

  ];
  List<bool> favouriteList=[];
  List<String> name2 = [
    'Paid',
    'Paid',
    'Failed',
    'Paid',
  ];
  List<dynamic> pic=[
    Color(0xff16A34A),
    Color(0xff16A34A),
    Color(0xffFF902A),
    Color(0xff16A34A),
  ];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        title: Text('My Wallet',style: textTheme.titleLarge,),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 68,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: AssetImage('images/Cash.png'),fit: BoxFit.cover)
                ),
                child: ListTile(

                  title: Text('Current Balance',style: textTheme.bodySmall?.copyWith(color: Color(0xffEAEAEA),fontWeight: FontWeight.w400),),
                  subtitle: Text('\$500.00',style: textTheme.titleSmall?.copyWith(color: AppColor.kWhiteColor),),
                  trailing: InkWell(
                    onTap: (){
                      showModalBottomSheet(
                          backgroundColor: color.surface,
                          isScrollControlled: true,
                          isDismissible: false,
                          context: context,
                          builder: (BuildContext context){
                            return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                              if(favouriteList.isEmpty)
                              {
                                favouriteList=List.generate(name.length, (_)=>false);
                              }
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 48,
                                    decoration: const BoxDecoration(border: Border(
                                        bottom: BorderSide(
                                            color: AppColor.kLightNeaturalColor,width: 1
                                        )
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Choose Payment Method',style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),),
                                          CloseButton(
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,right: 20),
                                    child: SizedBox(
                                      height: 254,
                                      child: ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: name.length,

                                          itemBuilder:(context,index){
                                            return Padding(
                                              padding: const EdgeInsets.only(bottom: 10),
                                              child: Container(
                                                  height: 56,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:AppColor.kWhiteColor,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: const Color(0xff848484).withOpacity(0.1),
                                                            offset: const Offset(0, 4),
                                                            blurRadius: 24,
                                                            spreadRadius: -4
                                                        )
                                                      ]
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 80,
                                                        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),
                                                          bottomLeft: Radius.circular(8),),
                                                          image: DecorationImage(image: AssetImage(image[index]),),
                                                          color: 'Paypal' == name[index]
                                                              ? const Color(0xffE4F7FF)
                                                              : 'Stripe' == name[index]
                                                              ? const Color(0xffF0EFFF)
                                                              : 'Paytm' == name[index]
                                                              ? const Color(0xffE6F9FE)
                                                              : 'Razorpay' == name[index]
                                                              ? const Color(0xffF0EFFF)
                                                              : const Color(0xffDCFCE7),),
                                                        // child: SvgPicture.asset(image[index]),
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Text(name[index],style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
                                                      Spacer(),
                                                      InkWell(
                                                          onTap: (){
                                                            setState((){
                                                              for (int i = 0; i < favouriteList.length; i++) {
                                                                favouriteList[i] = false;
                                                              }
                                                              // Set the current index to true
                                                              favouriteList[index] = true;
                                                            });
                                                          },
                                                          child:favouriteList[index]?Icon(Icons.check_circle,color: color.primary,):
                                                          const Icon(Icons.circle_outlined,color: AppColor.kGreyTextColor,)),
                                                      SizedBox(width: 16,)
                                                    ],
                                                  )
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),

                                  Container(
                                    height: 142,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: AppColor.kWhiteColor
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Column(
                                        children: [
                                          RichText(text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: 'Total Price: ', style:
                                                textTheme.bodyLarge?.copyWith(color: AppColor.kGreyTextColor,fontWeight: FontWeight.w400)
                                                ),
                                                TextSpan(
                                                    text: '\$500',style: textTheme.titleLarge
                                                )
                                              ]
                                          )),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20,right: 20),
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 48,
                                                //width: 335,
                                                decoration: BoxDecoration(color: color.primary,borderRadius: BorderRadius.circular(8)),
                                                child: Text('Request Send',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor),),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                              // return DraggableScrollableSheet(
                              //     maxChildSize: 1,
                              //     expand: false,
                              //     minChildSize: 0.2,
                              //     initialChildSize: 0.57,
                              //     builder:(BuildContext context, ScrollController scrollController){
                              //       if(favouriteList.isEmpty)
                              //       {
                              //         favouriteList=List.generate(name.length, (_)=>false);
                              //       }
                              //       return Column(
                              //         children: [
                              //           Container(
                              //             height: 48,
                              //             decoration: const BoxDecoration(border: Border(
                              //                 bottom: BorderSide(
                              //                     color: AppColor.kLightNeaturalColor,width: 1
                              //                 )
                              //             )),
                              //             child: Padding(
                              //               padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                              //               child: Row(
                              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 children: [
                              //                   Text('Choose Payment Method',style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),),
                              //                   CloseButton(
                              //                     onPressed: (){
                              //                       Navigator.pop(context);
                              //                     },
                              //                   )
                              //                 ],
                              //               ),
                              //             ),
                              //           ),
                              //           const SizedBox(
                              //             height: 15,
                              //           ),
                              //           Padding(
                              //             padding: const EdgeInsets.only(left: 20,right: 20),
                              //             child: SizedBox(
                              //               height: 254,
                              //               child: ListView.builder(
                              //                   physics: const NeverScrollableScrollPhysics(),
                              //                   itemCount: name.length,
                              //
                              //                   itemBuilder:(context,index){
                              //                     return Padding(
                              //                       padding: const EdgeInsets.only(bottom: 10),
                              //                       child: Container(
                              //                           height: 56,
                              //                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:AppColor.kWhiteColor,
                              //                               boxShadow: [
                              //                                 BoxShadow(
                              //                                     color: const Color(0xff848484).withOpacity(0.1),
                              //                                     offset: const Offset(0, 4),
                              //                                     blurRadius: 24,
                              //                                     spreadRadius: -4
                              //                                 )
                              //                               ]
                              //                           ),
                              //                           child: Row(
                              //                             children: [
                              //                               Container(
                              //                                 alignment: Alignment.center,
                              //                                 width: 80,
                              //                                 decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),
                              //                                   bottomLeft: Radius.circular(8),),
                              //                                   image: DecorationImage(image: AssetImage(image[index]),),
                              //                                   color: 'Paypal' == name[index]
                              //                                       ? const Color(0xffE4F7FF)
                              //                                       : 'Stripe' == name[index]
                              //                                       ? const Color(0xffF0EFFF)
                              //                                       : 'Paytm' == name[index]
                              //                                       ? const Color(0xffE6F9FE)
                              //                                       : 'Razorpay' == name[index]
                              //                                       ? const Color(0xffF0EFFF)
                              //                                       : const Color(0xffDCFCE7),),
                              //                                 // child: SvgPicture.asset(image[index]),
                              //                               ),
                              //                               SizedBox(width: 20,),
                              //                               Text(name[index],style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
                              //                               Spacer(),
                              //                               InkWell(
                              //                                   onTap: (){
                              //                                     setState((){
                              //                                       for (int i = 0; i < favouriteList.length; i++) {
                              //                                         favouriteList[i] = false;
                              //                                       }
                              //                                       // Set the current index to true
                              //                                       favouriteList[index] = true;
                              //                                     });
                              //                                   },
                              //                                   child:favouriteList[index]?Icon(Icons.check_circle,color: color.primary,):
                              //                                   const Icon(Icons.circle_outlined,color: AppColor.kGreyTextColor,)),
                              //                               SizedBox(width: 16,)
                              //                             ],
                              //                           )
                              //                       ),
                              //                     );
                              //                   }
                              //               ),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             height: 24,
                              //           ),
                              //
                              //           Container(
                              //             height: 142,
                              //             width: double.infinity,
                              //             decoration: const BoxDecoration(
                              //                 color: AppColor.kWhiteColor
                              //             ),
                              //             child: Padding(
                              //               padding: const EdgeInsets.only(top: 25),
                              //               child: Column(
                              //                 children: [
                              //                   RichText(text: TextSpan(
                              //                       children: [
                              //                         TextSpan(
                              //                             text: 'Total Price: ', style:
                              //                         textTheme.bodyLarge?.copyWith(color: AppColor.kGreyTextColor,fontWeight: FontWeight.w400)
                              //                         ),
                              //                         TextSpan(
                              //                             text: '\$500',style: textTheme.titleLarge
                              //                         )
                              //                       ]
                              //                   )),
                              //                   const SizedBox(
                              //                     height: 15,
                              //                   ),
                              //                   InkWell(
                              //                     onTap: (){
                              //                       Navigator.pop(context);
                              //                     },
                              //                     child: Padding(
                              //                       padding: const EdgeInsets.only(left: 20,right: 20),
                              //                       child: Container(
                              //                         alignment: Alignment.center,
                              //                         height: 48,
                              //                         //width: 335,
                              //                         decoration: BoxDecoration(color: color.primary,borderRadius: BorderRadius.circular(8)),
                              //                         child: Text('Request Send',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor),),
                              //                       ),
                              //                     ),
                              //                   )
                              //                 ],
                              //               ),
                              //             ),
                              //           )
                              //         ],
                              //       );
                              //     } );
                            }
                            );
                          }

                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 53,
                      width: 32,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                          color: Color(0xffAC9DFF),border: Border.all(color:AppColor.kWhiteColor,width: 0.5)),
                      child: Icon(Icons.arrow_forward_ios_rounded,color: AppColor.kWhiteColor,size: 14,),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
             Container(
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                 border: RDottedLineBorder.all(
                   color: Color(0xffFF902A),
                 ),color: Color(0xffFFF1E4)
               ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: RDottedLineBorder.all(
                            color: Color(0xffFFC48D),
                          ),
                          ),
                        child: SvgPicture.asset('images/alert.svg'),
                      ),
                      // DottedBorder(
                      //   dashPattern: [5.1],
                      //   borderType: BorderType.Circle,
                      //   color: Color(0xffFFC48D),
                      //   strokeWidth: 1,
                      //   child: Container(
                      //     padding: EdgeInsets.all(10),
                      //     height: 40,
                      //     width: 40,
                      //     decoration: BoxDecoration(shape: BoxShape.circle,color:AppColor.kWhiteColor,
                      //     ),
                      //     child: SvgPicture.asset('images/alert.svg'),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Payout Request'),
                            Column(
                              children: [
                                ReadMoreText(
                                  'You can request a payout once your balance if greater than \$50.'
                                      ' we will transfer your earnings balance to your PayPal in the next 30 business days.',
                                  style:textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                                  trimLines: 2,
                                  colorClickableText:Color(0xffFF902A),
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Read more',
                                  trimExpandedText: 'Read less',
                                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Color(0xffFF902A)),
                                ),
                              ],
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Wallet History',style: textTheme.titleLarge,),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:AppColor.kWhiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xff848484).withOpacity(0.1),
                                  offset: const Offset(0, 4),
                                  blurRadius: 24,
                                  spreadRadius: -4
                              )
                            ]),
                        child: ListTile(
                          title: Text('PayPal',style: textTheme.titleMedium,),
                          subtitle: Text('24 Jun 2024',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),),
                          trailing: Column(
                            children: [
                              Text('\$500',style: textTheme.titleMedium,),
                              Text(name2[index], style:textTheme.bodySmall?.copyWith
                                (fontWeight: FontWeight.w400,color:pic[index])


                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
