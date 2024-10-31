import 'package:flutter/material.dart';

import '../../Widget/Theme/theme_constants.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        surfaceTintColor: color.surface,
        elevation: 0.0,
        title: Text('About us',style: textTheme.titleLarge,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Disclosures of Your Information',style: textTheme.titleLarge,overflow:TextOverflow.ellipsis,),
              const SizedBox(
                height: 10,
              ),
              Text('Food First envisions a world in which all people have access to healthy, ecologically produced, and culturally appropriate food. After 40 years of analysis of the global food system,'
                  ' we know that making this vision a reality involves more than tech nical solutions—it requires political',maxLines: 10,
                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor,overflow: TextOverflow.ellipsis),),
              const SizedBox(
                height: 20,
              ),
              Text('Legal Disclaimer',style: textTheme.titleLarge,overflow:TextOverflow.ellipsis),
              const SizedBox(
                height: 10,
              ),
              Text('Food First envisions a world in which all people have access to healthy, ecologically produced, and culturally appropriate food. After 40 years of analysis of the global food system,'
                  ' we know that making this vision a reality involves more than tech nic al solutions—it requires political Food First envisions a world in which all people have access to healthy,'
                  ' ecologically produced, and culturally appropriate food. After 40 years of analysis of the global food system, we know that making this vision a reality involves more than tech nical ',
                maxLines: 15,
                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: AppColor.kGreyTextColor,overflow:TextOverflow.ellipsis),),
            ],
          ),
        ),
      ),
    );
  }
}
