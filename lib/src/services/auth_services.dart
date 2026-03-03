import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  late SharedPreferences _prefs;

  final RxString _token = ''.obs;

  String get token => _token.value;
  bool get isAuthenticated => token.isNotEmpty;

  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    _token.value = _prefs.getString('token') ?? '';
  }

  Future<void> setToken(String value) async {
    _token.value = value;
    await _prefs.setString('token', value);
  }

  Future<void> clearToken() async {
    _token.value = '';
    await _prefs.remove('token');
  }
}
