import 'package:dars11/core/firebase/my_remote.dart';
import 'package:dars11/di.dart';
import 'package:flutter/material.dart';
import 'remote_provider.dart';

class RemotePage extends StatelessWidget {
  const RemotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remote = di.get<MyRemote>();
    return Scaffold(
      appBar: AppBar(title: const Text("RemotePage")),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(remote.appVersions);
        print(remote.expiredDate);
      }),
    );
  }
}
