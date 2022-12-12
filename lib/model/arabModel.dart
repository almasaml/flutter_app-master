// ignore: file_names
class ArabDataModel {
  //data Type
  int? id;
  String? value;
  String? filter;
  String? valueIndonesia;
  String? valueJawa;
 
// constructor
  ArabDataModel(
      {this.id,
      this.value,
      this.filter,
      this.valueIndonesia,
      this.valueJawa});

  //method that assign values to respective datatype vairables
  ArabDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    filter = json['filter'];
    valueIndonesia = json['valueIndonesia'];
    valueJawa = json['valueJawa'];
  }
}