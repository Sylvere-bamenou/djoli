import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommandeRecord extends FirestoreRecord {
  CommandeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "clients_id" field.
  DocumentReference? _clientsId;
  DocumentReference? get clientsId => _clientsId;
  bool hasClientsId() => _clientsId != null;

  // "restaurant_id" field.
  DocumentReference? _restaurantId;
  DocumentReference? get restaurantId => _restaurantId;
  bool hasRestaurantId() => _restaurantId != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "statut_de_la_commande" field.
  String? _statutDeLaCommande;
  String get statutDeLaCommande => _statutDeLaCommande ?? '';
  bool hasStatutDeLaCommande() => _statutDeLaCommande != null;

  // "date_commande" field.
  DateTime? _dateCommande;
  DateTime? get dateCommande => _dateCommande;
  bool hasDateCommande() => _dateCommande != null;

  // "addresse_de_livraison" field.
  AdresseStruct? _addresseDeLivraison;
  AdresseStruct get addresseDeLivraison =>
      _addresseDeLivraison ?? AdresseStruct();
  bool hasAddresseDeLivraison() => _addresseDeLivraison != null;

  // "cart" field.
  List<CartItemStruct>? _cart;
  List<CartItemStruct> get cart => _cart ?? const [];
  bool hasCart() => _cart != null;

  // "datedelivraison" field.
  DateTime? _datedelivraison;
  DateTime? get datedelivraison => _datedelivraison;
  bool hasDatedelivraison() => _datedelivraison != null;

  // "heuredelivraison" field.
  String? _heuredelivraison;
  String get heuredelivraison => _heuredelivraison ?? '';
  bool hasHeuredelivraison() => _heuredelivraison != null;

  void _initializeFields() {
    _clientsId = snapshotData['clients_id'] as DocumentReference?;
    _restaurantId = snapshotData['restaurant_id'] as DocumentReference?;
    _total = castToType<double>(snapshotData['total']);
    _statutDeLaCommande = snapshotData['statut_de_la_commande'] as String?;
    _dateCommande = snapshotData['date_commande'] as DateTime?;
    _addresseDeLivraison =
        AdresseStruct.maybeFromMap(snapshotData['addresse_de_livraison']);
    _cart = getStructList(
      snapshotData['cart'],
      CartItemStruct.fromMap,
    );
    _datedelivraison = snapshotData['datedelivraison'] as DateTime?;
    _heuredelivraison = snapshotData['heuredelivraison'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commande');

  static Stream<CommandeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommandeRecord.fromSnapshot(s));

  static Future<CommandeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommandeRecord.fromSnapshot(s));

  static CommandeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommandeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommandeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommandeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommandeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommandeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommandeRecordData({
  DocumentReference? clientsId,
  DocumentReference? restaurantId,
  double? total,
  String? statutDeLaCommande,
  DateTime? dateCommande,
  AdresseStruct? addresseDeLivraison,
  DateTime? datedelivraison,
  String? heuredelivraison,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'clients_id': clientsId,
      'restaurant_id': restaurantId,
      'total': total,
      'statut_de_la_commande': statutDeLaCommande,
      'date_commande': dateCommande,
      'addresse_de_livraison': AdresseStruct().toMap(),
      'datedelivraison': datedelivraison,
      'heuredelivraison': heuredelivraison,
    }.withoutNulls,
  );

  // Handle nested data for "addresse_de_livraison" field.
  addAdresseStructData(
      firestoreData, addresseDeLivraison, 'addresse_de_livraison');

  return firestoreData;
}

class CommandeRecordDocumentEquality implements Equality<CommandeRecord> {
  const CommandeRecordDocumentEquality();

  @override
  bool equals(CommandeRecord? e1, CommandeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clientsId == e2?.clientsId &&
        e1?.restaurantId == e2?.restaurantId &&
        e1?.total == e2?.total &&
        e1?.statutDeLaCommande == e2?.statutDeLaCommande &&
        e1?.dateCommande == e2?.dateCommande &&
        e1?.addresseDeLivraison == e2?.addresseDeLivraison &&
        listEquality.equals(e1?.cart, e2?.cart) &&
        e1?.datedelivraison == e2?.datedelivraison &&
        e1?.heuredelivraison == e2?.heuredelivraison;
  }

  @override
  int hash(CommandeRecord? e) => const ListEquality().hash([
        e?.clientsId,
        e?.restaurantId,
        e?.total,
        e?.statutDeLaCommande,
        e?.dateCommande,
        e?.addresseDeLivraison,
        e?.cart,
        e?.datedelivraison,
        e?.heuredelivraison
      ]);

  @override
  bool isValidKey(Object? o) => o is CommandeRecord;
}
