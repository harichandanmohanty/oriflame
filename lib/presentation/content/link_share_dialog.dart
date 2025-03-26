import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oriflame/constants.dart';
import 'package:oriflame/presentation/content/social_media_page.dart';

class LinkShareDialog extends StatefulWidget {
  const LinkShareDialog({
    super.key, required this.imagePath,
  });

  final String imagePath;

  @override
  State<LinkShareDialog> createState() => _LinkShareDialogState();
}

class _LinkShareDialogState extends State<LinkShareDialog> {
  int count = 0;
  late Timer timer;

  final List<String> completionStatusLists = ["Generating your sales link..", "Copying the caption to clipboard", "Saving the content to your profile", "Preparing the content for social media"];

  @override
  void initState() {
    Duration periodic = const Duration(milliseconds: 1000);
    timer = Timer.periodic(periodic, (intervalTime) {
      if(count < completionStatusLists.length - 1) {
        setState(() {
          count++;
        });
      } else {
        timer.cancel();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SocialMediaPage(imagePath: widget.imagePath)));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagePathConstants.oriflameLogo,
                  width: 30,
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(completionStatusLists[count], style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 10,
                    backgroundColor: const Color(0xFFEEF3F0),
                    color: const Color(0xFF9DD9BD),
                    value: 0.25 + count * 0.25,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}