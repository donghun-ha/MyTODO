import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/constants/theme.dart';

class MyButton extends StatelessWidget {
  final String lable;
  final Function()? onTap;
  const MyButton({super.key, required this.lable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryClr,
        ),
        child: Center(
          child: Text(
            lable,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
