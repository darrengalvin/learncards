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

Future<void> onAppLaunchCheckConfigurationAndRedirect(
    BuildContext context) async {
  String pageUrl = '';
  if (kIsWeb) {
    // Web-specific logic
    pageUrl = Uri.base.toString();
    debugPrint('Current web URL: $pageUrl');
    final uri = Uri.parse(pageUrl);

    // Test 1: Manual redirect
    if (uri.path == '/test1') {
      debugPrint('Test 1: Manual redirect triggered');
      final redirectUrl = '/library?companiesDoc=0fXG0CVY9h92MjpurneyForward';
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushReplacementNamed(context, redirectUrl);
      return;
    }

    // Test 2: Query companies document based on landingUrl
    if (uri.path == '/test2') {
      debugPrint(
          'Test 2: Query companies document based on landingUrl triggered');
      final collection = FirebaseFirestore.instance.collection('companies');
      final querySnapshot =
          await collection.where('landingUrls', arrayContains: pageUrl).get();
      if (querySnapshot.docs.isNotEmpty) {
        final foundDocId = querySnapshot.docs.first.id;
        debugPrint('Document ID found: $foundDocId');
        final redirectUrl = '/library?companiesDoc=$foundDocId';
        await Future.delayed(Duration(seconds: 2));
        await Navigator.pushReplacementNamed(context, redirectUrl);
        return;
      } else {
        debugPrint('No document with matching landingUrl found');
      }
    }

    // Test 3: Additional test (you can add your own logic here)
    if (uri.path == '/test3') {
      debugPrint('Test 3: Additional test triggered');
      // Add your own test logic here
    }

    final companyDoc = uri.queryParameters['companiesDoc'];
    if (companyDoc != null && companyDoc.isNotEmpty) {
      FFAppState().selectedCompanyId = companyDoc;
      FFAppState().companyDocId = companyDoc;
      debugPrint('CompanyDoc found in URL and AppState updated: $companyDoc');

      final redirectUrl = '/library?companiesDoc=$companyDoc';
      debugPrint('Redirecting to: $redirectUrl');
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushReplacementNamed(context, redirectUrl);
      return;
    } else {
      debugPrint('No companyDoc found in the URL or it is empty');
    }

    final collection = FirebaseFirestore.instance.collection('companies');
    final querySnapshot =
        await collection.where('landingUrls', arrayContains: pageUrl).get();
    if (querySnapshot.docs.isNotEmpty) {
      final foundDocId = querySnapshot.docs.first.id;
      FFAppState().selectedCompanyId = foundDocId;
      FFAppState().companyDocId = foundDocId;
      debugPrint('Document ID found and AppState updated: $foundDocId');

      final redirectUrl = '/library?companiesDoc=$foundDocId';
      debugPrint('Redirecting to: $redirectUrl');
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushReplacementNamed(context, redirectUrl);
      return;
    } else {
      debugPrint(
          'No document with matching landingUrl found in the "companies" collection');
    }
  } else {
    // Mobile app-specific logic
    // Add your logic here for handling mobile app-specific scenarios
  }

  // Additional logging for AppState
  debugPrint(
      'Final AppState: selectedCompanyId = ${FFAppState().selectedCompanyId}');
  debugPrint('Final AppState: companyDocId = ${FFAppState().companyDocId}');
}
