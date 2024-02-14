import '/component/bouton/bouton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'paiement_widget.dart' show PaiementWidget;
import 'package:flutter/material.dart';

class PaiementModel extends FlutterFlowModel<PaiementWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // Model for Bouton component.
  late BoutonModel boutonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    boutonModel = createModel(context, () => BoutonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    boutonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
