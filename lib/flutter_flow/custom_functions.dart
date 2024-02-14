import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? totaliser(
  int? qty,
  double? price,
) {
  // function who get price and qty and return total

  double total = price! * qty!;
  return total.toString();
}

double? totalisint(
  double? qty,
  double? price,
) {
  // function who get price and qty and return total

  double total = price! * qty!;
  return total;
}

String? totalsummer(
  String? prixgros,
  String? prixdetail,
  String? qtegros,
  String? qtedetail,
) {
  // do ( String? prixgros *   String? qtegros) + (   String? prixdetail *   String? qtedetail)
  double? totalGros =
      double.tryParse(prixgros ?? '')! * double.tryParse(qtegros ?? '')!;
  double? totalDetail =
      double.tryParse(prixdetail ?? '')! * double.tryParse(qtedetail ?? '')!;
  double? total = totalGros! + totalDetail!;
  return total.toString();
}

double? totalsummerint(
  String? prixgros,
  String? prixdetail,
  String? qtegros,
  String? qtedetail,
) {
  // do ( String? prixgros *   String? qtegros) + (   String? prixdetail *   String? qtedetail)
  double? totalGros =
      double.tryParse(prixgros ?? '')! * double.tryParse(qtegros ?? '')!;
  double? totalDetail =
      double.tryParse(prixdetail ?? '')! * double.tryParse(qtedetail ?? '')!;
  double? total = totalGros! + totalDetail!;
  return total;
}

double? totalsummerintdec(
  double? prixgros,
  double? prixdetail,
  int? qtegros,
  int? qtedetail,
  double? totalcart,
) {
  // do ( String? prixgros *   String? qtegros) + (   String? prixdetail *   String? qtedetail)
  double? totalGros = prixgros! * qtegros!;
  double? totalDetail = prixdetail! * qtedetail!;
  double? total = totalcart! - (totalGros! + totalDetail!);
  return total;
}

double? priceSummary(List<double>? prices) {
  // summarize a list of prices from the product list
  if (prices == null || prices.isEmpty) {
    return null;
  }
  return prices.reduce((value, element) => value + element);
}
