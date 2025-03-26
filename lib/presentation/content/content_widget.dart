import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:oriflame/data/model/content_model.dart';
import 'package:oriflame/data/repository/content_repository.dart';
import 'package:oriflame/presentation/content/caption_container.dart';
import 'package:oriflame/presentation/content/content_sharing_options.dart';
import 'package:oriflame/presentation/content/recommended_song_container.dart';
import 'package:oriflame/presentation/content/toggle_icon_buttons.dart';
import 'package:oriflame/presentation/content/top_content_container.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({
    super.key,
  });

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  final ContentRepository contentRepository = const ContentRepository();
  late final Contents contents;
  int? selectedContentIndex;

  @override
  void initState() {
    contents = contentRepository.fetchQuickShareContents();
    selectedContentIndex = contents.contents.isNotEmpty
        ? contents.contents.first.contentIndex
        : null;
    super.initState();
  }

  updateSelectedContent({required bool isSwipeDown}) {
    setState(() {
      if (isSwipeDown) {
        if (selectedContentIndex! > 0) {
          selectedContentIndex = selectedContentIndex! - 1;
        }
      } else {
        if (selectedContentIndex! < contents.contents.length - 1) {
          selectedContentIndex = selectedContentIndex! + 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return selectedContentIndex != null
        ? Expanded(
            child: SwipeDetector(
              onSwipeUp: (offset) => updateSelectedContent(isSwipeDown: false),
              onSwipeDown: (offset) => updateSelectedContent(isSwipeDown: true),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      contents.contents[selectedContentIndex!].imagePath),
                  fit: BoxFit.fill,
                )),
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopContentSection(
                              selectedContentIndex: selectedContentIndex,
                              contents: contents),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RecommendedSongContainer(
                                contents: contents,
                                selectedContentIndex: selectedContentIndex,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CaptionContainer(
                                contents: contents,
                                selectedContentIndex: selectedContentIndex,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const ContentSharingOptions()
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: ToggleIconButtons(
                            contents: contents,
                            selectedContentIndex: selectedContentIndex),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
