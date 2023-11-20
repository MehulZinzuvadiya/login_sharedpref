import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDemo {
  static final sharedPref = SharedPrefDemo._();
  SharedPrefDemo._();

  void createPref(String email, String pass, bool isLogin) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    spref.setString('e1', email);
    spref.setString('p1', pass);
    spref.setBool('isLogin', isLogin);
  }

  Future<Map> readPref() async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    String? email = sPref.getString('e1');
    String? pass = sPref.getString('p1');
    bool? isLogin = sPref.getBool('isLogin');
    Map m1 = {"e1": email, "p1": pass, 'isLogin': isLogin};
    return m1;
  }

  void clearPref() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    spref.clear();
  }
}
