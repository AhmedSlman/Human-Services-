import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor{
  static const kMainColor = Color(0xff6850F3);
  static const kTitleColor=Color(0xff181A1E);
  static const kGreyTextColor = Color(0xff6F6F6F);
  static const kNeaturalColor = Color(0xff4D4D4D);
  static const kLightNeaturalColor = Color(0xffB7B7B7);
  static const kRatingColor = Color(0xffFFC02F);
  static const kWhiteColor = Color(0xffFFFFFF);
  static const kOutlineColor=Color(0xffD0D0D0);
  static const kBorderColor=Color(0xffE9E9E9);
  static const kMainColorOpacity=Color(0xffFFEEE6);
  static const kBackgroundColor=Color(0xffFAF8F8);
  static const kGreenColor=Color(0xff16A34A);
  static const shadowColor= Color(0xff000000);
  static const descriptionMainColor=Color(0xffFFF1EB);
  static const chatFiledColor=Color(0xffEAEAEA);
  static  Color kFilterColor=Color(0xf828282).withOpacity(0.3);
}

LinearGradient kPrimaryGradiant = const LinearGradient(colors: [
  Color(0xffFF9D64),
  Color(0xffF25900)
]);

// Define your TextStyle
TextStyle mTextStyle = TextTheme(
  titleMedium: GoogleFonts.inter(
    color: AppColor.kGreyTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  ),
).titleMedium!;
TextStyle bTextStyle = TextTheme(
  titleLarge: GoogleFonts.inter(
    color: AppColor.kTitleColor,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  ),
).titleLarge!;

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.inter(color: AppColor.kTitleColor, fontWeight: FontWeight.w600, fontSize: 24.0),
    headlineMedium: GoogleFonts.inter(color: AppColor.kTitleColor, fontWeight: FontWeight.w600, fontSize: 20.0),
    titleLarge: GoogleFonts.inter(color: AppColor.kTitleColor, fontWeight: FontWeight.w600, fontSize: 18.0),
    titleMedium: GoogleFonts.inter(color: AppColor.kTitleColor, fontWeight: FontWeight.w500, fontSize: 16.0),
    titleSmall: GoogleFonts.inter(color: AppColor.kTitleColor, fontWeight: FontWeight.w600, fontSize: 14.0),
    bodyLarge: GoogleFonts.inter(color:  AppColor.kTitleColor,fontSize: 16),
    bodyMedium: GoogleFonts.inter(color: AppColor.kTitleColor, fontSize: 14),
    bodySmall: GoogleFonts.inter(color: AppColor.kGreyTextColor,fontSize: 14),
  ),
  brightness: Brightness.light,
  primaryColor: AppColor.kMainColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.kMainColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(AppColor.kMainColor),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
    hoverColor:Colors.grey.shade50,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.only(left: 16, right: 16),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: AppColor.kOutlineColor, width: 1),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: AppColor.kMainColor, width: 1),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Color(0xff6850F3), width: 1),
    ),
    labelStyle: const TextStyle(
        fontSize: 14,
        color: AppColor.kTitleColor,
        fontWeight: FontWeight.w500
    ),
    hintStyle: const TextStyle(color: Color(0xffB7B7B7), fontSize: 16,fontWeight: FontWeight.w500),
  ),

  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.light,
    primary: const Color(0xff6850F3),
    secondary: const Color(0xffFF3030),
    onPrimary: AppColor.kMainColorOpacity,
    primaryContainer: AppColor.kWhiteColor,
    secondaryContainer: const Color(0xffEAF7FE),
    tertiary: const Color(0xffbf4a50),
    error: const Color(0xffFF3030),
    errorContainer: const Color(0xfffcd8df),
    surface: AppColor.kBackgroundColor,
    onSurface: const Color(0xff090909),
    outline: AppColor.kOutlineColor,
    shadow: const Color(0xff000000),
  ),
);

// String currency = localCurrency;

String currencySign ='\$';
bool privacy = false;
bool _isDialogOpen = false;



List<String> items = [
  '\$ (US Dollar)',
  "₹ (Rupee)",
  "€ (Euro)",
  "₽ (Ruble)",
  "£ (UK Pound)",
  '৳ (Taka)',
  "Tsh (TZ Shillings)",
  "R (Rial)",
];

// DateFormat dateTypeFormat = DateFormat.yMMMd();
// DateFormat timeFormat = DateFormat.jm();
// DateTime now = DateTime.now();

