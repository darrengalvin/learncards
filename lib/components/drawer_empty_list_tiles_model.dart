import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'drawer_empty_list_tiles_widget.dart' show DrawerEmptyListTilesWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DrawerEmptyListTilesModel
    extends FlutterFlowModel<DrawerEmptyListTilesWidget> {
  ///  Local state fields for this component.

  bool isStatusTextVisible = false;

  bool showBlock = false;

  TileBlocksRecord? newTileBlock;

  double imageOpacity = 100.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameController;
  String? Function(BuildContext, String?)? textFieldNameControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // State field(s) for SelectTileType widget.
  String? selectTileTypeValue;
  FormFieldController<String>? selectTileTypeValueController;
  // State field(s) for SwitchMembers widget.
  bool? switchMembersValue;
  // State field(s) for SelectGroups widget.
  String? selectGroupsValue;
  FormFieldController<String>? selectGroupsValueController;
  // State field(s) for TextFieldNewGroup widget.
  FocusNode? textFieldNewGroupFocusNode;
  TextEditingController? textFieldNewGroupController;
  String? Function(BuildContext, String?)? textFieldNewGroupControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GroupsRecord? newGroup;
  // State field(s) for SwitchFeatured widget.
  bool? switchFeaturedValue;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  TileBlocksRecord? newInlineBlockEndCreated;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameController?.dispose();

    expandableController.dispose();
    textFieldNewGroupFocusNode?.dispose();
    textFieldNewGroupController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
