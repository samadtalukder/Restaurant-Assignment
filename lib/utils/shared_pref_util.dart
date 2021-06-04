import 'package:get_storage/get_storage.dart';


class SharedPrefUtil {

  static setData(String preferenceKey, String data) {
    var box = GetStorage();

    box.write(preferenceKey, data);
  }

  static  getData(String preferenceKey)  {

    var box = GetStorage();

    String value = box.read(preferenceKey)??"";
    return value;
  }


}
