import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_app/services/api_path.dart';

class CollageId {
  CollageId({
    required this.name,
    required this.image,
  });
  final String? name;
  final Uri? image;

  factory CollageId.fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      return null!;
    }
    final String? name = data['name'];
    final Uri? image = data['image'];

    return CollageId(name: name, image: image);
  }
}

abstract class CollageBase {
  Stream<List<CollageId>> matchStream();
  Stream<CollageId> collageStream({String? id});
}

class Match implements CollageBase {
  @override
  Stream<List<CollageId>> matchStream() {
    final path = APIPath.collages();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map(
          (snapshot) => CollageId.fromMap(snapshot.data()),
        )
        .toList());
  }

  @override
  Stream<CollageId> collageStream({String? id}) {
    final path = APIPath.collagedata(id: id);
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => CollageId.fromMap(snapshot.data()));
  }
}
