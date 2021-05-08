import 'package:flutter/material.dart';
import 'package:platform_business/models/store.dart';
import 'package:platform_business/screens/store/item/detail/detail.dart';
import 'package:platform_business/screens/store/local_widgets/bar.dart';

List<ProductModel> products = TestDataProduct.data;
final isPreviewRecomendation = false;
final double heightItem = 150;

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
                maxCrossAxisExtent: isPreviewRecomendation ? 200 : 800,
                childAspectRatio: isPreviewRecomendation ? 3 / 3.5 : 3 / 1.2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: /* products.length */ 100,
            itemBuilder: (BuildContext ctx, index) {
              // return Container(
              //   alignment: Alignment.center,
              //   child: Text(products[0].title),
              //   decoration: BoxDecoration(
              //       color: Colors.amber,
              //       borderRadius: BorderRadius.circular(15)),
              // );
              return isPreviewRecomendation
                  ? previewRecomendationWidget(context)
                  : previewOriginalWidget(context);
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

Widget previewRecomendationWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailItemScreen()),
      );
    },
    child: Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Image.asset('assets/img/food_test.jpeg',
              height: 100, width: 140, fit: BoxFit.fitHeight),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    width: 140,
                    child: Text("Titulo",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  width: 140,
                  padding: EdgeInsets.only(right: 8.0, bottom: 8),
                  child: Text(
                    "\$29,00",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget previewOriginalWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailItemScreen()),
      );
    },
    child: Container(
      clipBehavior: Clip.hardEdge,
      height: heightItem,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset('assets/img/food_test.jpeg',
              height: heightItem,
              width: 50, //screen.width / 3,
              fit: BoxFit.fitHeight),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    right: 10,
                    child: Row(children: [
                      Text("4.5", style: TextStyle(fontSize: 16)),
                      Icon(
                        Icons.star,
                        size: 22,
                        color: Colors.yellow,
                      )
                    ])),
                Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 100, //screen.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Titulo",
                              style: TextStyle(fontSize: 22), maxLines: 2),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Descripcion",
                              style: TextStyle(fontSize: 12), maxLines: 3),
                        ],
                      ),
                    )),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    "\$29,00",
                    style: TextStyle(fontSize: 32),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
