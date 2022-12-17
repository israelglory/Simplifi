import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final EdgeInsets? padding, margin;
  final Function()? onPressed;
  final Widget? child;
  final bool? flex;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? color, hoverColor, disableTextColor, disableColor, borderColor;
  final double? elevation, disableElevation, radius, borderWidth, height, width;
  final BorderStyle? borderStyle;

  /// This is an App Button
  const AppButton(
      {Key? key,
      this.onPressed,
      this.child,
      this.color,
      this.elevation,
      this.hoverColor,
      this.disableTextColor,
      this.disableColor,
      this.disableElevation,
      this.radius,
      this.padding,
      this.margin,
      this.flex,
      this.mainAxisAlignment,
      this.borderColor,
      this.borderWidth,
      this.borderStyle,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
            side: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    width: borderWidth ?? 0,
                    color: borderColor ?? Colors.black,
                    style: borderStyle ?? BorderStyle.solid),
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
          color: color,
          elevation: elevation,
          minWidth: 0,
          height: height,
          hoverColor: hoverColor,
          disabledColor: disableColor,
          disabledTextColor: disableTextColor,
          disabledElevation: disableElevation,
          padding: padding ?? const EdgeInsets.all(0),
          onPressed: onPressed,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: child),
    );
  }
}
