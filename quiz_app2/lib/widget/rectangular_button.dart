import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Card(
          shadowColor: Colors.white,
          elevation: 7,
          margin: EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: onPressed != null
              ? Colors.green
              : const Color.fromARGB(47, 0, 0, 0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
