import 'package:flutter/material.dart';

class IconButtonModel extends StatelessWidget {
  final VoidCallback onDelete;
  final String Tooltip;
  final IconData icon;
  final Color iconColor;

  const IconButtonModel({
    super.key,
    required this.onDelete,
    required this.Tooltip,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: iconColor,
      ),
      onPressed: onDelete,
      tooltip: Tooltip,
    );
  }
}
