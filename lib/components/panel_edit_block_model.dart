import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_text_block_widget.dart';
import '/components/image_gallery_widget.dart';
import '/components/video_gallery_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'panel_edit_block_widget.dart' show PanelEditBlockWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PanelEditBlockModel extends FlutterFlowModel<PanelEditBlockWidget> {
  ///  Local state fields for this component.

  int callbackTab = 1;

  bool isEdit = false;

  double panelSize = 1.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for BlockTitle widget.
  FocusNode? blockTitleFocusNode;
  TextEditingController? blockTitleController;
  String? Function(BuildContext, String?)? blockTitleControllerValidator;
  // State field(s) for BlockTypeChips widget.
  FormFieldController<List<String>>? blockTypeChipsValueController;
  String? get blockTypeChipsValue =>
      blockTypeChipsValueController?.value?.firstOrNull;
  set blockTypeChipsValue(String? val) =>
      blockTypeChipsValueController?.value = val != null ? [val] : [];
  // Model for EditTextBlock component.
  late EditTextBlockModel editTextBlockModel1;
  // Model for imageGallery component.
  late ImageGalleryModel imageGalleryModel;
  // Model for VideoGallery component.
  late VideoGalleryModel videoGalleryModel;
  // Model for EditTextBlock component.
  late EditTextBlockModel editTextBlockModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    editTextBlockModel1 = createModel(context, () => EditTextBlockModel());
    imageGalleryModel = createModel(context, () => ImageGalleryModel());
    videoGalleryModel = createModel(context, () => VideoGalleryModel());
    editTextBlockModel2 = createModel(context, () => EditTextBlockModel());
  }

  @override
  void dispose() {
    blockTitleFocusNode?.dispose();
    blockTitleController?.dispose();

    editTextBlockModel1.dispose();
    imageGalleryModel.dispose();
    videoGalleryModel.dispose();
    editTextBlockModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
