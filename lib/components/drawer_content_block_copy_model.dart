import '/backend/backend.dart';
import '/components/edit_text_block_widget.dart';
import '/components/image_gallery_widget.dart';
import '/components/video_gallery_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'drawer_content_block_copy_widget.dart'
    show DrawerContentBlockCopyWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerContentBlockCopyModel
    extends FlutterFlowModel<DrawerContentBlockCopyWidget> {
  ///  Local state fields for this component.

  int callbackTab = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for BlockTypeChips widget.
  FormFieldController<List<String>>? blockTypeChipsValueController;
  String? get blockTypeChipsValue =>
      blockTypeChipsValueController?.value?.firstOrNull;
  set blockTypeChipsValue(String? val) =>
      blockTypeChipsValueController?.value = val != null ? [val] : [];
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
    editTextBlockModel.dispose();
    imageGalleryModel.dispose();
    videoGalleryModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
