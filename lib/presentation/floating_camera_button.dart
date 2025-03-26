import 'package:flutter/material.dart';

class FloatingCameraButton extends StatelessWidget {
  const FloatingCameraButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.camera_alt),
      color: Colors.white,
      iconSize: 20,
      style: ButtonStyle(
        backgroundColor:
        WidgetStateProperty.resolveWith((state) => Colors.green[100]),
      ),
    );
  }
}