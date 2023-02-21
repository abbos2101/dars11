import 'package:dars11/core/firebase/my_storage.dart';
import 'package:flutter/material.dart';

class StorageProvider extends ChangeNotifier {
  final MyStorage _storage;

  StorageProvider(this._storage);

  var _images = <String>[];

  Future<void> loadImages() async {
    _images = await _storage.files();
    notifyListeners();
  }

  List<String> get images => _images;
}
