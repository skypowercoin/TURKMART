class Subitemsmodel {
  List<Subitems>? jsonsubitems;

  Subitemsmodel({this.jsonsubitems});

  Subitemsmodel.fromJson(Map<String, dynamic> json) {
    if (json['subitems'] != null) {
      jsonsubitems = <Subitems>[];
      json['subitems'].forEach((v) {
        jsonsubitems!.add(Subitems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jsonsubitems != null) {
      data['subitems'] = jsonsubitems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subitems {
  String? subItId;
  String? catId;
  String? itemsGroub;
  String? subItArName;
  String? subItTrName;
  String? subItEnName;
  String? uRL;
  String? subUrl;

  Subitems(
      {this.subItId,
      this.catId,
      this.itemsGroub,
      this.subItArName,
      this.subItTrName,
      this.subItEnName,
      this.uRL,
      this.subUrl});

  Subitems.fromJson(Map<String, dynamic> json) {
    subItId = json['sub_it_id'];
    catId = json['cat_id'];
    itemsGroub = json['items_groub'];
    subItArName = json['sub_it_ar_name'];
    subItTrName = json['sub_it_tr_name'];
    subItEnName = json['sub_it_en_name'];
    uRL = json['URL'];
    subUrl = json['sub_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_it_id'] = subItId;
    data['cat_id'] = catId;
    data['items_groub'] = itemsGroub;
    data['sub_it_ar_name'] = subItArName;
    data['sub_it_tr_name'] = subItTrName;
    data['sub_it_en_name'] = subItEnName;
    data['URL'] = uRL;
    data['sub_url'] = subUrl;
    return data;
  }
}

class Itemsmodel {
  List<Items>? items;

  Itemsmodel({this.items});

  Itemsmodel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? itId;
  String? itCatId;
  String? itTrName;
  String? itEnName;
  String? itArName;
  String? uRL;
  String? subUrl;

  Items(
      {this.itId,
      this.itCatId,
      this.itTrName,
      this.itEnName,
      this.itArName,
      this.uRL,
      this.subUrl});

  Items.fromJson(Map<String, dynamic> json) {
    itId = json['it_id'];
    itCatId = json['it_cat_id'];
    itTrName = json['it_tr_name'];
    itEnName = json['it_en_name'];
    itArName = json['it_ar_name'];
    uRL = json['URL'];
    subUrl = json['sub_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['it_id'] = itId;
    data['it_cat_id'] = itCatId;
    data['it_tr_name'] = itTrName;
    data['it_en_name'] = itEnName;
    data['it_ar_name'] = itArName;
    data['URL'] = uRL;
    data['sub_url'] = subUrl;
    return data;
  }
}

class Catgorysmodel {
  List<Data>? data;

  Catgorysmodel({this.data});

  Catgorysmodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? cId;
  String? cName;
  String? cEnName;
  String? uRL;

  Data({this.cId, this.cName, this.cEnName, this.uRL});

  Data.fromJson(Map<String, dynamic> json) {
    cId = json['c_id'];
    cName = json['c_name'];
    cEnName = json['c_en_name'];
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_id'] = cId;
    data['c_name'] = cName;
    data['c_en_name'] = cEnName;
    data['URL'] = uRL;
    return data;
  }
}
