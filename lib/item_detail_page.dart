import 'package:flutter/material.dart';
import 'package:stylish/Widget/item_info_view.dart';
import 'package:stylish/Widget/stylish_app_bar.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({super.key});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const StylishAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    child: Image.network(
                      "https://i.imgur.com/FbQVuck.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const ItemInfoView()
                ]),
          ),
        ));
  }
}
