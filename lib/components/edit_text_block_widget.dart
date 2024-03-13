import '/backend/backend.dart';
import '/components/text_list_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_text_block_model.dart';
export 'edit_text_block_model.dart';

class EditTextBlockWidget extends StatefulWidget {
  const EditTextBlockWidget({
    super.key,
    this.blockDoc,
  });

  final TileBlocksRecord? blockDoc;

  @override
  State<EditTextBlockWidget> createState() => _EditTextBlockWidgetState();
}

class _EditTextBlockWidgetState extends State<EditTextBlockWidget> {
  late EditTextBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTextBlockModel());

    _model.headerController ??=
        TextEditingController(text: widget.blockDoc?.text);
    _model.headerFocusNode ??= FocusNode();

    _model.paragraphController ??=
        TextEditingController(text: widget.blockDoc?.text);
    _model.paragraphFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
              child: FlutterFlowChoiceChips(
                options: [
                  ChipData('Header'),
                  ChipData('Body'),
                  ChipData('List')
                ],
                onChanged: (val) =>
                    setState(() => _model.textIOptionsValue = val?.firstOrNull),
                selectedChipStyle: ChipStyle(
                  backgroundColor: Color(0xFF1AADF9),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).white,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  iconColor: FlutterFlowTheme.of(context).white,
                  iconSize: 18.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  iconSize: 18.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                chipSpacing: 12.0,
                rowSpacing: 12.0,
                multiselect: false,
                initialized: _model.textIOptionsValue != null,
                alignment: WrapAlignment.start,
                controller: _model.textIOptionsValueController ??=
                    FormFieldController<List<String>>(
                  [
                    widget.blockDoc != null
                        ? valueOrDefault<String>(
                            widget.blockDoc?.blockLayout,
                            'Header',
                          )
                        : 'Header'
                  ],
                ),
                wrapped: false,
              ),
            ),
          ),
          if (valueOrDefault<bool>(
            _model.textIOptionsValue == 'Header',
            false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: TextFormField(
                controller: _model.headerController,
                focusNode: _model.headerFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.headerController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Header Text',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).btnBk,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
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
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: null,
                validator:
                    _model.headerControllerValidator.asValidator(context),
              ),
            ),
          if (valueOrDefault<bool>(
            _model.textIOptionsValue == 'Body',
            false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: TextFormField(
                controller: _model.paragraphController,
                focusNode: _model.paragraphFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.paragraphController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Write a paragraph of text',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).btnBk,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
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
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: 8,
                validator:
                    _model.paragraphControllerValidator.asValidator(context),
              ),
            ),
          if (valueOrDefault<bool>(
            _model.textIOptionsValue == 'List',
            false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: wrapWithModel(
                model: _model.textListModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: TextListWidget(
                  blockDoc: widget.blockDoc,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
