import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class RestaurantRecord extends FirestoreRecord {
  RestaurantRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "users_id" field.
  List<DocumentReference>? _usersId;
  List<DocumentReference> get usersId => _usersId ?? const [];
  bool hasUsersId() => _usersId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "adress" field.
  AdresseStruct? _adress;
  AdresseStruct get adress => _adress ?? AdresseStruct();
  bool hasAdress() => _adress != null;

  // "logo_url" field.
  String? _logoUrl;
  String get logoUrl => _logoUrl ?? '';
  bool hasLogoUrl() => _logoUrl != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _usersId = getDataList(snapshotData['users_id']);
    _name = snapshotData['name'] as String?;
    _adress = AdresseStruct.maybeFromMap(snapshotData['adress']);
    _logoUrl = snapshotData['logo_url'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurant');

  static Stream<RestaurantRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantRecord.fromSnapshot(s));

  static Future<RestaurantRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantRecord.fromSnapshot(s));

  static RestaurantRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantRecordData({
  String? name,
  AdresseStruct? adress,
  String? logoUrl,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'adress': AdresseStruct().toMap(),
      'logo_url': logoUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  // Handle nested data for "adress" field.
  addAdresseStructData(firestoreData, adress, 'adress');

  return firestoreData;
}

class RestaurantRecordDocumentEquality implements Equality<RestaurantRecord> {
  const RestaurantRecordDocumentEquality();

  @override
  bool equals(RestaurantRecord? e1, RestaurantRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.usersId, e2?.usersId) &&
        e1?.name == e2?.name &&
        e1?.adress == e2?.adress &&
        e1?.logoUrl == e2?.logoUrl &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(RestaurantRecord? e) => const ListEquality().hash(
      [e?.usersId, e?.name, e?.adress, e?.logoUrl, e?.createdAt, e?.updatedAt]);

  @override
  bool isValidKey(Object? o) => o is RestaurantRecord;
}
