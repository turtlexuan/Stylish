import 'package:flutter/material.dart';

import '../model/highlight_item.dart';

class HighlightView extends StatelessWidget {
  HighlightView({super.key, required this.highlightItems});

  List<HighlihgtItem> highlightItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: highlightItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  highlightItems[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
