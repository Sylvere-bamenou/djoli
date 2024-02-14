import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "catgories" field.
  String? _catgories;
  String get catgories => _catgories ?? '';
  bool hasCatgories() => _catgories != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "indexe" field.
  int? _indexe;
  int get indexe => _indexe ?? 0;
  bool hasIndexe() => _indexe != null;

  void _initializeFields() {
    _catgories = snapshotData['catgories'] as String?;
    _image = snapshotData['image'] as String?;
    _indexe = castToType<int>(snapshotData['indexe']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? catgories,
  String? image,
  int? indexe,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'catgories': catgories,
      'image': image,
      'indexe': indexe,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.catgories == e2?.catgories &&
        e1?.image == e2?.image &&
        e1?.indexe == e2?.indexe;
  }

  @override
  int hash(CategoriesRecord? e) =>
      const ListEquality().hash([e?.catgories, e?.image, e?.indexe]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
