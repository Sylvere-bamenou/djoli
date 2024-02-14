// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemStruct extends FFFirebaseStruct {
  CartItemStruct({
    DocumentReference? itemRef,
    double? qteGros,
    double? qteDetail,
    double? totalPrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemRef = itemRef,
        _qteGros = qteGros,
        _qteDetail = qteDetail,
        _totalPrice = totalPrice,
        super(firestoreUtilData);

  // "itemRef" field.
  DocumentReference? _itemRef;
  DocumentReference? get itemRef => _itemRef;
  set itemRef(DocumentReference? val) => _itemRef = val;
  bool hasItemRef() => _itemRef != null;

  // "qte_gros" field.
  double? _qteGros;
  double get qteGros => _qteGros ?? 0.0;
  set qteGros(double? val) => _qteGros = val;
  void incrementQteGros(double amount) => _qteGros = qteGros + amount;
  bool hasQteGros() => _qteGros != null;

  // "qte_detail" field.
  double? _qteDetail;
  double get qteDetail => _qteDetail ?? 0.0;
  set qteDetail(double? val) => _qteDetail = val;
  void incrementQteDetail(double amount) => _qteDetail = qteDetail + amount;
  bool hasQteDetail() => _qteDetail != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;
  void incrementTotalPrice(double amount) => _totalPrice = totalPrice + amount;
  bool hasTotalPrice() => _totalPrice != null;

  static CartItemStruct fromMap(Map<String, dynamic> data) => CartItemStruct(
        itemRef: data['itemRef'] as DocumentReference?,
        qteGros: castToType<double>(data['qte_gros']),
        qteDetail: castToType<double>(data['qte_detail']),
        totalPrice: castToType<double>(data['totalPrice']),
      );

  static CartItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'itemRef': _itemRef,
        'qte_gros': _qteGros,
        'qte_detail': _qteDetail,
        'totalPrice': _totalPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'itemRef': serializeParam(
          _itemRef,
          ParamType.DocumentReference,
        ),
        'qte_gros': serializeParam(
          _qteGros,
          ParamType.double,
        ),
        'qte_detail': serializeParam(
          _qteDetail,
          ParamType.double,
        ),
        'totalPrice': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static CartItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemStruct(
        itemRef: deserializeParam(
          data['itemRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['produits'],
        ),
        qteGros: deserializeParam(
          data['qte_gros'],
          ParamType.double,
          false,
        ),
        qteDetail: deserializeParam(
          data['qte_detail'],
          ParamType.double,
          false,
        ),
        totalPrice: deserializeParam(
          data['totalPrice'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CartItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemStruct &&
        itemRef == other.itemRef &&
        qteGros == other.qteGros &&
        qteDetail == other.qteDetail &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([itemRef, qteGros, qteDetail, totalPrice]);
}

CartItemStruct createCartItemStruct({
  DocumentReference? itemRef,
  double? qteGros,
  double? qteDetail,
  double? totalPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemStruct(
      itemRef: itemRef,
      qteGros: qteGros,
      qteDetail: qteDetail,
      totalPrice: totalPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemStruct? updateCartItemStruct(
  CartItemStruct? cartItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemStructData(
  Map<String, dynamic> firestoreData,
  CartItemStruct? cartItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItem == null) {
    return;
  }
  if (cartItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemData = getCartItemFirestoreData(cartItem, forFieldValue);
  final nestedData = cartItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemFirestoreData(
  CartItemStruct? cartItem, [
  bool forFieldValue = false,
]) {
  if (cartItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItem.toMap());

  // Add any Firestore field values
  cartItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemListFirestoreData(
  List<CartItemStruct>? cartItems,
) =>
    cartItems?.map((e) => getCartItemFirestoreData(e, true)).toList() ?? [];
