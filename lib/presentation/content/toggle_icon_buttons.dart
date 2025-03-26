import 'package:flutter/material.dart';
import 'package:oriflame/data/model/content_model.dart';

class ToggleIconButtons extends StatelessWidget {
  const ToggleIconButtons({
    super.key,
    required this.contents,
    required this.selectedContentIndex,
  });

  final Contents contents;
  final int? selectedContentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Row(
        children: [
          const Spacer(),
          Container(
            width: 22,
            height: 58,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black26),
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: contents.contents
                  .map(
                    (content) => Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: content.contentIndex == selectedContentIndex
                              ? Colors.green[100]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
