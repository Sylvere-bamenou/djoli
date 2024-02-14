import '/auth/firebase_auth/auth_util.dart';
import '/components/loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'phone_login_model.dart';
export 'phone_login_model.dart';

class PhoneLoginWidget extends StatefulWidget {
  const PhoneLoginWidget({super.key});

  @override
  State<PhoneLoginWidget> createState() => _PhoneLoginWidgetState();
}

class _PhoneLoginWidgetState extends State<PhoneLoginWidget> {
  late PhoneLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneLoginModel());

    _model.phoneNumberController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: const AlignmentDirectional(0.0, -1.0),
              image: Image.asset(
                'assets/images/login_bg.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'rdbgbdmh' /* Bienvenue ! */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  fontFamily: 'Quicksand',
                                  color: const Color(0xFF255C40),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // The `phone_login` field is designed to process and format user-entered phone numbers to match the international format `+XXXxXxxxxx`, with `+229` as an example prefix for phone numbers in Benin. This standardization is crucial for ensuring compatibility with the Firebase API, which utilizes this format to authenticate users via the sending of an OTP (One-Time Password). Once the phone number is formatted and validated, the OTP generated by Firebase is retrieved and forwarded to the next interface, allowing the user to proceed with verification.
                          Expanded(
                            child: Semantics(
                              label:
                                  'The `phone_login` field in our Flutter application is designed to capture and format user-entered phone numbers to the international standard format `+XXXxXxxxxx`, with `+229` serving as a sample prefix for phone numbers in Benin. This formatting is essential for ensuring compatibility with the Firebase API, which requires such a format for user authentication via an OTP (One-Time Password).\n\nTo enhance accessibility and provide semantic context in our Flutter app, we use the `TextFormField` widget for the `phone_login` field, paired with a descriptive label provided by the `labelText` property within the `InputDecoration`. This approach aids screen readers and other assistive technologies in delivering a clear understanding of the field\'s purpose to users with disabilities.\n\nAdditionally, we implement the `hintText` property to give users a visual guide on the expected phone number format, further improving the field\'s usability and accessibility.\n\nExample Flutter implementation:\n```dart\nTextFormField(\n  decoration: InputDecoration(\n    labelText: \'Phone Number\',\n    hintText: \'+229xxxxxxxx\',\n    helperText: \'Enter your phone number in the format +229xxxxxxxx.\',\n  ),\n  keyboardType: TextInputType.phone,\n  onSaved: (String? value) {\n    // Process the phone number\n  },\n  validator: (String? value) {\n    // Validate the phone number format\n  },\n)',
                              child: TextFormField(
                                controller: _model.phoneNumberController,
                                focusNode: _model.phoneNumberFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'n29lmgqi' /* Numéro de Téléphone */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Quicksand',
                                        color: Colors.black,
                                      ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Quicksand',
                                      color: Colors.black,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model.phoneNumberControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.phoneNumberMask],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // This Flutter widget implements a "Next" button designed to initiate the phone number validation and authentication process in the application. The button employs an InkWell widget to provide a visually appealing and responsive tap effect, devoid of any additional visual feedback (splash, focus, hover, and highlight colors are set to transparent to maintain a clean UI design). Upon tapping, the button executes a series of operations to validate the phone number, display a loading indicator, and navigate the user to the OTP verification page if the validation succeeds.
                      //
                      // Key Operations Performed by the Button:
                      // Displaying a Modal Bottom Sheet: When tapped, the button first displays a modal bottom sheet that is scroll-controlled, uses safe area insets, and is non-draggable. This bottom sheet presents a loading indicator (LoaderWidget()), informing the user that an operation is in progress.
                      //
                      // Phone Number Validation: The button retrieves the phone number entered by the user from _model.phoneNumberController.text. It then checks if the phone number is not null, not empty, and starts with the '+' sign, ensuring it meets the basic criteria for international phone number format.
                      //
                      // Error Handling: If the entered phone number does not satisfy the validation checks, a SnackBar is displayed with a message indicating that the phone number is required and must start with a '+'.
                      //
                      // Authentication and Navigation: Upon successful validation of the phone number, the authManager.beginPhoneAuth method is invoked. This method integrates with Firebase to initiate the phone authentication process. The onCodeSent callback is configured to navigate the user to the OTP verification page, passing the validated phone number as a query parameter for further processing.
                      //
                      // Accessibility Considerations:
                      // The widget structure, as it stands, does not explicitly include accessibility features like semantic labels for assistive technologies. However, Flutter's built-in accessibility features, such as those provided by screen readers, can still interact with the button based on its visible text content and general widget hierarchy. For enhanced accessibility, developers are encouraged to consider wrapping interactive elements with the Semantics widget to provide explicit semantic labels and hints that describe the action and purpose of the button.
                      Semantics(
                        label:
                            '// "Next" Button Implementation\nInkWell(\n  splashColor: Colors.transparent,\n  // Other color properties set to transparent for a clean UI design\n  onTap: () async {\n    // Displays a modal bottom sheet with a loading indicator\n    showModalBottomSheet(\n      // Configuration for modal bottom sheet\n    ).then((value) => safeSetState(() {}));\n    // Validation and navigation logic\n    final phoneNumberVal = _model.phoneNumberController.text;\n    if (phoneNumberVal == null || phoneNumberVal.isEmpty || !phoneNumberVal.startsWith(\'+\')) {\n      // Displays SnackBar on validation failure\n      ScaffoldMessenger.of(context).showSnackBar(\n        SnackBar(\n          content: Text(\'Phone Number is required and has to start with +.\'),\n        ),\n      );\n      return;\n    }\n    // Initiates phone authentication on validation success\n    await authManager.beginPhoneAuth(\n      // Parameters for phone authentication\n    );\n  },\n  child: Container(\n    // Styling for the button\n    child: Align(\n      alignment: AlignmentDirectional(0, 0),\n      child: Text(\n        // Button text, dynamically retrieved\n      ),\n    ),\n  ),\n)\n',
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const LoaderWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            final phoneNumberVal =
                                _model.phoneNumberController.text;
                            if (phoneNumberVal.isEmpty ||
                                !phoneNumberVal.startsWith('+')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Phone Number is required and has to start with +.'),
                                ),
                              );
                              return;
                            }
                            await authManager.beginPhoneAuth(
                              context: context,
                              phoneNumber: phoneNumberVal,
                              onCodeSent: (context) async {
                                context.goNamedAuth(
                                  'login_otp',
                                  context.mounted,
                                  queryParameters: {
                                    'phone': serializeParam(
                                      _model.phoneNumberController.text,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  ignoreRedirect: true,
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 261.0,
                            height: 51.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent2,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'xi8pf2o7' /* Suivant */,
                                ),
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}