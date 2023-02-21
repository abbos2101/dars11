import 'package:dars11/pages/storage/storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoragePage extends StatelessWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StoragePage")),
      body: Builder(
        builder: (context) {
          final images = context.watch<StorageProvider>().images;
          if (images.isNotEmpty) {
            return ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<StorageProvider>().loadImages();
      }),
    );
  }
}
