class AddToCartModel {
  String? status;
  String? message;
  List<AddToCartProduct>? addtocartproduct;

  AddToCartModel({this.status, this.message, this.addtocartproduct});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['product_cart'] != null) {
      addtocartproduct = <AddToCartProduct>[];
      json['product_cart'].forEach((v) {
        addtocartproduct!.add(new AddToCartProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.addtocartproduct != null) {
      data['product_cart'] = this.addtocartproduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddToCartProduct {
  int? productId;
  String? productImage;
  ProductName? productName;
  int? discountType;
  int? discountPrice;
  double? salePrice;
  int? quantity;

  AddToCartProduct(
      {this.productId,
        this.productImage,
        this.productName,
        this.discountType,
        this.discountPrice,
        this.salePrice,
        this.quantity});

  AddToCartProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productImage = json['product_image'];
    productName = json['product_name'] != null
        ? new ProductName.fromJson(json['product_name'])
        : null;
    discountType = json['discount_type'];
    discountPrice = json['discount_price'];
    salePrice = json['sale_price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_image'] = this.productImage;
    if (this.productName != null) {
      data['product_name'] = this.productName!.toJson();
    }
    data['discount_type'] = this.discountType;
    data['discount_price'] = this.discountPrice;
    data['sale_price'] = this.salePrice;
    data['quantity'] = this.quantity;
    return data;
  }
}

class ProductName {
  String? en;

  ProductName({this.en});

  ProductName.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}
