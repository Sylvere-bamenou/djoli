import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProduitsRecord extends FirestoreRecord {
  ProduitsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "categorie" field.
  List<DocumentReference>? _categorie;
  List<DocumentReference> get categorie => _categorie ?? const [];
  bool hasCategorie() => _categorie != null;

  // "prix_unitaire" field.
  int? _prixUnitaire;
  int get prixUnitaire => _prixUnitaire ?? 0;
  bool hasPrixUnitaire() => _prixUnitaire != null;

  // "prix_unitaire_en_gros" field.
  int? _prixUnitaireEnGros;
  int get prixUnitaireEnGros => _prixUnitaireEnGros ?? 0;
  bool hasPrixUnitaireEnGros() => _prixUnitaireEnGros != null;

  // "unit_de_mesure" field.
  String? _unitDeMesure;
  String get unitDeMesure => _unitDeMesure ?? '';
  bool hasUnitDeMesure() => _unitDeMesure != null;

  // "disponibilite" field.
  bool? _disponibilite;
  bool get disponibilite => _disponibilite ?? false;
  bool hasDisponibilite() => _disponibilite != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "unite_au_detail" field.
  String? _uniteAuDetail;
  String get uniteAuDetail => _uniteAuDetail ?? '';
  bool hasUniteAuDetail() => _uniteAuDetail != null;

  // "unite_en_gros" field.
  String? _uniteEnGros;
  String get uniteEnGros => _uniteEnGros ?? '';
  bool hasUniteEnGros() => _uniteEnGros != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _categorie = getDataList(snapshotData['categorie']);
    _prixUnitaire = castToType<int>(snapshotData['prix_unitaire']);
    _prixUnitaireEnGros =
        castToType<int>(snapshotData['prix_unitaire_en_gros']);
    _unitDeMesure = snapshotData['unit_de_mesure'] as String?;
    _disponibilite = snapshotData['disponibilite'] as bool?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _uniteAuDetail = snapshotData['unite_au_detail'] as String?;
    _uniteEnGros = snapshotData['unite_en_gros'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produits');

  static Stream<ProduitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProduitsRecord.fromSnapshot(s));

  static Future<ProduitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProduitsRecord.fromSnapshot(s));

  static ProduitsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProduitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProduitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProduitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProduitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProduitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProduitsRecordData({
  String? name,
  int? prixUnitaire,
  int? prixUnitaireEnGros,
  String? unitDeMesure,
  bool? disponibilite,
  String? description,
  String? image,
  String? uniteAuDetail,
  String? uniteEnGros,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'prix_unitaire': prixUnitaire,
      'prix_unitaire_en_gros': prixUnitaireEnGros,
      'unit_de_mesure': unitDeMesure,
      'disponibilite': disponibilite,
      'description': description,
      'image': image,
      'unite_au_detail': uniteAuDetail,
      'unite_en_gros': uniteEnGros,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProduitsRecordDocumentEquality implements Equality<ProduitsRecord> {
  const ProduitsRecordDocumentEquality();

  @override
  bool equals(ProduitsRecord? e1, ProduitsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.categorie, e2?.categorie) &&
        e1?.prixUnitaire == e2?.prixUnitaire &&
        e1?.prixUnitaireEnGros == e2?.prixUnitaireEnGros &&
        e1?.unitDeMesure == e2?.unitDeMesure &&
        e1?.disponibilite == e2?.disponibilite &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.uniteAuDetail == e2?.uniteAuDetail &&
        e1?.uniteEnGros == e2?.uniteEnGros;
  }

  @override
  int hash(ProduitsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.categorie,
        e?.prixUnitaire,
        e?.prixUnitaireEnGros,
        e?.unitDeMesure,
        e?.disponibilite,
        e?.description,
        e?.image,
        e?.uniteAuDetail,
        e?.uniteEnGros
      ]);

  @override
  bool isValidKey(Object? o) => o is ProduitsRecord;
}
