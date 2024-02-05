import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:samplestore/features/flashsales/business/modal/product.dart';
import 'package:samplestore/hive/app_hive_box.dart';

class HiveManager {
  Future<void> init() async {
    await Hive.initFlutter();

    _registerAdapters();
    await _openBoxes();
  }

  void _registerAdapters() {
    Hive.registerAdapter(ProductAdapter());
  }

  Future<void> _openBoxes() async {
    await Hive.openBox<Product>(
      AppHiveBox.product,
    );
  }

  Future<void> clearForLogout() async {
    try {
      await Future.wait(
        [
          Hive.box<Product?>(AppHiveBox.product).clear(),
        ],
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
