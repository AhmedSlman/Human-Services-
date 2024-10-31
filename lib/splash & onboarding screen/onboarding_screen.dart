import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Authentication/login_screen.dart';
import '../Authentication/sign_up.dart';
import '../Widget/Const Data/consstant_data.dart';
import '../Widget/Const Data/golobal_button.dart';
import '../Widget/Theme/theme_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Map<String, dynamic>> getSliderList({required BuildContext context}) {
    List<Map<String, dynamic>> sliderList = [
      {
        "title": 'Welcome to App Name!',
        "description": 'Your go-to app for a hassle-free life. We\'re here to'
            'help all your needs, anytime & anywhere.Your go-to app for a hassle-free life. ',
        "icon": AppInfo.onBoard1,
      },
      {
        "title": 'Easily We fix Your Problem',
        "description": 'Your go-to app for a hassle-free life. We\'re here to'
            'help all your needs, anytime & anywhere.Your go-to app for a hassle-free life. ',
        "icon": AppInfo.onBoard2,
      },
      {
        "title": 'Safe And Secure Service',
        "description": 'Your go-to app for a hassle-free life. We\'re here to'
            'help all your needs, anytime & anywhere.Your go-to app for a hassle-free life. ',
        "icon": AppInfo.onBoard3,
      },
    ];
    return sliderList;
  }

  List<Map<String, dynamic>> sliderList = [];

  List<String> languageList = [
    'English',
    'Hindi',
    'Arabic',
    'Chinese',
    'Spanish',
    'French',
    'Japanese',
    'Romanian',
    'Turkish',
    'Italian',
    'German',
    'Bengali',
    'Vietnamese',
    'Thai',
    'Portuguese',
    'Hebrew',
    'Polish',
    'Hungarian',
    'Finland',
    'Korean',
    'Malay',
    'Indonesian',
    'Ukrainian',
    'Bosnian',
    'Greek',
    'Dutch',
    'Urdu',
    'Sinhala',
    'Persian',
    'Serbian',
    'Khmer',
    'Lao',
    'Russian',
    'Kannada',
    'Marathi',
    'Tamil',
    'Afrikaans',
    'Czech',
    'Swedish',
    'Slovak',
    'Swahili',
    'Albanian',
    'Danish',
    'Azerbaijani',
    'Kazakh',
    'Croatian',
    'Nepali',
    'Burmese'
  ];
  String isSelected = 'English';
  int selectedIndex = 0;

  List<String> baseFlagsCode = [
    'us',
    'in',
    'sa',
    'cn',
    'es',
    'fr',
    'jp',
    'ro',
    'tr',
    'it',
    'de',
    'BD',
    'VN',
    'TH',
    'PT',
    'IL',
    'PL',
    'HU',
    'FI',
    'KR',
    'MY',
    'ID',
    'UA',
    'BA',
    'GR',
    'NL',
    'Pk',
    'LK',
    'IR',
    'RS',
    'KH',
    'LA',
    'RU',
    'IN',
    'IN',
    'IN',
    'ZA',
    'CZ',
    'SE',
    'SK',
    'SK',
    'AL',
    'DK',
    'AZ',
    'KZ',
    'HR',
    'NP',
    'MM'
  ];

  //PageController pageController = PageController(initialPage: 0);

  void _showReview(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;

    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      backgroundColor: color.primaryContainer,
      builder: (BuildContext builderContext) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: DraggableScrollableSheet(
              maxChildSize: 1.0,
              expand: false,
              minChildSize: 0.2,
              initialChildSize: 0.85,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: color.primaryContainer,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Row(
                          children: [
                            Text(
                              'Choose Your App Language',
                              style: textTheme.titleMedium,
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 22,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: AppColor.kOutlineColor,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Search...',
                                      suffixIcon: Icon(
                                        FeatherIcons.search,
                                        color: AppColor.kTitleColor,
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: languageList.length,
                                  itemBuilder: (_, i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: ListTile(
                                        horizontalTitleGap: 8,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 4),
                                        visualDensity: const VisualDensity(
                                            horizontal: -4, vertical: -4),
                                        onTap: () {
                                          setState(() {
                                            isSelected = languageList[i];
                                          });
                                        },
                                        title: Row(
                                          children: [
                                            Flag.fromString(
                                              baseFlagsCode[i],
                                              height: 26,
                                              width: 40,
                                              borderRadius: 2,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(width: 20.0),
                                            Text(
                                              languageList[i],
                                              style: textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        trailing: isSelected == languageList[i]
                                            ? Icon(
                                                Icons.radio_button_checked,
                                                color: color.primary,
                                                size: 22,
                                              )
                                            : const Icon(
                                                Icons.circle_outlined,
                                                color: AppColor.kGreyTextColor,
                                                size: 22,
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: GlobalButton(
                            textTheme: textTheme,
                            buttonText: 'Continue In $isSelected',
                            onpressed: () {
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
      },
    );
  }
  final PageController _pageController = PageController();
  int _currentIndexPage = 0;

  void _nextPage() {
    if (_currentIndexPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentIndexPage++;
      });
    }
  }

  int currentIndexPage = 0;
  String buttonText = 'Next';
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    sliderList = getSliderList(context: context);
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text('App Logo'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                _showReview(context);
              },
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffB7B7B7))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.translate,
                        color: AppColor.kGreyTextColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        isSelected,
                        style: textTheme.titleSmall
                            ?.copyWith(color: AppColor.kGreyTextColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              SizedBox(
                height: MediaQuery.of(context).size.height/1.8,
                child: PageView.builder(
                  itemCount: sliderList.length,
                  controller: _pageController,
                  onPageChanged: (int index) =>
                      setState(() => currentIndexPage = index),
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        // const SizedBox(height: 30),
                        Image.asset(sliderList[index]['icon'],
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 3),
                        const SizedBox(height: 30),
                        Text(
                          sliderList[index]['title'].toString(),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          sliderList[index]['description'].toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                         maxLines: 3,
                          style: textTheme.titleMedium?.copyWith(
                              color: AppColor.kGreyTextColor, fontSize: 14),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect:
                        const JumpingDotEffect(dotHeight: 8, dotWidth: 8, spacing: 5),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  currentIndexPage < 2
                      ? GlobalButton(
                          textTheme: textTheme,
                          onpressed: _nextPage,
                          buttonText: 'Next',
                        )
                      : GlobalButton(
                          textTheme: textTheme,
                          buttonText: 'Get Started',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()));
                          }),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                      onTap: () {
                        //print('sjdnfdn');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const LoginScreen()));
                      },
                      child: SizedBox(
                          height: 40,
                          child: Text(
                            'Skip',
                            style: textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
