import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_restaurant_widget.dart' show CreateRestaurantWidget;
import 'package:flutter/material.dart';

class CreateRestaurantModel extends FlutterFlowModel<CreateRestaurantWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for restaurantName widget.
  FocusNode? restaurantNameFocusNode;
  TextEditingController? restaurantNameController;
  String? Function(BuildContext, String?)? restaurantNameControllerValidator;
  // State field(s) for villeName widget.
  FocusNode? villeNameFocusNode;
  TextEditingController? villeNameController;
  String? Function(BuildContext, String?)? villeNameControllerValidator;
  // State field(s) for quartier widget.
  FocusNode? quartierFocusNode1;
  TextEditingController? quartierController1;
  String? Function(BuildContext, String?)? quartierController1Validator;
  // State field(s) for quartier widget.
  FocusNode? quartierFocusNode2;
  TextEditingController? quartierController2;
  String? Function(BuildContext, String?)? quartierController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RestaurantRecord? refer;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    restaurantNameFocusNode?.dispose();
    restaurantNameController?.dispose();

    villeNameFocusNode?.dispose();
    villeNameController?.dispose();

    quartierFocusNode1?.dispose();
    quartierController1?.dispose();

    quartierFocusNode2?.dispose();
    quartierController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
