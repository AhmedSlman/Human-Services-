import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../Widget/Theme/theme_constants.dart';


class MaanImagePickerPopup extends StatelessWidget {
  const MaanImagePickerPopup({Key? key, this.galleryImage, this.openFile, this.firstIcon, this.lastIcon, this.firstText, this.lastText}) : super(key: key);

  final Widget? firstIcon;
  final String? firstText;
  final Widget? lastIcon;
  final String? lastText;
  final VoidCallback? galleryImage;
  final VoidCallback? openFile;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme color = Theme.of(context).colorScheme;
    return Dialog(
        backgroundColor: color.primaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        insetPadding: EdgeInsets.all(24),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 30),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose you need',
                ),
                InkResponse(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      size: 24,
                    ))
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkResponse(
                  onTap: galleryImage,
                  child: Column(children: [
                    firstIcon ?? Image.asset('images/gallary.png', color: color.primary, width: 40),
                    const SizedBox(height: 6),
                    Text(firstText ?? 'Gallery', style: textTheme.titleLarge)
                  ]),
                ),
                const SizedBox(width: 55),
                InkResponse(
                  onTap: openFile,
                  child: Column(children: [
                    lastIcon ??
                        const Icon(
                          IconlyBold.document,
                          size: 40,
                          color: AppColor.kGreyTextColor,
                        ),
                    const SizedBox(height: 6),
                    Text(lastText ?? 'Open File', style: textTheme.bodyLarge?.copyWith(color: AppColor.kGreyTextColor))
                  ]),
                )
              ],
            )
          ]),
        ));
  }
}

