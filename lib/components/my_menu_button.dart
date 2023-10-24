import 'package:flutter/material.dart';

class MyMenuButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const MyMenuButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * 0.7,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
