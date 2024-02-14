import '/component/bouton/bouton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'resume_widget.dart' show ResumeWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ResumeModel extends FlutterFlowModel<ResumeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

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
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    boutonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
