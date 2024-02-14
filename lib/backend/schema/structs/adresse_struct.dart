// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdresseStruct extends FFFirebaseStruct {
  AdresseStruct({
    String? pays,
    String? ville,
    String? quartier,
    String? numeroDeRue,
    LatLng? localisation,
    String? localisationSommaire,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pays = pays,
        _ville = ville,
        _quartier = quartier,
        _numeroDeRue = numeroDeRue,
        _localisation = localisation,
        _localisationSommaire = localisationSommaire,
        super(firestoreUtilData);

  // "Pays" field.
  String? _pays;
  String get pays => _pays ?? '';
  set pays(String? val) => _pays = val;
  bool hasPays() => _pays != null;

  // "ville" field.
  String? _ville;
  String get ville => _ville ?? '';
  set ville(String? val) => _ville = val;
  bool hasVille() => _ville != null;

  // "quartier" field.
  String? _quartier;
  String get quartier => _quartier ?? '';
  set quartier(String? val) => _quartier = val;
  bool hasQuartier() => _quartier != null;

  // "numero_de_rue" field.
  String? _numeroDeRue;
  String get numeroDeRue => _numeroDeRue ?? '';
  set numeroDeRue(String? val) => _numeroDeRue = val;
  bool hasNumeroDeRue() => _numeroDeRue != null;

  // "localisation" field.
  LatLng? _localisation;
  LatLng? get localisation => _localisation;
  set localisation(LatLng? val) => _localisation = val;
  bool hasLocalisation() => _localisation != null;

  // "localisation_sommaire" field.
  String? _localisationSommaire;
  String get localisationSommaire => _localisationSommaire ?? '';
  set localisationSommaire(String? val) => _localisationSommaire = val;
  bool hasLocalisationSommaire() => _localisationSommaire != null;

  static AdresseStruct fromMap(Map<String, dynamic> data) => AdresseStruct(
        pays: data['Pays'] as String?,
        ville: data['ville'] as String?,
        quartier: data['quartier'] as String?,
        numeroDeRue: data['numero_de_rue'] as String?,
        localisation: data['localisation'] as LatLng?,
        localisationSommaire: data['localisation_sommaire'] as String?,
      );

  static AdresseStruct? maybeFromMap(dynamic data) =>
      data is Map ? AdresseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Pays': _pays,
        'ville': _ville,
        'quartier': _quartier,
        'numero_de_rue': _numeroDeRue,
        'localisation': _localisation,
        'localisation_sommaire': _localisationSommaire,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Pays': serializeParam(
          _pays,
          ParamType.String,
        ),
        'ville': serializeParam(
          _ville,
          ParamType.String,
        ),
        'quartier': serializeParam(
          _quartier,
          ParamType.String,
        ),
        'numero_de_rue': serializeParam(
          _numeroDeRue,
          ParamType.String,
        ),
        'localisation': serializeParam(
          _localisation,
          ParamType.LatLng,
        ),
        'localisation_sommaire': serializeParam(
          _localisationSommaire,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdresseStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdresseStruct(
        pays: deserializeParam(
          data['Pays'],
          ParamType.String,
          false,
        ),
        ville: deserializeParam(
          data['ville'],
          ParamType.String,
          false,
        ),
        quartier: deserializeParam(
          data['quartier'],
          ParamType.String,
          false,
        ),
        numeroDeRue: deserializeParam(
          data['numero_de_rue'],
          ParamType.String,
          false,
        ),
        localisation: deserializeParam(
          data['localisation'],
          ParamType.LatLng,
          false,
        ),
        localisationSommaire: deserializeParam(
          data['localisation_sommaire'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdresseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdresseStruct &&
        pays == other.pays &&
        ville == other.ville &&
        quartier == other.quartier &&
        numeroDeRue == other.numeroDeRue &&
        localisation == other.localisation &&
        localisationSommaire == other.localisationSommaire;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [pays, ville, quartier, numeroDeRue, localisation, localisationSommaire]);
}

AdresseStruct createAdresseStruct({
  String? pays,
  String? ville,
  String? quartier,
  String? numeroDeRue,
  LatLng? localisation,
  String? localisationSommaire,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdresseStruct(
      pays: pays,
      ville: ville,
      quartier: quartier,
      numeroDeRue: numeroDeRue,
      localisation: localisation,
      localisationSommaire: localisationSommaire,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdresseStruct? updateAdresseStruct(
  AdresseStruct? adresse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adresse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdresseStructData(
  Map<String, dynamic> firestoreData,
  AdresseStruct? adresse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adresse == null) {
    return;
  }
  if (adresse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adresse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adresseData = getAdresseFirestoreData(adresse, forFieldValue);
  final nestedData = adresseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = adresse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdresseFirestoreData(
  AdresseStruct? adresse, [
  bool forFieldValue = false,
]) {
  if (adresse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adresse.toMap());

  // Add any Firestore field values
  adresse.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdresseListFirestoreData(
  List<AdresseStruct>? adresses,
) =>
    adresses?.map((e) => getAdresseFirestoreData(e, true)).toList() ?? [];
