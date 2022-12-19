import 'package:simplifi/routes/exports.dart';

class AppFormTextField extends StatelessWidget {
  final String formText;
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
  const AppFormTextField(
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
      this.hintColor,
      required this.formText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(
            formText,
            size: 16,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: margin,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Center(
              child: TextFormField(
                autofillHints: autofillHints,
                focusNode: focusNode,
                autofocus: autofocus ?? false,
                maxLength: maxLength,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                validator: validator,
                textAlign: textAlign ?? TextAlign.start,
                style: TextStyle(
                    fontSize: fontSize,
                    height: textHeight,
                    color: textColor,
                    fontWeight: fontWeight),

                initialValue: initialText == null ? null : initialText!,
                onEditingComplete: onEditingComplete,
                onChanged: onChanged,
                onTap: onTap,
                showCursor: showCursor,
                obscureText: obscureText == null ? false : obscureText!,
                obscuringCharacter: obscureChar != null ? obscureChar! : '*',
                keyboardType: textInputType,
                textInputAction: textInputAction,
                // onFieldSubmitted: onSubmitted,
                maxLines: maxLines,
                textAlignVertical: textAlignVertical,
                minLines: minLines,
                buildCounter: buildCounter,
                controller: textEditingController,
                enabled: enabled ?? true,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  counter: counter,
                  alignLabelWithHint: true,
                  labelText: labelText,
                  labelStyle: labelTextStyle,
                  prefixIcon: prefixIcon,
                  errorStyle: errorStyle,
                  errorText: errorText,
                  isDense: isDense,
                  contentPadding: padding ?? const EdgeInsets.all(16.0),
                  border: InputBorder.none,
                  suffixText: suffixText,
                  suffixIconConstraints: suffixBoxConstraints,
                  suffixIcon: suffixIcon == null ? null : suffixIcon!,
                  icon: icon == null
                      ? null
                      : Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: icon,
                        ),
                  constraints: constraints,
                  focusedBorder: focusedBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius ?? 10),
                        borderSide: BorderSide(
                            color: focusBorderColor ?? AppColors.primaryColor,
                            width: focusBorderWidth ?? 1),
                      ),
                  disabledBorder: disabledBorder,
                  enabledBorder: enabledBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius ?? 10),
                        borderSide: BorderSide(
                            color: borderColor ?? AppColors.primaryColor,
                            width: borderWidth ?? 1),
                      ),
                  errorBorder: errorBorder ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius ?? 10),
                        borderSide: BorderSide(
                            color: errorBorderColor ?? Colors.red,
                            width: borderWidth ?? 1),
                      ),
                  filled: true,
                  fillColor: backgroundColor ?? AppColors.textFieldFill,
                  hintText: hintText,
                  hintStyle: TextStyle(color: hintColor ?? Colors.black45),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
