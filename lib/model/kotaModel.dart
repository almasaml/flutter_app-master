class kotaModel{
  final String? id;
  final String? lokasi;

  kotaModel({this.id, this.lokasi});

  factory kotaModel.formJson(Map <String, dynamic> json){
    return new kotaModel(
       id: json['id'],
       lokasi: json['lokasi'],
    );
  }
}