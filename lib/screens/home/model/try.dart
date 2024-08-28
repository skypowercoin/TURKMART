class Converttru {
  String? base;
  Results? results;
  String? updated;
  int? ms;

  Converttru({this.base, this.results, this.updated, this.ms});

  Converttru.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
    updated = json['updated'];
    ms = json['ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    data['updated'] = updated;
    data['ms'] = ms;
    return data;
  }
}

class Results {
  double? uSD;
  double? sAR;
  double? aED;

  Results({this.uSD, this.sAR, this.aED});

  Results.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'];
    sAR = json['SAR'];
    aED = json['AED'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['USD'] = uSD;
    data['SAR'] = sAR;
    data['AED'] = aED;
    return data;
  }
}
