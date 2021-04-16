class ProductModel {
  final String title;
  final String description;
  final double price;
  final bool isAvailable;
  final double rate;
  ProductModel(
      {this.title, this.description, this.price, this.isAvailable, this.rate});
}

class TestDataProduct {
  static List<ProductModel> data = [
    ProductModel(
        title: "title",
        description: "description",
        price: 2.9,
        isAvailable: true,
        rate: 4.5),
    ProductModel(
        title: "title",
        description: "description",
        price: 2.9,
        isAvailable: true,
        rate: 4.5),
    ProductModel(
        title: "title",
        description: "description",
        price: 2.9,
        isAvailable: true,
        rate: 4.5),
    ProductModel(
        title: "title",
        description: "description",
        price: 2.9,
        isAvailable: true,
        rate: 4.5),
    ProductModel(
        title: "title",
        description: "description",
        price: 2.9,
        isAvailable: true,
        rate: 4.5),
  ];
}

class CategoryModel {
  final String title;
  final bool isAvailable;
  CategoryModel({this.title, this.isAvailable});
}

class Categories {
  static List<CategoryModel> data = [
    CategoryModel(title: "Filtros", isAvailable: true),
    CategoryModel(title: "Ensaladas", isAvailable: true),
    CategoryModel(title: "Combos", isAvailable: true),
    CategoryModel(title: "Promociones", isAvailable: true),
    CategoryModel(title: "Entradas", isAvailable: true),
    CategoryModel(title: "Postres", isAvailable: true),
    CategoryModel(title: "Bebidas", isAvailable: true)
  ];
}
