import 'package:flutter_app/model/mode_bahasa_model.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  static get fontScale {
    var box = GetStorage();
    var value = box.read("FONT_SCALE") ?? 1.0;

    return value;
  }

  static setFontScale(double value) {
    var box = GetStorage();
    box.write("FONT_SCALE", value);
  }

  static setAllHadistBahasa(ModeBahasaModel model) {
    var box = GetStorage();
    box.write("ALL_HADIST_MODE", model);
  }

  static ModeBahasaModel get allHadistBahasa {
    var box = GetStorage();
    var value = box.read("ALL_HADIST_MODE") ?? ModeBahasaModel(jawa: true, indonesia: true, arab: true);
    if (value is ModeBahasaModel) {
      return value;
    }
    return ModeBahasaModel.fromJson(value);
  }

  static setHadistPilihanBahasa(ModeBahasaModel model) {
    var box = GetStorage();
    box.write("HADIST_PILIHAN", model);
  }

  static ModeBahasaModel get hadistPilihanBahasa {
    var box = GetStorage();
    var value = box.read("HADIST_PILIHAN") ?? ModeBahasaModel(jawa: true, indonesia: true, arab: true);

    if (value is ModeBahasaModel) {
      return value;
    }
    return ModeBahasaModel.fromJson(value);
  }
}
