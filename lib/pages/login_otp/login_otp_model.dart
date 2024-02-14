import '/component/bouton/bouton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_otp_widget.dart' show LoginOtpWidget;
import 'package:flutter/material.dart';

class LoginOtpModel extends FlutterFlowModel<LoginOtpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    boutonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
