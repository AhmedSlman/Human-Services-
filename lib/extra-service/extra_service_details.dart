import 'package:flutter/material.dart';
import 'package:handyman_provider/Widget/Const%20Data/details.dart';
import 'package:handyman_provider/Widget/Theme/theme_constants.dart';
import 'package:handyman_provider/extra-service/new_extra_service.dart';

import 'extra_service.dart';

class ExtraServiceDetails extends StatefulWidget {
  const ExtraServiceDetails({super.key, required this.details});
final EditDetails details;
  @override
  State<ExtraServiceDetails> createState() => _ExtraServiceDetailsState();
}

class _ExtraServiceDetailsState extends State<ExtraServiceDetails> {
  bool _isSwitched = false;


  void _onSwitchChanged(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }
  int currentIndexPage = 0;
  int pageIndex = 0;
  final int _maxVisiblePages = 3;
  int maxIndicators = 3;

  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(); // Initialize PageController here
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose of PageController when no longer needed
    super.dispose();
  }
  // void _deleteItem(int index) {
  //   setState(() {
  //     widget.details.title.length.toString()removeAt(index);
  //   });
  // }


  void deleteDilog(context) {
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
                            image: AssetImage('images/ss.png'))),
                    child: const Image(image: AssetImage('images/trash.png')),
                  ),
                  const SizedBox(
                      height: 24
                  ),
                  Text(
                    'Are You Sure',
                    style: textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'You won’t  be able to delete this!',
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.kGreyTextColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xffDC2626), width: 1)),
                            child: Text(
                              'No, Rejected',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffDC2626)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (_)=>const ExtraService()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color.primary),
                            child: Text(
                              'Yes, Delete It',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final int itemCount = widget.details.image.length > _maxVisiblePages
        ? _maxVisiblePages
        : widget.details.image.length;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('Service Details',style: textTheme.titleLarge,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Transform.scale(
              scale: 0.8,
              child: SizedBox(
                height: 24,
                width: 44,
                child: Switch(
                    value: _isSwitched,
                    onChanged: _onSwitchChanged),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  currentIndexPage = pageIndex;
                  pageIndex = value;
                }),
                itemCount: itemCount,
                itemBuilder: (_, index) {
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.details.image),
                        fit: BoxFit.cover,
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
              List.generate(widget.details.image.length, (index) {
                if (widget.details.image.length > maxIndicators &&
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
            const SizedBox(
              height: 8,
            ),
            Text(widget.details.name,style: textTheme.titleLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
            const SizedBox(
              height: 2,
            ),
            Text('AC Repair',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),),
            const SizedBox(
              height: 8,
            ),
            RichText(text: TextSpan(
              children:[
                TextSpan(
                  text: 'Price:',style: textTheme.titleMedium?.copyWith(color: AppColor.kGreyTextColor)
                ),
                TextSpan(
                  text: ' \$500',style: textTheme.titleMedium?.copyWith(color: color.primary,fontWeight: FontWeight.w600),
                )
              ]
            )),
            const SizedBox(
              height: 16,
            ),
            Text('Description',style: textTheme.titleLarge,),
            const SizedBox(
              height: 8,
            ),
            Text('N/A',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor),)
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
                  deleteDilog(context);
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
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const NewExtraService()));
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
    );
  }
}
