import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  // GetStorage 인스턴스를 생성하여 로컬 저장소에 접근
  final _box = GetStorage();

  // 테마 모드를 저장할 때 사용할 키 값 (isDarkMode라는 키로 저장)
  final _key = 'isDarkMode';
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  // 로컬 저장소에서 테마 모드 불러오기 (값이 없으면 기본값으로 false 반환)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  // 현재 테마 모드를 반환 (저장된 값이 true면 다크 모드, false면 라이트 모드)
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
