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

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:package_info_plus/package_info_plus.dart';

// ...

Future<void> onAppLaunchCheckConfigurationAndRedirect() async {
  String pageUrl = '';
  if (kIsWeb) {
    // Web-specific logic
    pageUrl = Uri.base.toString();
    debugPrint('Current web URL: $pageUrl');

    final uri = Uri.parse(pageUrl);
    final companyDoc = uri.queryParameters['companiesDoc'];

    if (companyDoc != null) {
      FFAppState().selectedCompanyId = companyDoc;
      FFAppState().companyDocId = companyDoc;
      debugPrint("CompanyDoc found in URL and AppState updated: $companyDoc");
    } else {
      debugPrint("No companyDoc found in the URL");
    }

    final collection = FirebaseFirestore.instance.collection('companies');
    final querySnapshot =
        await collection.where('landingUrls', arrayContains: pageUrl).get();

    if (querySnapshot.docs.isNotEmpty) {
      final foundDocId = querySnapshot.docs.first.id;
      FFAppState().selectedCompanyId = foundDocId;
      FFAppState().companyDocId = foundDocId;
      debugPrint("Document ID found and AppState updated: $foundDocId");
    } else {
      debugPrint(
          "No document with matching landingUrl found in the 'companies' collection");
    }
  } else {
    // Mobile app-specific logic
    final packageInfo = await PackageInfo.fromPlatform();
    final packageName = packageInfo.packageName;
    debugPrint('Current app package name: $packageName');

    final collection = FirebaseFirestore.instance.collection('companies');
    final querySnapshot =
        await collection.where('packageName', isEqualTo: packageName).get();

    if (querySnapshot.docs.isNotEmpty) {
      final foundDocId = querySnapshot.docs.first.id;
      FFAppState().selectedCompanyId = foundDocId;
      FFAppState().companyDocId = foundDocId;
      debugPrint("Document ID found and AppState updated: $foundDocId");
    } else {
      debugPrint(
          "No document with matching packageName found in the 'companies' collection");
    }
  }
}