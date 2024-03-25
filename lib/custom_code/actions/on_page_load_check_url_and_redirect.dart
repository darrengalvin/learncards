// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';

// ...

Future<void> onPageLoadCheckUrlAndRedirect() async {
  String pageUrl;
  if (kIsWeb) {
    // Execute web-only logic
    pageUrl = Uri.base.toString();
  } else {
    // Mobile or other platforms logic
    pageUrl = "Non-web platform context information";
  }
  debugPrint('Current context information: $pageUrl');

  final collection = FirebaseFirestore.instance.collection('companies');
  final querySnapshot =
      await collection.where('landingUrls', arrayContains: pageUrl).get();

  String? foundDocId;
  if (querySnapshot.docs.isNotEmpty) {
    foundDocId = querySnapshot.docs.first.id;
    FFAppState().selectedCompanyId =
        foundDocId; // Update the AppState with the found document ID
    debugPrint("Document ID found and AppState updated: $foundDocId");
    FFAppState().companyDocId =
        foundDocId; // Update the AppState with the found document ID
    debugPrint("CompanyDocId found and AppState updated: $foundDocId");
    // Additional debug line to log the updated value of FFAppState
    debugPrint(
        "FFAppState.selectedCompanyId after update: ${FFAppState().selectedCompanyId}");
    debugPrint(
        "FFAppState.companyDocId after update: ${FFAppState().companyDocId}");

    // Append the companiesDoc query parameter to the URL
    final updatedUrl = '$pageUrl/library?companiesDoc=$foundDocId';
    window.location.href = updatedUrl;
  } else {
    // No document with matching landingUrl found in the 'companies' collection
    debugPrint(
        "No document with matching landingUrl found in the 'companies' collection");
  }
}
