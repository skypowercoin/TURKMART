class Catmodel {
  late String id;
  late String titales;

  Catmodel({required this.id, required this.titales});

  Catmodel.fromjson(String json) {
    id = json;
    titales = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titales'] = titales;
    return data;
  }
}
