import 'package:flutter/material.dart';
import 'package:stylish/util/utilities.dart';

// ignore: must_be_immutable
class ItemInfoView extends StatelessWidget {
  const ItemInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Gibson SG Special"),
        const Text("This is fucking great!"),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("\$30,000"),
        ),
        Row(
          children: [const Text("Color: "), ColorOptionsButton()],
        ),
        Row(
          children: [const Text("Size: "), SizeOptionsButton()],
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class ColorOptionsButton extends StatefulWidget {
  ColorOptionsButton({super.key});

  final List<Color> colors = [Colors.black, Colors.blue, Colors.green];
  late Color currentColor = colors.first;

  @override
  State<ColorOptionsButton> createState() => _ColorOptionsButtonState();
}

class _ColorOptionsButtonState extends State<ColorOptionsButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (Color color in widget.colors) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: darken(darken(color)),
                    width: widget.currentColor == color ? 2.0 : 0.0),
                color: color,
              ),
              width: 20,
              height: 20,
              child: InkWell(onTap: () {
                setState(() {
                  widget.currentColor = color;
                });
              }),
            ),
          )
        ]
      ],
    );
  }
}

// ignore: must_be_immutable
class SizeOptionsButton extends StatefulWidget {
  SizeOptionsButton({super.key});

  final List<String> sizes = ["S", "M", "L", "XL"];
  late String currentSize = sizes.first;

  @override
  State<SizeOptionsButton> createState() => _SizeOptionsButtonState();
}

final ButtonStyle raisedButtonUnselectedStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Colors.grey[300],
  minimumSize: const Size(60, 30),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
  ),
);

final ButtonStyle raisedButtonSelectedStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: const Color.fromARGB(255, 0, 181, 187),
  minimumSize: const Size(60, 30),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
  ),
);

class _SizeOptionsButtonState extends State<SizeOptionsButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (String size in widget.sizes) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: widget.currentSize == size ? raisedButtonSelectedStyle : raisedButtonUnselectedStyle,
              child: Text(size),
              onPressed: () {
                setState(() {
                  widget.currentSize = size;
                });
              },
            ),
          )
        ]
      ],
    );
  }
}
