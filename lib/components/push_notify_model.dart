import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'push_notify_widget.dart' show PushNotifyWidget;
import 'package:flutter/material.dart';

class PushNotifyModel extends FlutterFlowModel<PushNotifyWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> userssentpush = [];
  void addToUserssentpush(DocumentReference item) => userssentpush.add(item);
  void removeFromUserssentpush(DocumentReference item) =>
      userssentpush.remove(item);
  void removeAtIndexFromUserssentpush(int index) =>
      userssentpush.removeAt(index);
  void insertAtIndexInUserssentpush(int index, DocumentReference item) =>
      userssentpush.insert(index, item);
  void updateUserssentpushAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      userssentpush[index] = updateFn(userssentpush[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleController?.dispose();

    messageFocusNode?.dispose();
    messageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
