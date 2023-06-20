import 'package:flutter/material.dart';

class CustomLabelDetailPages extends StatelessWidget {
  final String title;
  final String text;
  final double spaceBetweenFields;

  const CustomLabelDetailPages({
    Key? key,
    this.title = '',
    this.text = '',
    this.spaceBetweenFields = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.isNotEmpty
            ? Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            : SizedBox.shrink(),
        text.isNotEmpty
            ? Text(
                text,
                maxLines: 5,
                overflow: TextOverflow.clip,
              )
            : SizedBox.shrink(),
        SizedBox(
          height: spaceBetweenFields,
        ),
      ],
    );
  }
}
