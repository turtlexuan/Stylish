import 'package:flutter/material.dart';
import 'package:stylish/model/item.dart';
import '../model/category_item.dart';

// ignore: must_be_immutable
class CategoryListView extends StatefulWidget {
  CategoryListView({super.key, required this.category, required this.onTap});

  CategoryItem category;
  Function(Item) onTap;

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.category.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                margin: const EdgeInsets.all(10),
                height: 120,
                child: Row(children: [
                  SizedBox(
                      width: 100,
                      height: 120,
                      child: Image.network(
                        widget.category.items[index].imageUrl,
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.category.items[index].name),
                        Text("Age: ${widget.category.items[index].age}"),
                      ],
                    ),
                  )
                ]),
              ),
              onTap: () => widget.onTap(widget.category.items[index]),
            );
          }),
    );
  }
}
