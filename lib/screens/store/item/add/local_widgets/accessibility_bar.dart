import 'package:flutter/material.dart';
import 'package:platform_business/models/store.dart';

List<CategoryModel> categories = Categories.data;

Widget accessibilityBarWidget(BuildContext context) {
  return Container(
    width: 200,
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.all(3.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
          ),
    ),
    child: Column(
      children: [
        Row(
          children: [
            IconButton(icon: Icon(Icons.add), onPressed: () {}),
            Text("Categorias")
          ],
        ),
        categories.length > 0
            ? Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(categories[index].title),
                    );
                  },
                ),
              )
            : Container(
                child: Text("none"),
              )
      ],
    ),
  );
}
