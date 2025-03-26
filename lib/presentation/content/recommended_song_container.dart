import 'package:flutter/material.dart';
import 'package:oriflame/data/model/content_model.dart';

class RecommendedSongContainer extends StatelessWidget {
  const RecommendedSongContainer({
    super.key,
    required this.contents,
    required this.selectedContentIndex,
  });

  final Contents contents;
  final int? selectedContentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.black26),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Icon(
            Icons.music_note,
            color: Colors.white,
          ),
          Text(
            "Recommended: ${contents.contents[selectedContentIndex!].song} by ${contents.contents[selectedContentIndex!].artist}",
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}