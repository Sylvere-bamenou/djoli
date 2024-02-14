import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _cart = (await secureStorage.getStringList('ff_cart'))
              ?.map((path) => path.ref)
              .toList() ??
          _cart;
    });
    await _safeInitAsync(() async {
      _cartPriceSummary =
          (await secureStorage.getStringList('ff_cartPriceSummary'))
                  ?.map(double.parse)
                  .toList() ??
              _cartPriceSummary;
    });
    await _safeInitAsync(() async {
      _cartitems = (await secureStorage.getStringList('ff_cartitems'))
              ?.map((x) {
                try {
                  return CartItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cartitems;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> value) {
    _cart = value;
    secureStorage.setStringList('ff_cart', value.map((x) => x.path).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(DocumentReference value) {
    _cart.add(value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference value) {
    _cart.remove(value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int index) {
    _cart.removeAt(index);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cart[index] = updateFn(_cart[index]);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    _cart.insert(index, value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  List<double> _cartPriceSummary = [];
  List<double> get cartPriceSummary => _cartPriceSummary;
  set cartPriceSummary(List<double> value) {
    _cartPriceSummary = value;
    secureStorage.setStringList(
        'ff_cartPriceSummary', value.map((x) => x.toString()).toList());
  }

  void deleteCartPriceSummary() {
    secureStorage.delete(key: 'ff_cartPriceSummary');
  }

  void addToCartPriceSummary(double value) {
    _cartPriceSummary.add(value);
    secureStorage.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  void removeFromCartPriceSummary(double value) {
    _cartPriceSummary.remove(value);
    secureStorage.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCartPriceSummary(int index) {
    _cartPriceSummary.removeAt(index);
    secureStorage.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  void updateCartPriceSummaryAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _cartPriceSummary[index] = updateFn(_cartPriceSummary[index]);
    secureStorage.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCartPriceSummary(int index, double value) {
    _cartPriceSummary.insert(index, value);
    secureStorage.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  List<CartItemStruct> _cartitems = [];
  List<CartItemStruct> get cartitems => _cartitems;
  set cartitems(List<CartItemStruct> value) {
    _cartitems = value;
    secureStorage.setStringList(
        'ff_cartitems', value.map((x) => x.serialize()).toList());
  }

  void deleteCartitems() {
    secureStorage.delete(key: 'ff_cartitems');
  }

  void addToCartitems(CartItemStruct value) {
    _cartitems.add(value);
    secureStorage.setStringList(
        'ff_cartitems', _cartitems.map((x) => x.serialize()).toList());
  }

  void removeFromCartitems(CartItemStruct value) {
    _cartitems.remove(value);
    secureStorage.setStringList(
        'ff_cartitems', _cartitems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCartitems(int index) {
    _cartitems.removeAt(index);
    secureStorage.setStringList(
        'ff_cartitems', _cartitems.map((x) => x.serialize()).toList());
  }

  void updateCartitemsAtIndex(
    int index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    _cartitems[index] = updateFn(_cartitems[index]);
    secureStorage.setStringList(
        'ff_cartitems', _cartitems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCartitems(int index, CartItemStruct value) {
    _cartitems.insert(index, value);
    secureStorage.setStringList(
        'ff_cartitems', _cartitems.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
