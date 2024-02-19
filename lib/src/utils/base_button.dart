import "package:flutter/material.dart";

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor = Colors.transparent,
    this.textColor,
    this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.borderRadius = 10,
    required this.onPressed,
    this.onLongPress,
    this.focusNode,
    this.borderColor,
    this.borderWidth = 1,
    this.elevation = 0,
    this.shape,
    this.style,
    this.isOutline = false,
    this.paddings,
  });
  final Color? backgroundColor;
  final Color foregroundColor;
  final Color? textColor;
  final String? text;
  final TextStyle? style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double borderRadius;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final Color? borderColor;
  final double borderWidth;
  final double elevation;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  final EdgeInsets? paddings;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        try {
          onPressed();
        } catch (e) {
          debugPrint("ButtonPressedError: $e");
        }
      },
      onLongPress: onLongPress,
      focusNode: focusNode,
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((Set<MaterialState> states) => elevation),
        backgroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) =>
              isOutline == true ? const Color(0xff8c1916).withOpacity(0) : backgroundColor ?? const Color(0xff8c1916),
        ),
        foregroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => foregroundColor),
        shape: shape ??
            MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) => RoundedRectangleBorder(
                side: BorderSide(
                  color: borderColor ?? const Color(0xff8c1916),
                  width: borderWidth,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
        padding: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) => paddings ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
      ),
      child: Text(
        text ?? "",
        style: style ??
            TextStyle(
              color: isOutline == true ? textColor ?? const Color(0xff8c1916) : textColor ?? Colors.white,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
      ),
    );
  }
}
