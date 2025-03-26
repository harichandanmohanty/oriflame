import 'package:flutter/material.dart';
import 'package:oriflame/constants.dart';
import 'package:oriflame/presentation/content/link_share_dialog.dart';

class ContentSharingOptions extends StatelessWidget {
  const ContentSharingOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          const Text(
            "Quick share to:",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                ShareOptionButton(imagePath: ImagePathConstants.facebook,),
                ShareOptionButton(imagePath: ImagePathConstants.instagram),
                ShareOptionButton(imagePath: ImagePathConstants.tiktok),
                ShareOptionButton(imagePath: ImagePathConstants.whatsapp),
                ShareOptionButton(imagePath: ImagePathConstants.whatsappBusiness),
                ShareOptionButton(imagePath: ImagePathConstants.telegram),
                ShareOptionButton(imagePath: ImagePathConstants.mail),
                ShareOptionButton(imagePath: ImagePathConstants.oriflameLogo),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShareOptionButton extends StatelessWidget {
  const ShareOptionButton({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  onPressedShare(BuildContext context, String imgPath) {
    showDialog(
        useSafeArea: true,
        context: context,
        builder: (context) {
          return LinkShareDialog(imagePath: imgPath,);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressedShare(context, imagePath),
        icon: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: const Color(0x40FEFEFE)),
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            imagePath,
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
        ));
  }
}