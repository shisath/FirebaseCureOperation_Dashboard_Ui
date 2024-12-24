import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final Color backgroungColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.backgroungColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroungColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              12.0), // Adjust the radius for rounded corners
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
