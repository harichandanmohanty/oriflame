import 'package:flutter/material.dart';

class OriFlameAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OriFlameAppBar({
    super.key,
    required this.preferredSize,
  });

  @override
  final Size preferredSize;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: SizedBox(
        width: 140,
        child: Column(
          children: [
            const Text(
              "ORIFLAME",
              style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: double.infinity,
                      color: Colors.black,
                    )),
                const Text(
                  "SWEDEN",
                  style: TextStyle(
                      fontSize: 8,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: double.infinity,
                      color: Colors.black,
                    )),
              ],
            )
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}