import 'dart:ui';

import 'package:flutter/material.dart';

class MyMaterialButton extends StatelessWidget {
  final Function()? onTap;
  final Color color;

  const MyMaterialButton({super.key, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 115),
      onPressed: onTap,
      color: color,
      elevation: 8,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Text("Tap Me!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
    );
  }
}
