import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModeBahasaModel {
  bool jawa;
  bool indonesia;
  bool arab;
  ModeBahasaModel({
    required this.jawa,
    required this.indonesia,
    required this.arab,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jawa': jawa,
      'indonesia': indonesia,
      'arab': arab,
    };
  }

  factory ModeBahasaModel.fromMap(Map<String, dynamic> map) {
    return ModeBahasaModel(
      jawa: map['jawa'] as bool,
      indonesia: map['indonesia'] as bool,
      arab: map['arab'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModeBahasaModel.fromJson(String source) => ModeBahasaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
