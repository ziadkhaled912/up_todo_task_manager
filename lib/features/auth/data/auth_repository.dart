import 'package:quran_app/core/constants/cache_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  AuthRepository._();

  SharedPreferences? _sharedPreferences;

  static final AuthRepository _instance = AuthRepository._();

  factory AuthRepository() {
    return _instance;
  }

  Future<void> initialize() async {
    if(_sharedPreferences != null) {
      return;
    }
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setOnBoardingView() async {
    try {
      if(_sharedPreferences == null) return;
      await _sharedPreferences!.setBool(CacheKeys.onBoarding, true);
    } catch (e) {
      return;
    }
  }

  bool getOnBoardingView() {
    try {
      if(_sharedPreferences == null) return false;
      final result = _sharedPreferences!.getBool(CacheKeys.onBoarding);
      return result ?? false;
    } catch (e) {
      return false;
    }
  }
}
