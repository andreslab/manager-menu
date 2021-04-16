import 'package:flutter/material.dart';
import 'package:platform_business/models/store.dart';
import 'package:platform_business/screens/store/item/detail/detail.dart';
import 'package:platform_business/screens/store/local_widgets/bar.dart';

List<ProductModel> products = TestDataProduct.data;

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barStoreWidget(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: /* products.length */ 100,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: Text(products[0].title),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              );
            }),
      ),
    );
  }
}

class StoreSearch extends SearchDelegate<ProductModel> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final myList = products;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailItemScreen()),
            );
          },
          child: Container(
              height: 80,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Text(myList[index].title)),
        );
      },
    );
  }
}
