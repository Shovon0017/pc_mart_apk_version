class ProductLIstModel {
  List<Products>? products;

  ProductLIstModel({this.products});

  ProductLIstModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productId;
  String? categoryId;
  String? subCategoryId;
  String? childCategoryId;
  String? nameEn;
  String? image;
  num? regPrice;
  String? disType;
  String? disPrice;
  String? brand;
  int? stock;
  int? quantity;
  String? rating;

  Products(
      {this.productId,
        this.categoryId,
        this.subCategoryId,
        this.childCategoryId,
        this.nameEn,
        this.image,
        this.regPrice,
        this.disType,
        this.disPrice,
        this.brand,
        this.stock,
        this.quantity,
        this.rating});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    childCategoryId = json['child_category_id'];
    nameEn = json['name'];
    image = json['Images'];
    regPrice = json['price'];
    disType = json['dis_type'];
    disPrice = json['dis_price'];
    brand = json['brand'];
    stock = json['stock'];
    quantity=json['quantity'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = productId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['child_category_id'] = childCategoryId;
    data['name'] = nameEn;
    data['Images'] = image;
    data['price'] = regPrice;
    data['dis_type'] = disType;
    data['dis_price'] = disPrice;
    data['brand'] = brand;
    data['stock'] = stock;
    data['quantity'] = quantity;
    data['rating'] = rating;
    return data;
  }
}
