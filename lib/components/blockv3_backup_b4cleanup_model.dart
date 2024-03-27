import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/column_image_component_widget.dart';
import '/components/document_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/right_pane/chata_c_t_i_v_i_t_y/chata_c_t_i_v_i_t_y_widget.dart';
import 'blockv3_backup_b4cleanup_widget.dart' show Blockv3BackupB4cleanupWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Blockv3BackupB4cleanupModel
    extends FlutterFlowModel<Blockv3BackupB4cleanupWidget> {
  ///  Local state fields for this component.

  int viewImageIndex = 0;

  bool showEdit = false;

  FontSettingsStruct? fontSettingsWidget;
  void updateFontSettingsWidgetStruct(Function(FontSettingsStruct) updateFn) =>
      updateFn(fontSettingsWidget ??= FontSettingsStruct());

  String changedText = '';

  bool showEmptyImageUpload = false;

  int? quizCurrentID = 1;

  String? correctAnswer = '';

  double? countDownTime = 30.0;

  LearnCardsRecord? selectedLearnCard;

  bool questionReady = false;

  Color? cardBackgroundColor;

  bool? learnCardsActive;

  ///  State fields for stateful widgets in this component.

  // Model for Document component.
  late DocumentModel documentModel;
  // Model for ColumnImageComponent component.
  late ColumnImageComponentModel columnImageComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    documentModel = createModel(context, () => DocumentModel());
    columnImageComponentModel =
        createModel(context, () => ColumnImageComponentModel());
  }

  @override
  void dispose() {
    documentModel.dispose();
    columnImageComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
