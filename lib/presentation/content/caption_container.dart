import 'package:flutter/material.dart';
import 'package:oriflame/data/model/content_model.dart';
import 'package:oriflame/presentation/edit_caption_widget.dart';

class CaptionContainer extends StatelessWidget {
  const CaptionContainer({
    super.key,
    required this.contents,
    required this.selectedContentIndex,
  });

  final Contents contents;
  final int? selectedContentIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => EditCaptionWidget(
              contents: contents,
              selectedContentIndex: selectedContentIndex,
            ),
          ),
        );
      },
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.black26),
          padding: const EdgeInsets.all(8),
          child: Text(
            contents.contents[selectedContentIndex!].caption,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
          )),
    );
  }
}
