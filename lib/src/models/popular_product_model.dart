class PopularProductModel {
  String? id;
  List<Products>? products;

  PopularProductModel({this.id, this.products});

  PopularProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productId;
  String? title;
  String? description;
  int? rating;
  String? brandNmae;
  bool? isFavourite;
  bool? isCart;
  List<ProductImages>? productImages;
  List<ModelColors>? colors;

  Products(
      {this.productId,
      this.title,
      this.description,
      this.rating,
      this.brandNmae,
      this.isFavourite,
      this.isCart,
      this.productImages,
      this.colors});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    title = json['title'];
    description = json['description'];
    rating = json['rating'];
    brandNmae = json['brandNmae'];
    isFavourite = json['isFavourite'];
    isCart = json['isCart'];
    if (json['productImages'] != null) {
      productImages = <ProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <ModelColors>[];
      json['colors'].forEach((v) {
        colors!.add(ModelColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['title'] = title;
    data['description'] = description;
    data['rating'] = rating;
    data['brandNmae'] = brandNmae;
    data['isFavourite'] = isFavourite;
    data['isCart'] = isCart;
    if (productImages != null) {
      data['productImages'] = productImages!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImages {
  String? image;

  ProductImages({this.image});

  ProductImages.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}

class ModelColors {
  String? color;

  ModelColors({this.color});

  ModelColors.fromJson(Map<String, dynamic> json) {
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    return data;
  }
}
