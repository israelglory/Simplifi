import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? size, letterSpacing, height;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final TextDecoration? textDecoration;
  final bool? softWrap;
  const AppText(this.text,
      {Key? key,
      this.size,
      this.softWrap,
      this.fontStyle,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow,
      this.alignment,
      this.letterSpacing,
      this.textDecoration,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        softWrap: softWrap,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: size,
          overflow: overflow,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          height: height,
        ),
        textAlign: alignment);
  }
}
