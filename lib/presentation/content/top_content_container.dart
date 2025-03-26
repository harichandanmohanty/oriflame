import 'package:flutter/material.dart';
import 'package:oriflame/constants.dart';
import 'package:oriflame/data/model/content_model.dart';

class TopContentSection extends StatelessWidget {
  const TopContentSection({
    super.key,
    required this.selectedContentIndex,
    required this.contents,
  });

  final int? selectedContentIndex;
  final Contents contents;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 44,
          width: 44,
          child: CircleAvatar(
            foregroundImage: AssetImage(ImagePathConstants.profilePic),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                                ImagePathConstants.brandieGradientImg),
                            fit: BoxFit.fill,
                          )),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          Image.asset(
                            ImagePathConstants.brandieAiImg,
                            width: 12,
                            height: 12,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Ready to share",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black26),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      child: Text(
                        "${selectedContentIndex! + 1} of ${contents.contents.length}",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "High-converting in Oriflame Community",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}