import '/backend/backend.dart';
import '/component/navbar/navbar_widget.dart';
import '/component/searchform/searchform_widget.dart';
import '/components/cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_categori_widget.dart' show DetailCategoriWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DetailCategoriModel extends FlutterFlowModel<DetailCategoriWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cart component.
  late CartModel cartModel;
  // Model for searchform component.
  late SearchformModel searchformModel;
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProduitsRecord>? gridViewPagingController;
  Query? gridViewPagingQuery;
  List<StreamSubscription?> gridViewStreamSubscriptions = [];

  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cartModel = createModel(context, () => CartModel());
    searchformModel = createModel(context, () => SearchformModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cartModel.dispose();
    searchformModel.dispose();
    for (var s in gridViewStreamSubscriptions) {
      s?.cancel();
    }
    gridViewPagingController?.dispose();

    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ProduitsRecord> setGridViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController ??= _createGridViewController(query, parent);
    if (gridViewPagingQuery != query) {
      gridViewPagingQuery = query;
      gridViewPagingController?.refresh();
    }
    return gridViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ProduitsRecord> _createGridViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProduitsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProduitsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
