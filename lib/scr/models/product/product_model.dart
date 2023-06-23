class ProductListResponsemodel {
  int? page;
  int? limit;
  int? totalItems;
  int? totalPages;
  List<Items>? items;
  ProductListResponsemodel(
      {this.items, this.limit, this.page, this.totalItems, this.totalPages});
  ProductListResponsemodel.fromJson(Map<String, dynamic> json) {
    page = parseInt(json['page']);
    limit = parseInt(json['limit']);
    totalItems = parseInt(json['totalItems']);
    totalPages = parseInt(json['totalPages']);
    page = parseInt(json['page']);

    if (json['data'] != null) {
      items = <Items>[];
      json['data'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }
}

class Items {
  int? id;
  String? name;
  int? category_;
  int? subcategory;
  String? description;
  double? price;

  Items(
      {this.category_,
      this.description,
      this.id,
      this.name,
      this.price,
      this.subcategory});
  Items.fromJson(Map<String, dynamic> json) {
    id = parseInt(json['id']);
    name = parseString(json['name']);
    category_ = parseInt(json['category_']);
    subcategory = parseInt(json['sub_category']);
    description = parseString(json['description']);
    price = parseDouble(json['price']);
  }
}

int? parseInt(dynamic baseInt) {
  if (baseInt == null) {
    return null;
  }
  if (baseInt is int) {
    return baseInt;
  }
  if (baseInt is String) {
    final int? value = int.tryParse(baseInt);
    if (value != null) {
      return value;
    }
  }
  return null;
}

double? parseDouble(dynamic baseDouble) {
  if (baseDouble == null) {
    return null;
  }
  if (baseDouble is double) {
    return baseDouble;
  }
  if (baseDouble is String) {
    final double? value = double.tryParse(baseDouble);
    if (value != null) {
      return value;
    }
  }
  return null;
}

String? parseString(dynamic baseString) {
  if (baseString == null) {
    return null;
  }
  if (baseString is String) {
    return baseString;
  }
  return null;
}
