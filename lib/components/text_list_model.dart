import '/components/dynamic_text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'text_list_widget.dart' show TextListWidget;
import 'package:flutter/material.dart';

class TextListModel extends FlutterFlowModel<TextListWidget> {
  ///  Local state fields for this component.

  List<String> textList = [''];
  void addToTextList(String item) => textList.add(item);
  void removeFromTextList(String item) => textList.remove(item);
  void removeAtIndexFromTextList(int index) => textList.removeAt(index);
  void insertAtIndexInTextList(int index, String item) =>
      textList.insert(index, item);
  void updateTextListAtIndex(int index, Function(String) updateFn) =>
      textList[index] = updateFn(textList[index]);

  ///  State fields for stateful widgets in this component.

  // Models for dynamicTextField dynamic component.
  late FlutterFlowDynamicModels<DynamicTextFieldModel> dynamicTextFieldModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dynamicTextFieldModels =
        FlutterFlowDynamicModels(() => DynamicTextFieldModel());
  }

  @override
  void dispose() {
    dynamicTextFieldModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
