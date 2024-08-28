class Productgroups {
  Productgroups({
    required this.isSuccess,
    required this.statusCode,
    required this.error,
    required this.result,
    required this.headers,
  });
  late final bool isSuccess;
  late final int statusCode;
  late final Null error;
  late final Result result;
  late final Headers headers;

  Productgroups.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    statusCode = json['statusCode'];
    error = null;
    result = Result.fromJson(json['result']);
    headers = Headers.fromJson(json['headers']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    data['statusCode'] = statusCode;
    data['error'] = error;
    data['result'] = result.toJson();
    data['headers'] = headers.toJson();
    return data;
  }
}

class Result {
  Result({
    required this.slicingAttributes,
  });
  late final List<SlicingAttributes> slicingAttributes;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      slicingAttributes: List.from(json['slicingAttributes'])
          .map((e) => SlicingAttributes.fromJson(e))
          .toList());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['slicingAttributes'] =
        slicingAttributes.map((e) => e.toJson()).toList();
    return data;
  }
}

class SlicingAttributes {
  SlicingAttributes({
    required this.brand,
    required this.attributes,
    required this.type,
    required this.displayName,
    required this.order,
    required this.displayType,
  });
  late final Brand brand;
  late final List<Attributes> attributes;
  late final String type;
  late final String displayName;
  late final int order;
  late final int displayType;

  SlicingAttributes.fromJson(Map<String, dynamic> json) {
    brand = Brand.fromJson(json['brand']);
    attributes = List.from(json['attributes'])
        .map((e) => Attributes.fromJson(e))
        .toList();
    type = json['type'];
    displayName = json['displayName'];
    order = json['order'];
    displayType = json['displayType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['brand'] = brand.toJson();
    data['attributes'] = attributes.map((e) => e.toJson()).toList();
    data['type'] = type;
    data['displayName'] = displayName;
    data['order'] = order;
    data['displayType'] = displayType;
    return data;
  }
}

class Brand {
  Brand({
    required this.beautifiedName,
    required this.id,
    required this.name,
    required this.isVirtual,
    required this.path,
  });
  late final String beautifiedName;
  late final int id;
  late final String name;
  late final bool isVirtual;
  late final String path;

  Brand.fromJson(Map<String, dynamic> json) {
    beautifiedName = json['beautifiedName'];
    id = json['id'];
    name = json['name'];
    isVirtual = json['isVirtual'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['beautifiedName'] = beautifiedName;
    data['id'] = id;
    data['name'] = name;
    data['isVirtual'] = isVirtual;
    data['path'] = path;
    return data;
  }
}

class Attributes {
  Attributes({
    required this.contents,
    required this.name,
    required this.beautifiedName,
  });
  late final List<Contents> contents;
  late final String name;
  late final String beautifiedName;

  Attributes.fromJson(Map<String, dynamic> json) {
    contents =
        List.from(json['contents']).map((e) => Contents.fromJson(e)).toList();
    name = json['name'];
    beautifiedName = json['beautifiedName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['contents'] = contents.map((e) => e.toJson()).toList();
    data['name'] = name;
    data['beautifiedName'] = beautifiedName;
    return data;
  }
}

class Contents {
  Contents({
    required this.url,
    required this.id,
    required this.imageUrl,
    required this.name,
    this.price,
  });
  late final String url;
  late final int id;
  late final String imageUrl;
  late final String name;
  late final Price? price;

  Contents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    price = Price.fromJson(json['price']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['price'] = price!.toJson();
    return data;
  }
}

class Price {
  Price({
    required this.discountedPrice,
    required this.originalPrice,
    required this.sellingPrice,
  });
  late final DiscountedPrice discountedPrice;
  late final OriginalPrice originalPrice;
  late final SellingPrice sellingPrice;

  Price.fromJson(Map<String, dynamic> json) {
    discountedPrice = DiscountedPrice.fromJson(json['discountedPrice']);
    originalPrice = OriginalPrice.fromJson(json['originalPrice']);
    sellingPrice = SellingPrice.fromJson(json['sellingPrice']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['discountedPrice'] = discountedPrice.toJson();
    data['originalPrice'] = originalPrice.toJson();
    data['sellingPrice'] = sellingPrice.toJson();
    return data;
  }
}

class DiscountedPrice {
  DiscountedPrice({
    required this.text,
    required this.value,
  });
  late final String? text;
  late final String? value;

  factory DiscountedPrice.fromJson(Map<String, dynamic> json) =>
      DiscountedPrice(text: json['text'], value: json['value'].toString());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['value'] = value;
    return data;
  }
}

class OriginalPrice {
  OriginalPrice({
    required this.text,
    required this.value,
  });
  late final String text;
  late final String value;

  OriginalPrice.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['value'] = value;
    return data;
  }
}

class SellingPrice {
  SellingPrice({
    required this.text,
    required this.value,
  });
  late final String text;
  late final String value;

  SellingPrice.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['value'] = value;
    return data;
  }
}

class Headers {
  Headers();

  Headers.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}
