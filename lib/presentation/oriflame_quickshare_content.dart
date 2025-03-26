import 'package:flutter/material.dart';
import 'package:oriflame/constants.dart';
import 'package:oriflame/presentation/content/content_widget.dart';
import 'package:oriflame/presentation/floating_camera_button.dart';
import 'package:oriflame/presentation/top_nav_bar.dart';
import 'oriflame_app_bar.dart';

class OriFlameQuickShare extends StatefulWidget {
  const OriFlameQuickShare({super.key, required this.title});

  final String title;

  @override
  State<OriFlameQuickShare> createState() => _OriFlameQuickShareState();
}

class _OriFlameQuickShareState extends State<OriFlameQuickShare> {

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = 40;
    return Scaffold(
      appBar: const OriFlameAppBar(preferredSize: Size.fromHeight(appBarHeight),),
      body: Container(
        color: Colors.white,
        child: const Column(
          children: [
            TopNavBar(),
            ContentWidget()
          ],
        ),
      ),
      floatingActionButton: const FloatingCameraButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
