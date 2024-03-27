import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_text_block_on_tile_widget.dart' show EditTextBlockOnTileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTextBlockOnTileModel
    extends FlutterFlowModel<EditTextBlockOnTileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for headertext widget.
  FocusNode? headertextFocusNode;
  TextEditingController? headertextController;
  String? Function(BuildContext, String?)? headertextControllerValidator;
  // State field(s) for textblock widget.
  FocusNode? textblockFocusNode;
  TextEditingController? textblockController;
  String? Function(BuildContext, String?)? textblockControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for buttonlink widget.
  FocusNode? buttonlinkFocusNode;
  TextEditingController? buttonlinkController;
  String? Function(BuildContext, String?)? buttonlinkControllerValidator;
  // State field(s) for buttontext widget.
  FocusNode? buttontextFocusNode;
  TextEditingController? buttontextController;
  String? Function(BuildContext, String?)? buttontextControllerValidator;
  // State field(s) for position widget.
  FocusNode? positionFocusNode;
  TextEditingController? positionController;
  String? Function(BuildContext, String?)? positionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    headertextFocusNode?.dispose();
    headertextController?.dispose();

    textblockFocusNode?.dispose();
    textblockController?.dispose();

    buttonlinkFocusNode?.dispose();
    buttonlinkController?.dispose();

    buttontextFocusNode?.dispose();
    buttontextController?.dispose();

    positionFocusNode?.dispose();
    positionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
