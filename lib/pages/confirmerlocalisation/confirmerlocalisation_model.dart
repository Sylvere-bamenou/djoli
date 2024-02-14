import '/component/bouton/bouton_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirmerlocalisation_widget.dart' show ConfirmerlocalisationWidget;
import 'package:flutter/material.dart';

class ConfirmerlocalisationModel
    extends FlutterFlowModel<ConfirmerlocalisationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    boutonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
