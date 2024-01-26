import 'package:door_demo/helper/Helper.dart';
import 'package:door_demo/model/Emotion.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static late Box<String> _box; // Hive kutusunu statik olarak tanımlıyoruz

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<String>('history');
  }

  static Future<void> addItem(Emotion emotion) async {
    // Tarih ve String değerini anahtar-değer çifti olarak kutuya ekleyin
    await _box.put(Helper.dateFormat(DateTime.now()), emotion.name);
  }

  static Map<dynamic, String> getAllItems() {
    // Kutudaki tüm öğeleri alın
    return _box.toMap();
  }

  static Future<void> closeBox() async {
    // Kutuyu kapat
    await _box.close();
  }
}
