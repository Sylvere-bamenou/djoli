import '/component/bouton/bouton_widget.dart';
import '/components/cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'panier_widget.dart' show PanierWidget;
import 'package:flutter/material.dart';

class PanierModel extends FlutterFlowModel<PanierWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cart component.
  late CartModel cartModel;
  // Model for Bouton component.
  late BoutonModel boutonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cartModel = createModel(context, () => CartModel());
    boutonModel = createModel(context, () => BoutonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cartModel.dispose();
    boutonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
