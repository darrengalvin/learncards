import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/no_access_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/search_pages/live_video/broadcast_name_input/broadcast_name_input_widget.dart';
import '/social_feed/reply_to_comment/reply_to_comment_widget.dart';
import '/testpage/components/detailedcomment/detailedcomment_widget.dart';
import '/testpage/components/post_comment_functions/post_comment_functions_widget.dart';
import '/testpage/components/post_functions/post_functions_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'social_feed_new_componant_widget.dart'
    show SocialFeedNewComponantWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SocialFeedNewComponantModel
    extends FlutterFlowModel<SocialFeedNewComponantWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for socialPostText widget.
  FocusNode? socialPostTextFocusNode;
  TextEditingController? socialPostTextController;
  String? Function(BuildContext, String?)? socialPostTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in socialPostPost widget.
  SocialpostsRecord? createdpost1;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for clouDinary widget.
  FocusNode? clouDinaryFocusNode;
  TextEditingController? clouDinaryController;
  String? Function(BuildContext, String?)? clouDinaryControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;
  // Stores action output result for [Backend Call - API (New GetLiveStreamID)] action in Card widget.
  ApiCallResponse? nEWliveStreamIdResult;
  // Stores action output result for [Backend Call - API (New GetPastLiveStream)] action in Card widget.
  ApiCallResponse? nEWpastLiveStreamResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    socialPostTextFocusNode?.dispose();
    socialPostTextController?.dispose();

    clouDinaryFocusNode?.dispose();
    clouDinaryController?.dispose();

    commentFocusNode?.dispose();
    commentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
