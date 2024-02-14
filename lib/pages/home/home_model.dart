import '/component/navbar/navbar_widget.dart';
import '/component/searchform/searchform_widget.dart';
import '/components/cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cart component.
  late CartModel cartModel;
  // Model for searchform component.
  late SearchformModel searchformModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cartModel = createModel(context, () => CartModel());
    searchformModel = createModel(context, () => SearchformModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cartModel.dispose();
    searchformModel.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
