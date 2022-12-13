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
}
