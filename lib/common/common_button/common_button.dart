import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/constant/app_style.dart';
import 'package:flutter/material.dart';

GestureDetector commonButton(
    {Color? color,
    Color? textColor,
    ShapeBorder? shape,
    bool? boxShadow = true,
    TextStyle? style,
    double? heigh,
    double? borderRadius,
    void Function()? onPressed,
    required String title}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 2),
        boxShadow: boxShadow == true
            ? [
                if (onPressed != null)
                  BoxShadow(
                    color: appBlackColor.withOpacity(0.4),
                    spreadRadius: -2,
                    blurRadius: 8,
                    offset: const Offset(1, 3),
                  )
              ]
            : [],
        color: onPressed == null
            ? (color ?? appWhiteColor).withOpacity(0.5)
            : color ?? appWhiteColor,
        border: Border.all(
            color: onPressed == null
                ? appPrimaryColor.withOpacity(0.5)
                : appPrimaryColor,
            width: 1.2),
      ),

      height: heigh ?? 40,
      constraints: const BoxConstraints(
        minWidth: 200,
      ),
      // alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: style?.copyWith(
                    color: onPressed == null
                        ? appPrimaryColor.withOpacity(0.5)
                        : null) ??
                AppTextStyle.normalRegularBold20.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: onPressed == null
                        ? textColor ?? appPrimaryColor.withOpacity(0.5)
                        : textColor ?? appPrimaryColor),
          ),
        ],
      ),
    ),
  );
}

Widget commonOutlineButton(
    {void Function()? onTap,
    required String title,
    bool? boxShadow = false,
    Color? color,
    bool? isBorder = true,
    double? width,
    double? height,
    Color? borderColor,
    TextStyle? style,
    Color? textColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: height ?? 40,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        boxShadow: boxShadow == true
            ? [
                BoxShadow(
                  color: appBlackColor.withOpacity(0.5),
                  // spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(1, 3),
                )
              ]
            : [],
        borderRadius: BorderRadius.circular(50),
        color: color ?? appWhiteColor,
        border: isBorder == true
            ? Border.all(color: borderColor ?? appPrimaryColor)
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: style ??
            AppTextStyle.normalRegularBold12
                .copyWith(color: textColor ?? appPrimaryColor, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
