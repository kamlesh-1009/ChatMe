// ignore_for_file: library_private_types_in_public_api

import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/constant/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'validator.dart';

Widget searchTextFormField(BuildContext context,
    {String? hintText, void Function(String?)? onChanged}) {
  return textFormField(
    maxLines: 1,
    hintText: "Search ...",
    border: const BorderSide(
      color: appPrimaryColor,
    ),
    onChanged: onChanged,
    suffixIcon: Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: appPrimaryColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Icon(
        Icons.search,
        color: appWhiteColor,
      ),
    ),
    borderRaduis: 5,
  );
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.style,
    this.prefixIcon,
    required this.controller,
    this.borderColor,
    this.textInputAction,
    this.keyboardType,
    this.textStyle,
    this.filledColor,
    this.enabled,
    this.focusNode,
    this.validator,
  }) : super(key: key);
  final Key? fieldKey;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? textStyle;

  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final TextInputType? keyboardType;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return textFormField(
        fieldKey: fieldKey,
        hintText: hintText,

        // hintStyle: style ??
        //     AppTextStyle.normalSemiBold15.copyWith(color: primaryButtonColor),
        // prefixIcon: UiInterface.prefixTextFieldIcon(AppAsset.icEnvelop),
        enabled: enabled,
        focusNode: focusNode,
        controller: controller,
        // textStyle: textStyle ??
        //     AppTextStyle.normalSemiBold15.copyWith(color: primaryButtonColor),
        textInputAction: textInputAction,
        keyboardType: TextInputType.emailAddress,
        borderColor: borderColor,
        filledColor: filledColor,
        validator: validator ??
            (value) => Validators.validateEmail(
                  value!.trim(),
                ));
  }
}

class PasswordWidget extends StatefulWidget {
  final Key? fieldKey;
  final int? maxLength;
  final String? hintText;

  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const PasswordWidget({
    Key? key,
    required this.controller,
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.validator,
    this.focusNode,
    this.textInputAction,
  }) : super(key: key);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return textFormField(
        fieldKey: widget.fieldKey,
        hintText: widget.hintText,
        obscureText: _obscureText,
        focusNode: widget.focusNode,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        maxLines: 1,
        // prefixIcon: UiInterface.prefixTextFieldIcon(AppAsset.icLock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: appWhiteColor,
          ),
        ),
        validator: widget.validator ??
            (value) => Validators.validateRequired(value!.trim(), 'Password')
        // (value) => Validators.validatePassword(value!.trim()),
        );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.maxLength,
    this.focusNode,
    this.autofocus,
    this.style,
    this.textInputAction,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.textStyle,
    this.keyboardType,
    this.borderColor,
    this.fillColor,
    this.enabled,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final List<TextInputFormatter?>? inputFormatters;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? style;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      fieldKey: fieldKey,
      hintText: hintText,
      focusNode: focusNode,
      enabled: enabled,
      borderRaduis: 10,
      hintStyle: style ??
          AppTextStyle.normalRegularBold12.copyWith(color: appPrimaryColor),
      textStyle: textStyle ?? AppTextStyle.normalRegularBold12,
      controller: controller,
      style: style,
      prefixIcon: prefixIcon,
      filledColor: fillColor,
      validator: validator,
      textAlign: textAlign,
      maxLength: maxLength,
      borderColor: borderColor,
      textInputAction: textInputAction,
      // inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]'))],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
      this.fieldKey,
      this.hintText,
      this.textStyle,
      this.hintStyle,
      this.validator,
      this.prefixIcon,
      required this.controller,
      this.focusNode,
      this.maxLines,
      this.maxLength,
      this.suffixIcon,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.textInputAction,
      this.keyboardType,
      this.borderColor,
      this.filledColor,
      this.enabled,
      this.readonly,
      this.textAlign = TextAlign.left,
      this.contentPadding,
      this.border})
      : super(key: key);

  final Key? fieldKey;
  final bool? readonly;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool? enabled;
  final EdgeInsetsGeometry? contentPadding;
  final BorderSide? border;
  @override
  Widget build(BuildContext context) {
    return textFormField(
        fieldKey: fieldKey,
        focusNode: focusNode,
        hintText: hintText,
        controller: controller,
        borderRaduis: 10,
        keyboardType: keyboardType ?? TextInputType.text,
        validator: validator,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        maxLength: maxLength,
        maxLines: maxLines,
        enabled: enabled ?? true,
        textInputAction: textInputAction,
        textAlign: textAlign,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(20, 15, 10, 15),
        textStyle: textStyle,
        hintStyle: hintStyle ??
            AppTextStyle.normalRegularBold12.copyWith(color: appPrimaryColor),
        borderColor: borderColor,
        filledColor: filledColor,
        border: border);
  }
}

class OutlineTextFormFieldWidget extends StatelessWidget {
  const OutlineTextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.enabled,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      focusNode: focusNode,
      enabled: enabled,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      textStyle: textStyle,
      hintStyle: hintStyle,
    );
  }
}

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.validator,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.filledColor,
    this.hintStyle,
    this.enabled,
  }) : super(key: key);

  final Key? fieldKey;
  final bool? enabled;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return textFormField(
        keyboardType: TextInputType.text,
        focusNode: focusNode,
        enabled: enabled,
        fieldKey: fieldKey,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        hintText: hintText,
        hintStyle: AppTextStyle.normalSemiBold15,
        textStyle: AppTextStyle.normalSemiBold15,
        filledColor: appBlackColor,
        borderColor: Colors.transparent);
  }
}

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onFieldSubmit;
  final Function(String?)? onFieldChange;
  final Function()? onSubmit;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  TextEditingController? controller;

  SearchBar({
    Key? key,
    this.hintText,
    this.onFieldSubmit,
    this.onSubmit,
    this.onFieldChange,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      onFieldSubmitted: onFieldSubmit,
      hintText: hintText ?? "Find restaurant or coffeeshop",
      hintStyle: AppTextStyle.regularBold15,

      prefixIcon: prefixIcon ??
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: appWhiteColor,
            ),
            splashRadius: 5,
            onPressed: onSubmit,
          ),
      onChanged: onFieldChange,
      borderColor: Colors.transparent,
      filledColor: appBlackColor,

      // suffixIcon: IconButton(
      //   icon: Icon(
      //     suffixIcon ?? Icons.arrow_forward,
      //     color: hintGrey,
      //   ),
      //   onPressed: onSubmit,
      // ),
    );
  }
}

Widget textFormField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final double? borderRaduis = 3,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Color? borderColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final Widget? suffix,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
  final BorderSide? border,
  final Color? errorColor,
  final EdgeInsetsGeometry? contentPadding,
  final bool? readonly,
}) {
  return TextFormField(
    key: fieldKey,
    readOnly: readonly ?? false,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: appPrimaryColor,
    cursorHeight: 25,
    style: textStyle ??
        AppTextStyle.normalRegularBold15
            .copyWith(color: appBlackColor, fontSize: 17),
    textAlignVertical: TextAlignVertical.center,
    decoration: InputDecoration(
      counterStyle:
          AppTextStyle.normalRegularBold15.copyWith(color: appPrimaryColor),
      errorStyle: AppTextStyle.normalRegularBold15
          .copyWith(color: errorColor ?? borderColors, fontSize: 14),
      prefixIcon: prefixIcon,
      isDense: true,
      contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(15, 11, 0, 5),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRaduis ?? 3),
        borderSide: border ?? BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRaduis ?? 3),
        borderSide: border ?? BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRaduis ?? 3),
        borderSide: border ?? BorderSide.none,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRaduis ?? 3),
        borderSide: border ?? BorderSide.none,
      ),
      errorMaxLines: 5,
      fillColor: filledColor ?? appWhiteColor,
      filled: true,
      hintStyle: hintStyle ??
          AppTextStyle.normalRegularBold15
              .copyWith(color: appPrimaryColor.withOpacity(0.6), fontSize: 17),
      hintText: hintText,
      enabled: enabled ?? true,
      suffixIcon: suffixIcon,
      suffix: suffix,
      labelText: labelText,
      helperText: helperText,
    ),
  );
}

TextFormField outlineTextField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
}) {
  return TextFormField(
    key: fieldKey,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: appPrimaryColor,
    cursorHeight: 20,
    style: textStyle ?? AppTextStyle.normalRegularBold12,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: outlineBorderDecoration,
      enabledBorder: outlineBorderDecoration,
      focusedBorder: outlineBorderDecoration,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.zero,
      ),
      hintText: hintText,
      hintStyle: hintStyle ?? AppTextStyle.normalRegularBold12,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
    ),
  );
}

OutlineInputBorder outlineBorderDecoration = const OutlineInputBorder(
  borderSide: BorderSide(color: appPrimaryColor, width: 1.2),
  borderRadius: BorderRadius.zero,
);
