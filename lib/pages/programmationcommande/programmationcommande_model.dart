import '/component/bouton/bouton_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'programmationcommande_widget.dart' show ProgrammationcommandeWidget;
import 'package:flutter/material.dart';

class ProgrammationcommandeModel
    extends FlutterFlowModel<ProgrammationcommandeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for Bouton component.
  late BoutonModel boutonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    boutonModel = createModel(context, () => BoutonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    boutonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
