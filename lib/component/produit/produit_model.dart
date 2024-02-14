import '/flutter_flow/flutter_flow_util.dart';
import 'produit_widget.dart' show ProduitWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProduitModel extends FlutterFlowModel<ProduitWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for qtegros widget.
  int? qtegrosValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for qtedetails widget.
  int? qtedetailsValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
