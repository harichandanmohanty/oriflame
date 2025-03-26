import 'package:flutter/material.dart';
import 'package:oriflame/data/model/content_model.dart';

class EditCaptionWidget extends StatefulWidget {
  const EditCaptionWidget({super.key, required this.contents, this.selectedContentIndex,});

  final Contents contents;
  final int? selectedContentIndex;

  @override
  State<EditCaptionWidget> createState() => _EditCaptionWidgetState();
}

class _EditCaptionWidgetState extends State<EditCaptionWidget> {
  bool isValueChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                            Icons.close,
                          size: 24,
                        ),
                    ),
                    const Text(
                      "Edit Caption",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: isValueChanged ? Colors.green: Colors.green[200],
                        fixedSize: const Size.fromHeight(25),
                      ),
                      onPressed: isValueChanged ? () { }: null ,
                      child: const Text('Save', style: TextStyle(color: Colors.white, fontSize: 14),),
                    )
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: widget.contents.contents[widget.selectedContentIndex!].caption,
                    maxLines: null, // Set this
                    expands: true, // and this
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (textValue) {
                        setState(() {
                          isValueChanged = widget.contents.contents[widget.selectedContentIndex!].caption != textValue;
                        });
                    },
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
