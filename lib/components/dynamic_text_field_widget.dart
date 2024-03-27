import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'dynamic_text_field_model.dart';
export 'dynamic_text_field_model.dart';

class DynamicTextFieldWidget extends StatefulWidget {
  const DynamicTextFieldWidget({
    super.key,
    this.action,
    String? hint,
    this.initialValue,
  }) : hint = hint ?? 'Some text here...';

  final Future Function()? action;
  final String hint;
  final String? initialValue;

  @override
  State<DynamicTextFieldWidget> createState() => _DynamicTextFieldWidgetState();
}

class _DynamicTextFieldWidgetState extends State<DynamicTextFieldWidget> {
  late DynamicTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicTextFieldModel());

    _model.bulletListFieldController ??= TextEditingController();
    _model.bulletListFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey('bulletlist'),
      controller: _model.bulletListFieldController,
      focusNode: _model.bulletListFieldFocusNode,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.bulletListFieldController',
        const Duration(milliseconds: 2000),
        () => setState(() {}),
      ),
      obscureText: false,
      decoration: InputDecoration(
        labelStyle: FlutterFlowTheme.of(context).labelMedium,
        hintText: widget.hint,
        hintStyle: FlutterFlowTheme.of(context).labelMedium,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).btnBk,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF1AADF9),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(
          Icons.radio_button_checked,
          color: Color(0xFF1AADF9),
        ),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium,
      maxLines: null,
      validator: _model.bulletListFieldControllerValidator.asValidator(context),
    );
  }
}
