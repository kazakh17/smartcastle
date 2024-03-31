class GridModel {
  List<Products>? products;

  GridModel({this.products});

  GridModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? title;
  dynamic price;
  List<String>? images;

  Products(
      {
      this.title,
      this.price,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}