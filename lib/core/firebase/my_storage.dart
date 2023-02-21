import 'package:firebase_storage/firebase_storage.dart';

class MyStorage {
  final _storage = FirebaseStorage.instance;

  Future<List<String>> files() async {
    final list = (await _storage.ref().list()).items;
    //await list[0].getDownloadURL();
    final urls = <String>[];
    for (int i = 0; i < list.length; i++) {
      urls.add(await list[i].getDownloadURL());
    }
    return urls;
  }
}
