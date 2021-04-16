import 'package:flutter/material.dart';

Widget addPhotoWidget(BuildContext context) {
  return Container(
      width: 80,
      height: 100,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Center(
        child: Icon(
          Icons.add,
        ),
      ));
}

Widget photoWidget(BuildContext context) {
  return Container(
      width: 80,
      height: 100,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Center(
        child: Icon(
          Icons.photo,
        ),
      ));
}
