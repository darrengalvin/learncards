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
  try {
    final logStyle =
        'color: blue; background-color: yellow; font-size: 14px; font-weight: bold;';
    final separatorStyle = 'color: red; font-size: 16px;';

    debugPrint(
        '%c===== Entering onAppLaunchCheckConfigurationAndRedirect function =====',
        logStyle);
    debugPrint(
        '%c===== Entering onAppLaunchCheckConfigurationAndRedirect function =====',
        logStyle);
    debugPrint(
        '%c===== Entering onAppLaunchCheckConfigurationAndRedirect function =====',
        logStyle);

    String pageUrl = '';
    if (kIsWeb) {
      // Web-specific logic
      pageUrl = Uri.base.toString();
      debugPrint('%cCurrent web URL: $pageUrl', logStyle);
      final uri = Uri.parse(pageUrl);

      // Test 1: Manual redirect
      if (uri.path == '/test1') {
        debugPrint('%cTest 1: Manual redirect triggered', logStyle);
        final redirectUrl = '/library?companiesDoc=0fXG0CVY9h92MjpurneyForward';
        await Future.delayed(Duration(seconds: 2));
        await Navigator.pushReplacementNamed(context, redirectUrl);
        return;
      }

      // Test 2: Query companies document based on landingUrl
      if (uri.path == '/test2') {
        debugPrint(
            '%cTest 2: Query companies document based on landingUrl triggered',
            logStyle);
        final collection = FirebaseFirestore.instance.collection('companies');
        final querySnapshot =
            await collection.where('landingUrls', arrayContains: pageUrl).get();
        if (querySnapshot.docs.isNotEmpty) {
          final foundDocId = querySnapshot.docs.first.id;
          debugPrint('%cDocument ID found: $foundDocId', logStyle);
          final redirectUrl = '/library?companiesDoc=$foundDocId';
          await Future.delayed(Duration(seconds: 2));
          await Navigator.pushReplacementNamed(context, redirectUrl);
          return;
        } else {
          debugPrint('%cNo document with matching landingUrl found', logStyle);
        }
      }

      // Test 3: Additional test (you can add your own logic here)
      if (uri.path == '/test3') {
        debugPrint('%cTest 3: Additional test triggered', logStyle);
        // Add your own test logic here
      }

      final companyDoc = uri.queryParameters['companiesDoc'];
      if (companyDoc != null && companyDoc.isNotEmpty) {
        FFAppState().selectedCompanyId = companyDoc;
        FFAppState().companyDocId = companyDoc;
        debugPrint(
            '%cCompanyDoc found in URL and AppState updated: $companyDoc',
            logStyle);

        final redirectUrl = '/library?companiesDoc=$companyDoc';
        debugPrint('%cRedirecting to: $redirectUrl', logStyle);
        await Future.delayed(Duration(seconds: 2));
        await Navigator.pushReplacementNamed(context, redirectUrl);
        return;
      } else {
        debugPrint('%cNo companyDoc found in the URL or it is empty', logStyle);
      }

      final collection = FirebaseFirestore.instance.collection('companies');
      final querySnapshot =
          await collection.where('landingUrls', arrayContains: pageUrl).get();
      if (querySnapshot.docs.isNotEmpty) {
        final foundDocId = querySnapshot.docs.first.id;
        FFAppState().selectedCompanyId = foundDocId;
        FFAppState().companyDocId = foundDocId;
        debugPrint(
            '%cDocument ID found and AppState updated: $foundDocId', logStyle);

        final redirectUrl = '/library?companiesDoc=$foundDocId';
        debugPrint('%cRedirecting to: $redirectUrl', logStyle);
        await Future.delayed(Duration(seconds: 2));
        await Navigator.pushReplacementNamed(context, redirectUrl);
        return;
      } else {
        debugPrint(
            '%cNo document with matching landingUrl found in the "companies" collection',
            logStyle);
      }
    } else {
      // Mobile app-specific logic
      final packageInfo = await PackageInfo.fromPlatform();
      final packageName = packageInfo.packageName;
      debugPrint('%cCurrent app package name: $packageName', logStyle);

      final collection = FirebaseFirestore.instance.collection('companies');
      final querySnapshot =
          await collection.where('packageName', isEqualTo: packageName).get();
      if (querySnapshot.docs.isNotEmpty) {
        final foundDocId = querySnapshot.docs.first.id;
        FFAppState().selectedCompanyId = foundDocId;
        FFAppState().companyDocId = foundDocId;
        debugPrint(
            '%cDocument ID found and AppState updated: $foundDocId', logStyle);
      } else {
        debugPrint(
            '%cNo document with matching packageName found in the "companies" collection',
            logStyle);
      }
    }

    // Additional logging for AppState
    debugPrint(
        '%cFinal AppState: selectedCompanyId = ${FFAppState().selectedCompanyId}',
        logStyle);
    debugPrint('%cFinal AppState: companyDocId = ${FFAppState().companyDocId}',
        logStyle);

    debugPrint(
        '%c----- Exiting onAppLaunchCheckConfigurationAndRedirect function -----',
        separatorStyle);
    debugPrint(
        '%c----- Exiting onAppLaunchCheckConfigurationAndRedirect function -----',
        separatorStyle);
    debugPrint(
        '%c----- Exiting onAppLaunchCheckConfigurationAndRedirect function -----',
        separatorStyle);
  } catch (error, stackTrace) {
    debugPrint(
        '%cError in onAppLaunchCheckConfigurationAndRedirect function: $error',
        'color: red; font-size: 14px;');
    debugPrint('%cStack trace: $stackTrace', 'color: red; font-size: 14px;');
    // Handle the error or display an error message
  }
}
