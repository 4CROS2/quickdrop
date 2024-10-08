import 'package:cloud_firestore/cloud_firestore.dart';

extension QuerySnapshotExtensions on QuerySnapshot<Object?> {
  // Método para convertir a lista de Map<String, dynamic>
  List<Map<String, dynamic>> toListMapJson() {
    return docs.map((QueryDocumentSnapshot<Object?> doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  List<String> toListString() {
    return docs.map((QueryDocumentSnapshot<Object?> doc) => doc.id).toList();
  }

  // Método para convertir a Map<String, dynamic> donde la clave es el ID del documento
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = <String, dynamic>{};
    for (QueryDocumentSnapshot<Object?> doc in docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      result[doc.id] = data;
    }
    return result;
  }
}
