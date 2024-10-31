import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

import '../../../../Widget/Theme/theme_constants.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {

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
  int selectedIndex=0;

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
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('Language',style: textTheme.titleLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          //physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: languageList.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10,),
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                    color: AppColor.kWhiteColor,borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: -4
                      )
                    ]
                ),
                child: ListTile(
                  horizontalTitleGap: 8,
                  contentPadding:  const EdgeInsets.symmetric(horizontal: 8),
                  visualDensity: const VisualDensity(horizontal: 0,vertical: -4),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
