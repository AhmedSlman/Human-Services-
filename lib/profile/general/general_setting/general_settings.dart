import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Widget/Theme/theme_constants.dart';
import 'language.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  bool isDark = false;

  void darkModeSwitch(bool value) {
    setState(() {
      isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        title: Text(
          'General Settings',
          style: textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: -4)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 24,
                        color: color.primary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Push Notification', style: textTheme.titleMedium),
                      const Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        child: SizedBox(
                          height: 24,
                          width: 42,
                          child: Switch(
                            value: isSwitched,
                            onChanged: toggleSwitch,
                            activeTrackColor: color.primary,
                            activeColor: AppColor.kWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Language()));
              },
              child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff848484).withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 24,
                            spreadRadius: -4)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset('images/lan.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Language', style: textTheme.titleMedium),
                        const Spacer(),
                        Text(
                          'English',
                          style: textTheme.bodySmall,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 14,
                          color: AppColor.kGreyTextColor,
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff848484).withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: -4)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset('images/dark.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Dark mode', style: textTheme.titleMedium),
                      const Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        child: SizedBox(
                          height: 24,
                          width: 42,
                          child: Switch(
                            value: isDark,
                            onChanged: darkModeSwitch,
                            activeTrackColor: color.primary,
                            activeColor: AppColor.kWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

