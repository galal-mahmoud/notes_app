import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title, required this.icon, this.onPressed,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(title, style: const TextStyle(
          fontSize: 32,
        )),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withValues(alpha: 0.1),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: 32,),
          ),
        ),
      ],
    );
  }
}
