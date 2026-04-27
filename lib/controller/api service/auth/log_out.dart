
import 'package:pc_mart/local%20storage/local_storage.dart';

class LogOutApi {
  static Future<bool>logoutApi() async {
    await LocalStorage().deleteData();
      return true;
  }
}
