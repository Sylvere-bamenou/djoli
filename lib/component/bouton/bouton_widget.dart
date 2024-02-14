import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bouton_model.dart';
export 'bouton_model.dart';

class BoutonWidget extends StatefulWidget {
  const BoutonWidget({
    super.key,
    required this.buttonText,
  });

  final String? buttonText;

  @override
  State<BoutonWidget> createState() => _BoutonWidgetState();
}

class _BoutonWidgetState extends State<BoutonWidget> {
  late BoutonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoutonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 261.0,
      height: 51.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent2,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          valueOrDefault<String>(
            widget.buttonText,
            'button',
          ),
          style: FlutterFlowTheme.of(context).titleSmall,
        ),
      ),
    );
  }
}
