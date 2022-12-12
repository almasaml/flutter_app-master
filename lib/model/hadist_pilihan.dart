// To parse this JSON data, do
//
//     final hadistPilihanModel = hadistPilihanModelFromJson(jsonString);

import 'dart:convert';

HadistPilihanModel hadistPilihanModelFromJson(String str) => HadistPilihanModel.fromJson(json.decode(str));

String hadistPilihanModelToJson(HadistPilihanModel data) => json.encode(data.toJson());

class HadistPilihanModel {
  HadistPilihanModel({
    required this.indonesia,
    required this.arab,
    required this.jawa,
  });

  BahasaHadist indonesia;
  BahasaHadist arab;
  BahasaHadist jawa;

  factory HadistPilihanModel.fromJson(Map<String, dynamic> json) => HadistPilihanModel(
        indonesia: BahasaHadist.fromJson(json["indonesia"]),
        arab: BahasaHadist.fromJson(json["arab"]),
        jawa: BahasaHadist.fromJson(json["jawa"]),
      );

  Map<String, dynamic> toJson() => {
        "indonesia": indonesia.toJson(),
        "arab": arab.toJson(),
        "jawa": jawa.toJson(),
      };
}

class BahasaHadist {
  BahasaHadist({
    required this.id,
    required this.title,
    required this.hadist,
    required this.firman,
  });

  int id;
  String title;
  List<Firman> hadist;
  List<Firman> firman;

  factory BahasaHadist.fromJson(Map<String, dynamic> json) => BahasaHadist(
        id: json["id"],
        title: json["title"],
        hadist: List<Firman>.from(json["hadist"].map((x) => Firman.fromJson(x))),
        firman: List<Firman>.from(json["firman"].map((x) => Firman.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "hadist": List<dynamic>.from(hadist.map((x) => x.toJson())),
        "firman": List<dynamic>.from(firman.map((x) => x.toJson())),
      };
}

class Firman {
  Firman({
    required this.id,
    required this.value,
  });

  int id;
  String value;

  factory Firman.fromJson(Map<String, dynamic> json) => Firman(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
