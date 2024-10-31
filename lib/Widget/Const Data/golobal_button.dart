import 'package:flutter/material.dart';
import '../Theme/theme_constants.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    this.color,
    required this.textTheme,  this.buttonText, required this.onpressed, this.width, this.buttonColor, this.bordersideColor, this.borderRadius, this.height, this.textStyle, this.widget,
  });
  final double?width;
  final double?height;
  final Color?color;
  final TextTheme textTheme;
  final String ? buttonText;
  final VoidCallback onpressed;
  final Color?buttonColor;
  final Color?bordersideColor;
  final BorderRadius ? borderRadius;
  final TextStyle ? textStyle;
  final Widget ? widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColor.kMainColor,
      borderRadius: BorderRadius.circular(8),
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        height: height?? 48,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: borderRadius?? BorderRadius.circular(8),
          color: color ?? AppColor.kMainColor,
          border: Border.all(color: bordersideColor ?? Colors.transparent),
        ),
        child: widget?? Text(buttonText!,style: textStyle??textTheme.titleSmall?.copyWith(color: buttonColor??AppColor.kWhiteColor,fontSize: 16),),
      ),
    );
  }
}