// ignore: file_names
class HadistArabModel {
  //data Type
  int? id;
  String? titleArab;
  String? title;
  String? titleJawa;
  List<Dalil>? hadist;
  List<Dalil>? firman;

// constructor
  HadistArabModel(
      {this.id,
      this.titleArab,
      this.title,
      this.titleJawa,
      this.hadist,
      this.firman});

  //method that assign values to respective datatype vairables
  HadistArabModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleArab = json['titleArab'];
    title = json['title'];
    titleJawa = json['titleJawa'];
    if (json['hadist'] != null) {
      hadist = <Dalil>[];
      json['hadist'].forEach((v) {
        hadist!.add(new Dalil.fromJson(v));
      });
    }
    if (json['firman'] != null) {
      firman = <Dalil>[];
      json['firman'].forEach((v) {
        firman!.add(new Dalil.fromJson(v));
      });
    }
  }
}

// ignore: file_names
class Dalil {
  //data Type
  int? id;
  String? valueArab;
  String? value;
  String? valueJawa;

// constructor
  Dalil({this.id, this.valueArab, this.value, this.valueJawa});

  //method that assign values to respective datatype vairables
  Dalil.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    valueArab = json['valueArab'];
    value = json['value'];
    valueJawa = json['valueJawa'];
  }
}
