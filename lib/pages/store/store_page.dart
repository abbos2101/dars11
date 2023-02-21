import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dars11/core/firebase/my_store.dart';
import 'package:dars11/di.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StorePage")),
      body: StreamBuilder<QuerySnapshot>(
          stream: di.get<MyStore>().citiesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data?.docs ?? [];
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (_, i) => const Divider(thickness: 3),
                itemBuilder: (context, index) {
                  return Text(
                    "${list[index].data()}",
                    style: const TextStyle(fontSize: 32),
                  );
                },
              );
              return Center(
                child: Text(
                  "${snapshot.data?.docs[0].data()}",
                  style: const TextStyle(fontSize: 32),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await di.get<MyStore>().addCity(
          {"name": "RandomCity:${Random().nextInt(1000)}"},
        );
      }),
    );
  }
}
