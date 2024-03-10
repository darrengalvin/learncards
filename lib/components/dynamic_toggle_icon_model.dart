import '/flutter_flow/flutter_flow_util.dart';
import 'dynamic_toggle_icon_widget.dart' show DynamicToggleIconWidget;
import 'package:flutter/material.dart';

class DynamicToggleIconModel extends FlutterFlowModel<DynamicToggleIconWidget> {
  ///  Local state fields for this component.

  bool toggleValue = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  Future updateToggleValue(BuildContext context) async {
    logFirebaseEvent('updateToggleValue_update_component_state');
    toggleValue = toggleValue ? false : true;
  }

  /// Additional helper methods are added here.
}
