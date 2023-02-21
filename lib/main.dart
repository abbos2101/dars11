import 'package:dars11/di.dart';
import 'package:dars11/pages/remote/remote_page.dart';
import 'package:dars11/pages/remote/remote_provider.dart';
import 'package:dars11/pages/storage/storage_page.dart';
import 'package:dars11/pages/storage/storage_provider.dart';
import 'package:dars11/pages/store/store_page.dart';
import 'package:dars11/pages/store/store_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dars11',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routes: {
        "/remote": (context) {
          return ChangeNotifierProvider(
            create: (context) => RemoteProvider(),
            child: const RemotePage(),
          );
        },
        "/storage": (context) {
          return ChangeNotifierProvider(
            create: (context) => StorageProvider(di.get()),
            child: const StoragePage(),
          );
        },
        "/store": (context) {
          return ChangeNotifierProvider(
            create: (context) => StoreProvider(),
            child: const StorePage(),
          );
        }
      },
      initialRoute: "/storage",
    );
  }
}
