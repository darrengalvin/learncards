import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'app_updates_widget.dart' show AppUpdatesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppUpdatesModel extends FlutterFlowModel<AppUpdatesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for version widget.
  FocusNode? versionFocusNode;
  TextEditingController? versionController;
  String? Function(BuildContext, String?)? versionControllerValidator;
  // State field(s) for featuredsummary widget.
  FocusNode? featuredsummaryFocusNode;
  TextEditingController? featuredsummaryController;
  String? Function(BuildContext, String?)? featuredsummaryControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    versionFocusNode?.dispose();
    versionController?.dispose();

    featuredsummaryFocusNode?.dispose();
    featuredsummaryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
