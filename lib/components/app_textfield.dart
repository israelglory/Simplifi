// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final String? title, hintText, initialText, labelText;
  final TextInputType? textInputType;
  final Widget? icon, suffixIcon, prefixIcon;
  final bool? obscureText, enabled, autofocus, showCursor, isDense;
  final String? obscureChar, suffixText, errorText;
  final TextEditingController? textEditingController;
  final Function()? onTap;
  final double? fontSize,
      borderWidth,
      focusBorderWidth,
      borderRadius,
      textHeight;
  final int? maxLines, minLines, maxLength;
  final EdgeInsets? margin;
  final Iterable<String>? autofillHints;
  final EdgeInsets? padding;
  final Function(String)? onChanged, onSubmitted;
  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final TextStyle? errorStyle, labelTextStyle;
  final TextAlign? textAlign;
  final BoxConstraints? suffixBoxConstraints, prefixBoxConstraints, constraints;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final FontWeight? fontWeight;
  final OutlineInputBorder? disabledBorder,
      enabledBorder,
      focusedBorder,
      errorBorder;
  final Color? borderColor,
      focusBorderColor,
      backgroundColor,
      errorBorderColor,
      textColor,
      containerColor,
      hintColor;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization? textCapitalization;
  final Widget? counter;
  final Widget? Function(BuildContext context,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  const AppTextField(
      {Key? key,
      this.title,
      this.hintText,
      this.textInputType,
      this.icon,
      this.suffixIcon,
      this.obscureText,
      this.obscureChar,
      this.onTap,
      this.fontSize,
      this.maxLines,
      this.minLines,
      this.margin,
      this.padding,
      this.onChanged,
      this.onEditingComplete,
      this.counter,
      this.suffixText,
      this.validator,
      this.initialText,
      this.textEditingController,
      this.enabled,
      this.suffixBoxConstraints,
      this.prefixBoxConstraints,
      this.errorText,
      this.errorStyle,
      this.maxLength,
      this.inputFormatters,
      this.autofocus,
      this.textAlign,
      this.focusNode,
      this.showCursor,
      this.borderWidth,
      this.autofillHints,
      this.prefixIcon,
      this.borderColor,
      this.borderRadius,
      this.backgroundColor,
      this.focusBorderColor,
      this.focusBorderWidth,
      this.textHeight,
      this.errorBorderColor,
      this.textInputAction,
      this.onSubmitted,
      this.disabledBorder,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.labelText,
      this.labelTextStyle,
      this.textAlignVertical,
      this.constraints,
      this.textColor,
      this.fontWeight,
      this.buildCounter,
      this.textCapitalization,
      this.isDense,
      this.containerColor,
      this.hintColor})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: widget.margin,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Center(
        child: TextFormField(
          autofillHints: widget.autofillHints,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus ?? false,
          maxLength: widget.maxLength,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          validator: widget.validator,
          textAlign: widget.textAlign ?? TextAlign.start,
          style: TextStyle(
              fontSize: widget.fontSize,
              height: widget.textHeight,
              color: widget.textColor,
              fontWeight: widget.fontWeight),

          initialValue: widget.initialText == null ? null : widget.initialText!,
          onEditingComplete: widget.onEditingComplete,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          showCursor: widget.showCursor,
          obscureText: widget.obscureText == null ? false : widget.obscureText!,
          obscuringCharacter:
              widget.obscureChar != null ? widget.obscureChar! : '*',
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          // onFieldSubmitted: widget.onSubmitted,
          maxLines: widget.maxLines,
          textAlignVertical: widget.textAlignVertical,
          minLines: widget.minLines,
          buildCounter: widget.buildCounter,
          controller: widget.textEditingController,
          enabled: widget.enabled ?? true,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            counter: widget.counter,
            alignLabelWithHint: true,
            labelText: widget.labelText,
            labelStyle: widget.labelTextStyle,
            prefixIcon: widget.prefixIcon,
            errorStyle: widget.errorStyle,
            errorText: widget.errorText,
            isDense: widget.isDense,
            contentPadding: widget.padding,
            border: InputBorder.none,
            suffixText: widget.suffixText,
            suffixIconConstraints: widget.suffixBoxConstraints,
            suffixIcon: widget.suffixIcon == null ? null : widget.suffixIcon!,
            icon: widget.icon == null
                ? null
                : Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: widget.icon),
            constraints: widget.constraints,
            filled: false,
            fillColor: widget.backgroundColor ?? Colors.white,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: widget.hintColor ?? Colors.black45),
          ),
        ),
      ),
    );
  }
}
