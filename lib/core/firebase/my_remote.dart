import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class MyRemote {
  final _remote = FirebaseRemoteConfig.instance;

  var _appVersions = <String, dynamic>{};
  var _expiredDate = "";

  Future<void> init() async {
    print("Start");
    try {
      await _remote.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await _remote.fetchAndActivate();
      _appVersions = jsonDecode(_remote.getValue("app_versions").asString());
      _expiredDate = _remote.getString("expired_date");
    } catch (e) {
      print("Xato: $e");
    }
  }

  Map<String, dynamic> get appVersions => _appVersions;

  String get expiredDate => _expiredDate;
}
