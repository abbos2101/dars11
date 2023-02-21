import 'package:cloud_firestore/cloud_firestore.dart';

class MyStore {
  final _store = FirebaseFirestore.instance;

  Stream<QuerySnapshot> get citiesStream {
    return _store.collection("cities").orderBy("name").snapshots();
  }

  Future<void> addCity(Map<String, dynamic> map) async {
    await _store.collection("cities").add(map);
  }

  Stream<QuerySnapshot<dynamic>> get regionsStream {
    return _store
        .collection("/regions/GvdFBsB70CPUXdpXqsK0/collection2")
        .orderBy("name")
        .snapshots();
  }
}
