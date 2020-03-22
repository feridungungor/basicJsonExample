import 'dart:convert';

AllCity allCityFromJson(String str) => AllCity.fromJson(json.decode(str));

String allCityToJson(AllCity data) => json.encode(data.toJson());

class AllCity {
  String ulkeAdi;
  String ulkeAdiEn;
  String ulkeId;

  AllCity({
    this.ulkeAdi,
    this.ulkeAdiEn,
    this.ulkeId,
  });

  factory AllCity.fromJson(Map<String, dynamic> json) => AllCity(
    ulkeAdi: json["UlkeAdi"],
    ulkeAdiEn: json["UlkeAdiEn"],
    ulkeId: json["UlkeID"],
  );

  Map<String, dynamic> toJson() => {
    "UlkeAdi": ulkeAdi,
    "UlkeAdiEn": ulkeAdiEn,
    "UlkeID": ulkeId,
  };
}
