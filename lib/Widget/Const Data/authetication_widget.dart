import 'package:flutter/material.dart';

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({
    super.key,
    required this.color,
    required this.textTheme, required this.title, required this.bodyTitle, required this.bodyDescription, required this.widget,
  });

  final ColorScheme color;
  final TextTheme textTheme;
  final String title;
  final String bodyTitle;
  final String bodyDescription;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.primaryContainer,
      appBar: AppBar(
        title:  Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bodyTitle,style: textTheme.headlineMedium,),
            const SizedBox(height: 10,),
            Text(bodyDescription,style: textTheme.bodySmall,),
            const SizedBox(height: 20,),
            widget
          ],
        ),
      ),
    );
  }
}