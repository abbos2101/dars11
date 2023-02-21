import 'package:dars11/core/firebase/my_remote.dart';
import 'package:dars11/core/firebase/my_storage.dart';
import 'package:dars11/core/firebase/my_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> setup() async {
  await Firebase.initializeApp();
  di.registerSingleton(MyRemote());
  await di.get<MyRemote>().init();
  di.registerSingleton(MyStore());
  di.registerSingleton(MyStorage());
}
