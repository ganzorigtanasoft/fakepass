import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menulist extends StatelessWidget {
  final Widget? leadingIcon;
  final String? imagePath;
  final String text;
  final VoidCallback? onPressed;

  const Menulist({
    this.leadingIcon,
    this.imagePath,
    required this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;

    if (imagePath != null) {
      if (imagePath!.toLowerCase().endsWith('.svg')) {
        leadingWidget = SvgPicture.asset(imagePath!, height: 24, width: 24);
      } else {
        leadingWidget = Image.asset(
          imagePath!,
          height: 24,
          width: 24,
          fit: BoxFit.cover,
        );
      }
    } else if (leadingIcon != null) {
      leadingWidget = leadingIcon;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (leadingWidget != null) leadingWidget,
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6e88a6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
