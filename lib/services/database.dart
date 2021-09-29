import 'package:cloud_firestore/cloud_firestore.dart';


abstract class Database {
  // Future<void> setTxn(Txn txn);
  // Stream<List<Txn>> txnsStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String? uid;
  
  // @override
  // Future<void> setTxn(Txn txn) async => await setData(
  //       path: APIPath.transaction(uid, documentIdFromCurrentDate()),
  //       data: txn.toMap(),
  //     );
  
  // @override
  // Stream<List<Txn>> txnsStream() {
  //   final path = APIPath.transactions(uid);
  //   final reference = FirebaseFirestore.instance.collection(path).orderBy('id', descending: true);
  //   final snapshots = reference.snapshots();
  //   return snapshots.map((snapshot) => snapshot.docs
  //       .map(
  //         (snapshot) => Txn.fromMap(snapshot.data()),
  //       )
  //       .toList());
  // }

  
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
   // print('$path: $data');
    await reference.set(data);
  }
}

