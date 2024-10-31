import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:handyman_provider/extra-service/extra_service.dart';
import 'package:handyman_provider/extra-service/new_extra_service.dart';
import 'package:handyman_provider/my_service/edit_service.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import '../../Widget/Theme/theme_constants.dart';

class ServicesDetails extends StatefulWidget {
  const ServicesDetails({
    super.key,
    required this.myView,
    required this.initialIndex,
  });
  final EditDetails myView;
  final int initialIndex;
  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  List<String> name1 = ['Overview', 'Extra Service', 'FAQs', 'Review'];
  List<String> photo = [
    'images/9.jpeg',
    'images/8.jpeg',
    'images/7.jpeg',
    'images/6.jpeg',
  ];
  //List<bool> _isExpandedList = List<bool>.filled(text.length, false);
  List<String> staffName = [
    'Devon Lane',
    'Cameron William',
    'Jacob Jones',
    'Jane Cooper',
  ];
  List<String> service = [
    'AC & Fridge repair experts',
    'Cooking experts',
    'Cleaning experts',
    'Shifting experts',
  ];
  List<String> text = [
    'What if my AC is under Warranty?',
    'Why should I trust Hendayman Service pro',
    'Why should I trust Hendayman Service pro',
    'Why should I trust Hendayman Service pro',
  ];
  List<String> ac = [
    'images/recent2.png',
    'images/Services.jpeg',
    'images/view1.jpeg',
  ];
  int currentIndexPage = 0;
  List<String> add = [
    'Add',
    'Add',
    'Add',
  ];
  // PageController pageController = PageController(initialPage: 0);
  //int _current = 0;
 List<bool> status = [];
  int selected = 0;
  int maxIndicators = 3;
  // late List<String> photoList;
  // int pageIndex = 0;
  void _deleteItem(int index) {
    setState(() {
     ac.removeAt(index);
    });
  }

 double percent = 0.33;
  // late PageController pageController;

  List<bool> _isExpandedList = [];
 String? selectedStaff;
  late List<String> photoList;
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();

    if (widget.myView.photo.isNotEmpty && widget.initialIndex < widget.myView.photo.length) {
      _isExpandedList = List<bool>.filled(text.length, false);

      photoList = List.from(widget.myView.photo);
      final String clickedImage = photoList.removeAt(widget.initialIndex);
      photoList.insert(0, clickedImage);

      if (photoList.length > 3) {
        photoList = photoList.sublist(0, 3);
      }
    } else {
      photoList = []; // Handle the case where photoList is empty or invalid
    }

    pageController = PageController(initialPage: pageIndex);
  }

  bool _isSwitched = false;

  // Function to handle switch changes
  void _onSwitchChanged(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }
 final int _maxVisiblePages = 3;

  @override
  Widget build(BuildContext context) {
final editService1= EditDetails(
    image: widget.myView.image,
    name: widget.myView.name,
    userName: '',
    address: '',
    designation: '',
    phone: '',
    subtitle: '',
    price:widget.myView.price,
    discount:'%30' ,
    time: 2, email: '', city: '', state: '', zipCode: 0,
    photo:widget.myView.photo);

    // final int itemCount = photoList.length > _maxVisiblePages
    //     ? _maxVisiblePages
    //     : widget.myView.photo.length;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        elevation: 0.0,
        surfaceTintColor: color.primaryContainer,
        title: Text('Service Details',
            style: textTheme.titleLarge?.copyWith(
                color: AppColor.kTitleColor,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
              Transform.scale(
                scale: 0.8,
                child: SizedBox(
                  height:24,
                  width: 44,
                  child: Switch(value:_isSwitched,
                      onChanged: _onSwitchChanged),
                ),
              ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Share.share('Check out this cool Flutter package!',
                        subject: 'Flutter Share Plus');
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                        color: Color(0xfffff4ea), shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        CommunityMaterialIcons.share,
                        color: Color(0xffFF902A),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (photoList.isNotEmpty)
              Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) => setState(() {
                        pageIndex = value;
                      }),
                      itemCount: photoList.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Container(
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              image: DecorationImage(
                                image: AssetImage(photoList[index]),
                                // image: AssetImage(widget.myView.image[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(photoList.length, (index) {
                      if (photoList.length > maxIndicators &&
                          index >= maxIndicators) {
                        return const SizedBox();
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          height: 5.0,
                          width: pageIndex == index ? 20.0 : 5.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: pageIndex == index
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                          ),
                        ),
                      );
                    }),
                  ),
                  /////
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.myView.name,
                            maxLines: 1, style: textTheme.titleLarge),
                        const SizedBox(height: 5),
                        Text(
                          widget.myView.subtitle,
                          maxLines: 1,
                          style: textTheme.bodyMedium?.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: AppColor.kGreyTextColor,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                             widget.myView.price,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff6850F3),
                                  fontWeight: FontWeight.bold),
                            ),
                            //Text('\$600',style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 14,color: Color(0xffB7B7B7)),),
                            const SizedBox(
                              width: 2,
                            ),
                            RichText(
                                text: const TextSpan(
                              text: "\$600",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Color(0xffB7B7B7),
                                  fontWeight: FontWeight.bold),
                            )),
                            const Spacer(
                              flex: 1,
                            ),
                            Container(
                              height: 24,
                              width: 69,
                              decoration: const BoxDecoration(
                                  color: Color(0xffFEF2F2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: const Center(
                                  child: Text(
                                "30% OFF",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffDC2626)),
                              )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Row(
                          children: [
                            Text(
                              'Duration: ',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff6F6F6F)),
                            ),
                            Text('30 min',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff1C1C1C))),
                            Spacer(
                              flex: 1,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Color(0xffFACC15),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff1C1C1C)),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text('(10 Review)',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff6F6F6F)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 42,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(color: AppColor.kLightNeaturalColor,width: 0.5),
                  top: BorderSide(color: AppColor.kLightNeaturalColor,width: 0.5)
                ),boxShadow: [
                BoxShadow(
                    color: const Color(0xff848484).withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 24,
                    spreadRadius: -4
                )
              ]
              ),
              child: ListView.builder(
                itemCount: name1.length,
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemBuilder:(context,index){
                    if (status.isEmpty) {
                      status = List.generate(name1.length, (_) => false);
                    }
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: (){
                         setState(() {
                           for (int i = 0; i < status.length;
                           i++) { status[i] = false; }
                           status[index] = true;
                         });
                        },
                        child: Container(
                          //padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: status[index]?const Color(0xffEDE6FD):Colors.transparent,
                            border: Border.all(color:status[index]?Colors.transparent:AppColor.kLightNeaturalColor,width: 1),
                          ),
                          child: Padding(
                            padding:  const EdgeInsets.fromLTRB(12, 0, 12, 0),
                            child: Text(name1[index],style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500,color: status[index]?color.primary:AppColor.kGreyTextColor),),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                      child: Column(
                    children: [
                      ReadMoreText(
                        'You can request a payout once your balance if greater than \$50.'
                        ' we will transfer your earnings balance to your PayPal in the next 30 business days.'
                        'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                        style: textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                        trimLines: 2,
                        //colorClickableText:Color(0xffFF902A),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Read less',
                        moreStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: color.primary),
                        lessStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: color.primary),
                      ),
                    ],
                  )),
                  const SizedBox(height: 20),
                  Text(
                    'Service Provider',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutProvider()));
                    },
                    child: Container(
                      height: 84,
                      // width: 335,
                      decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 64,
                            width: 64,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/chat7.png'),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shaidul Islam',
                                style: textTheme.titleLarge,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Color(0xffFACC15),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff1C1C1C)),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text('(10 Reviews)',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff6F6F6F)))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Extra Service',
                        style: textTheme.titleLarge,
                      ),
                      const Spacer(),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const ExtraService()));
                        },
                          child: Text('+ Add New',style: textTheme.titleSmall?.copyWith(color: color.primary),))
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ac.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(
                              height: 76,
                              //width: 335,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColor.kWhiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xffADADAD)
                                            .withOpacity(0.1),
                                        blurRadius: 16,
                                        spreadRadius: -3,
                                        offset: const Offset(0, 2))
                                  ]),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 60,
                                      width: 66,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: DecorationImage(
                                              image: AssetImage(ac[index]),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ac Cleaning and Sanitization',
                                          maxLines: 1,
                                          style: textTheme.titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                        ),
                                        ///////////////////////


                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                '\$100',
                                                style: textTheme.titleSmall,
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: (){
                                                  Navigator.push(context,MaterialPageRoute(builder: (_)=>const NewExtraService()));
                                                },
                                                  child: const Icon(Icons.edit_note,size: 25,color: AppColor.kGreenColor,)),
                                              const SizedBox(width: 8,),
                                              InkWell(onTap: (){
                                                _deleteItem(index);
                                              },
                                                  child: const Icon(Icons.delete_outline_outlined,size: 25,color: Color(0xffDC2626),))
                                            ],
                                          ),
                                        )


                                        /////////////////////////
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                  const SizedBox(height: 20),
                  Text(
                    'FAQs',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        if (_isExpandedList.isEmpty) {
                          _isExpandedList =
                              List.generate(text.length, (_) => false);
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColor.kWhiteColor, border: Border.all(color: const Color(0xffEAEAEA), width: 1)),
                            child: Theme(
                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  text[index],
                                  style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                trailing: Icon(
                                  _isExpandedList[index] ? Icons.remove_circle_outline : Icons.add_circle_outline_outlined,
                                  color: _isExpandedList[index] ? AppColor.kMainColor : AppColor.kLightNeaturalColor,
                                ),
                                onExpansionChanged: (bool expanded) {
                                  setState(() {
                                    _isExpandedList[index] = expanded;
                                  });
                                },
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 12),
                                    child: Text(
                                      'Yes, you can try us for free for 30 days. If you want, '
                                          'we’ll provide you with a free, personalized 30-minute session.',
                                      style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  
                  const SizedBox(height: 4),
                  const Text(
                    'Customer Reviews',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1C1C1C)),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 64,
                    //width: 335,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                            image: AssetImage('images/Group.png'),
                            fit: BoxFit.cover)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        children: [
                          Icon(
                            CommunityMaterialIcons.star,
                            size: 24,
                            color: Color(0xffFFFFFF),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            '4.59',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Color(0xffFFFFFF)),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('1,000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: Color(0xffFFFFFF))),
                              Text('Reviews',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xffFFFFFF))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            height: 116,
                            //width: 335,
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: const Color(0xff3E3E70),
                                    width: 0.1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 12, 8, 12),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/cus.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Abdur Korim',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff1C1C1C)),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 14,
                                              width: 90,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Color(0xffFF902A),
                                                  ),
                                                  SizedBox(
                                                    width: 1,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Color(0xffFF902A),
                                                  ),
                                                  SizedBox(
                                                    width: 1,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Color(0xffFF902A),
                                                  ),
                                                  SizedBox(
                                                    width: 1,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Color(0xffFF902A),
                                                  ),
                                                  SizedBox(
                                                    width: 1,
                                                  ),
                                                  Icon(
                                                    FeatherIcons.star,
                                                    size: 14,
                                                    color: Color(0xffFF902A),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100,
                                            ),
                                            Text(
                                              '5, June 2022',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff6F6F6F)),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, bottom: 11, right: 10),
                                  child: Text(
                                    'Nibh nibh quis dolor in. Etiam cras nisi, turpis quisqe diam ',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff6F6F6F)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){


                },
                child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xffDC2626),width: 1),
                    ),
                    child: Text('Delete',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color:const Color(0xffDC2626),),)
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> EditService(editService1: editService1,)));
                },
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: color.primary
                  ),
                  child: Text('Edit',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColor.kWhiteColor),),
                ),
              ),
            ),

          ],
        ),
      ),
      // bottomSheet: BottomAppBar(
      //     height: 142,
      //     shape: const AutomaticNotchedShape(RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)))),
      //     padding: const EdgeInsets.only(
      //       bottom: 10,
      //     ),
      //     child: Container(
      //       height: 142,
      //       width: double.infinity,
      //       decoration: const BoxDecoration(color: Color(0xffFFFFFF), borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      //       child: Column(
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 RichText(
      //                     text: const TextSpan(
      //                         text: 'Total Qty:',
      //                         style: TextStyle(fontSize: 16, color: Color(0xff6F6F6F)),
      //                         children: [TextSpan(text: ' 2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff1C1C1C)))])),
      //                 const SizedBox(
      //                   width: 8,
      //                 ),
      //                 Container(
      //                   height: 24,
      //                   width: 2,
      //                   color: const Color(0xff6F6F6F),
      //                 ),
      //                 RichText(
      //                   text: const TextSpan(
      //                       text: 'Total Price: ',
      //                       style: TextStyle(fontSize: 16, color: Color(0xff6F6F6F)),
      //                       children: [TextSpan(text: '\$400', style: TextStyle(fontSize: 16, color: Color(0xff1C1C1C)))]),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 InkWell(
      //                   onTap: () {
      //                     showModalBottomSheet(
      //                         isScrollControlled: true,
      //                         context: context,
      //                         builder: (_) {
      //                           return StatefulBuilder(builder: (BuildContext context, setState) {
      //                             return Container(
      //                               decoration: const BoxDecoration(
      //                                 color: Color(0xffFFFFFF),
      //                                 borderRadius: BorderRadius.only(
      //                                   topRight: Radius.circular(24),
      //                                   topLeft: Radius.circular(24),
      //                                 ),
      //                               ),
      //                               child: Column(
      //                                 mainAxisSize: MainAxisSize.min,
      //                                 children: [
      //                                   Container(
      //                                     height: 48,
      //                                     width: double.infinity,
      //                                     decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffE6E6E9), width: 1))),
      //                                     child: Padding(
      //                                       padding: const EdgeInsets.only(left: 20, right: 10),
      //                                       child: Row(
      //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                         children: [
      //                                           const Text(
      //                                             'Available Staff',
      //                                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //                                           ),
      //                                           CloseButton(
      //                                             onPressed: () {
      //                                               Navigator.pop(context);
      //                                             },
      //                                           )
      //                                         ],
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   Padding(
      //                                     padding: const EdgeInsets.all(20.0),
      //                                     child: Column(
      //                                       children: [
      //                                         ListView.builder(
      //                                           //padding: const EdgeInsets.all(16.0),
      //                                             itemCount: staffName.length,
      //                                             shrinkWrap: true,
      //                                             itemBuilder: (context, index) {
      //
      //                                               return InkWell(
      //                                                 onTap: () {
      //                                                   setState(() {
      //
      //                                                     selectedStaff = staffName[index];
      //                                                   });
      //                                                 },
      //                                                 child: Container(
      //                                                   margin: const EdgeInsets.only(bottom: 10),
      //                                                   decoration: BoxDecoration(
      //                                                       color: selectedStaff == staffName[index] ? const Color(0xffEDE6FD) : color.primaryContainer,
      //                                                       borderRadius: const BorderRadius.all(Radius.circular(8))),
      //                                                   child: ListTile(
      //                                                     visualDensity: const VisualDensity(),
      //                                                     isThreeLine: false,
      //                                                     leading: Badge(
      //                                                       backgroundColor: const Color(0xff16A34A),
      //                                                       child: Container(
      //                                                         height: 56,
      //                                                         width: 56,
      //                                                         decoration: BoxDecoration(
      //                                                             borderRadius: const BorderRadius.all(
      //                                                               Radius.circular(4),
      //                                                             ),
      //                                                             image: DecorationImage(image: AssetImage(photo[index]), fit: BoxFit.cover)),
      //                                                       ),
      //                                                     ),
      //                                                     title: Text(
      //                                                       staffName[index],
      //                                                       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff1C1C1C)),
      //                                                     ),
      //                                                     subtitle: Text(
      //                                                       service[index],
      //                                                       maxLines: 1,
      //                                                       style:
      //                                                       TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis, color: selectedStaff == staffName[index] ? AppColor.kTitleColor : const Color(0xff6F6F6F)),
      //                                                     ),
      //                                                     trailing: selectedStaff == staffName[index]
      //                                                         ? Icon(
      //                                                       Icons.check_circle,
      //                                                       size: 20,
      //                                                       color: color.primary,
      //                                                     )
      //                                                         : const Icon(
      //                                                       Icons.circle_outlined,
      //                                                       size: 20,
      //                                                     ),
      //                                                   ),
      //                                                 ),
      //                                               );
      //                                             }),
      //                                         const SizedBox(height: 24),
      //                                         InkWell(
      //                                           onTap: () {
      //                                             Navigator.pop(context);
      //                                           },
      //                                           child: Container(
      //                                             height: 48,
      //                                             // width: 335,
      //                                             decoration: const BoxDecoration(color: Color(0xff6850F3), borderRadius: BorderRadius.all(Radius.circular(8))),
      //                                             child: const Center(
      //                                                 child: Text(
      //                                                   'Confirm',
      //                                                   style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFFFFFF), fontSize: 16),
      //                                                 )),
      //                                           ),
      //                                         )
      //                                       ],
      //                                     ),
      //                                   ),
      //                                   const SizedBox(
      //                                     height: 10,
      //                                   ),
      //                                 ],
      //                               ),
      //                             );
      //                           });
      //                         });
      //                   },
      //                   child: Container(
      //                     height: 48,
      //                     width: 48,
      //                     decoration: BoxDecoration(
      //                         borderRadius: const BorderRadius.all(
      //                           Radius.circular(8),
      //                         ),
      //                         border: Border.all(color: const Color(0xff6850F3), width: 1),
      //                         color: const Color(0xffede6fd),
      //                         image: const DecorationImage(image: AssetImage('images/Elec.png'))),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   width: 10,
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     showModalBottomSheet(
      //                         context: context,
      //                         builder: (_) => Container(
      //                           height: 270,
      //                           decoration: const BoxDecoration(color: Color(0xffFFFFFF), borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24))),
      //                           child: Column(
      //                             children: [
      //                               Container(
      //                                 height: 48,
      //                                 width: double.infinity,
      //                                 decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffE6E6E9), width: 1))),
      //                                 child: Padding(
      //                                   padding: const EdgeInsets.only(left: 25, right: 10),
      //                                   child: Row(
      //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                     children: [
      //                                       const Text(
      //                                         'Create Post',
      //                                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //                                       ),
      //                                       CloseButton(
      //                                         onPressed: () {
      //                                           Navigator.pop(context);
      //                                         },
      //                                       )
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ),
      //                               Stack(
      //                                 children: [
      //                                   Padding(
      //                                     padding: const EdgeInsets.all(20.0),
      //                                     child: Container(
      //                                       height: 152,
      //                                       //width: 335,
      //                                       decoration: const BoxDecoration(
      //                                           borderRadius: BorderRadius.all(
      //                                             Radius.circular(8),
      //                                           ),
      //                                           image: DecorationImage(image: AssetImage('images/offer.png'), fit: BoxFit.cover)),
      //                                     ),
      //                                   ),
      //                                   Padding(
      //                                     padding: const EdgeInsets.only(left: 36, top: 36),
      //                                     child: Column(
      //                                       mainAxisAlignment: MainAxisAlignment.start,
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //                                       children: [
      //                                         Text(
      //                                           'Can\'t Find Your Mindful Service?',
      //                                           style: textTheme.titleSmall,
      //                                         ),
      //                                         const SizedBox(
      //                                           height: 5,
      //                                         ),
      //                                         SizedBox(
      //                                           width: MediaQuery.of(context).size.width / 1.5,
      //                                           child: Text(
      //                                             'Create a post about your service with customized description & Pricing',
      //                                             style: mTextStyle.copyWith(fontSize: 12),
      //                                           ),
      //                                         ),
      //                                         const SizedBox(
      //                                           height: 10,
      //                                         ),
      //                                         GlobalButton(
      //                                           height: 40,
      //                                           width: 130,
      //                                           textTheme: textTheme,
      //                                           buttonText: 'Create Post',
      //                                           onpressed: () {
      //                                             Navigator.push(context, MaterialPageRoute(builder: (_) => const CreatePost()));
      //                                           },
      //                                         )
      //                                       ],
      //                                     ),
      //                                   )
      //                                 ],
      //                               )
      //                             ],
      //                           ),
      //                         ));
      //                   },
      //                   child: Container(
      //                     height: 48,
      //                     width: 48,
      //                     decoration: BoxDecoration(
      //                         borderRadius: const BorderRadius.all(
      //                           Radius.circular(8),
      //                         ),
      //                         border: Border.all(color: const Color(0xff6850F3), width: 1),
      //                         color: const Color(0xffede6fd),
      //                         image: const DecorationImage(
      //                           image: AssetImage('images/Edit.png'),
      //                         )),
      //                   ),
      //                 ),
      //                 const SizedBox(width: 10),
      //                 Expanded(
      //                   // flex: 4,
      //                   child: InkWell(
      //                     onTap: () {
      //                       //Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
      //                     },
      //                     child: Container(
      //                       // width: 219,
      //                       height: 48,
      //                       decoration: const BoxDecoration(
      //                         borderRadius: BorderRadius.all(
      //                           Radius.circular(8),
      //                         ),
      //                         color: Color(0xff6850F3),
      //                       ),
      //                       child: const Center(
      //                           child: Text(
      //                             'Add TO Card',
      //                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xffFFFFFF)),
      //                           )),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     )),
    );
  }
}
