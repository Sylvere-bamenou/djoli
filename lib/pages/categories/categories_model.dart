import '/component/navbar/navbar_widget.dart';
import '/components/cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cart component.
  late CartModel cartModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cartModel = createModel(context, () => CartModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cartModel.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
