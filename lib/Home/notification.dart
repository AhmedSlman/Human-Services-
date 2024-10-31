import 'package:flutter/material.dart';
import '../Widget/Theme/theme_constants.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<String> name = [
    'New Job request alert',
    'Update booking status ',
    'Assigned booking',
  ];
  List<String> name2 = [
    'New job request from will manroo',
    'Booking status has been changed from ongoing to in progress',
    'booking has been assigned to Rakibul Islam',
  ];
  List<String> name3 = [
    '5 min ago.',
    '26 Jun 2023',
    '26 Jun 2023',
  ];
  List<String> costomer = [
    'Jenny Wilson',
    'Darrell Steward',
    'Jacob Jones',
    'Guy Hawkins',
  ];
  List<String> details = [
    'Lorem ipsum dolor sit amet consectetur. ',
    'Lorem ipsum dolor sit amet consectetur. ',
    'Lorem ipsum dolor sit amet consectetur. ',
    'Lorem ipsum dolor sit amet consectetur. ',
  ];
  List<String> date = [
    '26 Jun 2023',
    '26 Jun 2023',
    '26 Jun 2023',
    '26 Jun 2023',
  ];
  List<dynamic> co = [const Color(0xffF25900), const Color(0xffFFECB5), Colors.transparent];
  List<String> pic = [
   'images/Notification1.png',
   'images/Notification2.png',
   'images/Notification3.png',
  ];
  List<String> pic2 = [
    'images/Notification1.png',
    'images/Notification2.png',
    'images/Notification3.png',
    'images/Notification4.png',
  ];
  void clearDilog(context) {
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
                    child: const Image(image: AssetImage('images/Danger.png')),
                  ),
                  const SizedBox(
                      height: 24
                  ),

                  Text(
                    'Are you sure want to delete \nall notification',
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
                                    color: color.primary, width: 1)),
                            child: Text(
                              'No',
                              style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: color.primary),
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
                            Navigator.pop(context);
                            //showAvailableStaff();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color.primary),
                            child: Text(
                              'Yes',
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
  bool doNotDisturb = false;
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
          'Notification',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                // if (value == 'clear_all') {
                // }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'do_not_disturb',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Do Not Disturb'),
                        Transform.scale(
                         scale: 0.8,
                          child: SizedBox(
                            height: 24,
                            width: 44,
                            child: Switch(
                              value: doNotDisturb,
                              onChanged: (value) {
                                setState(() {
                                  doNotDisturb = value;
                                });
                                Navigator.pop(context); // Close the menu after switching
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                   PopupMenuItem(
                    value: 'clear_all',
                    child: InkWell(
                      onTap: (){
                        clearDilog(context);
                      },
                        child: const Text('Clear All')),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 13,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  //  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: (){
                      },
                      child: Container(
                        height: 100,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xffEAEAEA)))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,image: DecorationImage(image: AssetImage(pic[index]))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name[index],
                                      style: textTheme.titleSmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      name2[index],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall?.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      name3[index],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall?.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 21,
              ),
              Text(
                'Yesterday',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 13,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xffEAEAEA)))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(pic2[index]),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    costomer[index],
                                    style: textTheme.titleSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    details[index],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    date[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
