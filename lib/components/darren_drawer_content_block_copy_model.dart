import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_text_block_widget.dart';
import '/components/image_gallery_widget.dart';
import '/components/video_gallery_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'darren_drawer_content_block_copy_widget.dart'
    show DarrenDrawerContentBlockCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DarrenDrawerContentBlockCopyModel
    extends FlutterFlowModel<DarrenDrawerContentBlockCopyWidget> {
  ///  Local state fields for this component.

  int callbackTab = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for BlockTitle widget.
  FocusNode? blockTitleFocusNode;
  TextEditingController? blockTitleController;
  String? Function(BuildContext, String?)? blockTitleControllerValidator;
  // State field(s) for BlockType widget.
  String? blockTypeValue;
  FormFieldController<String>? blockTypeValueController;
  // Model for EditTextBlock component.
  late EditTextBlockModel editTextBlockModel;
  // Model for imageGallery component.
  late ImageGalleryModel imageGalleryModel;
  // Model for VideoGallery component.
  late VideoGalleryModel videoGalleryModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    editTextBlockModel = createModel(context, () => EditTextBlockModel());
    imageGalleryModel = createModel(context, () => ImageGalleryModel());
    videoGalleryModel = createModel(context, () => VideoGalleryModel());
  }

  @override
  void dispose() {
    blockTitleFocusNode?.dispose();
    blockTitleController?.dispose();

    editTextBlockModel.dispose();
    imageGalleryModel.dispose();
    videoGalleryModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
