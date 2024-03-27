import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'darren_drawer_content_block_copy_widget.dart'
    show DarrenDrawerContentBlockCopyWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    blockTitleFocusNode?.dispose();
    blockTitleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
