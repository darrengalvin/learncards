import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'radio_buttons_model.dart';
export 'radio_buttons_model.dart';

class RadioButtonsWidget extends StatefulWidget {
  const RadioButtonsWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final List<String>? parameter1;
  final String? parameter2;

  @override
  State<RadioButtonsWidget> createState() => _RadioButtonsWidgetState();
}

class _RadioButtonsWidgetState extends State<RadioButtonsWidget> {
  late RadioButtonsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioButtonsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowRadioButton(
      options: widget.parameter1!.toList(),
      onChanged: (val) => setState(() {}),
      controller: _model.radioButtonValueController ??=
          FormFieldController<String>(widget.parameter2!),
      optionHeight: 32.0,
      textStyle: FlutterFlowTheme.of(context).labelMedium,
      selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            color: FlutterFlowTheme.of(context).customColor7,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
          ),
      buttonPosition: RadioButtonPosition.left,
      direction: Axis.vertical,
      radioButtonColor: FlutterFlowTheme.of(context).customColor7,
      inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
      toggleable: true,
      horizontalAlignment: WrapAlignment.start,
      verticalAlignment: WrapCrossAlignment.start,
    );
  }
}
