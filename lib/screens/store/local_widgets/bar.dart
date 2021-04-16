import 'package:flutter/material.dart';
import 'package:platform_business/screens/store/item/add/add.dart';
import 'package:platform_business/screens/store/store.dart';

Widget barStoreWidget(BuildContext context) {
  return AppBar(
      title: new Text('Lista de productos'),
      leading: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: StoreSearch());
          },
        ),
        IconButton(
          icon: const Icon(Icons.filter_list_rounded),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ]);
}
