import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: color == null
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 255, 0, 242),
          fontSize: 23,
          fontWeight: FontWeight.w800,
        ),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          minimumSize: const Size(double.infinity, 50),
          primary: const Color.fromARGB(255, 4, 0, 15)),
    );
  }
}
