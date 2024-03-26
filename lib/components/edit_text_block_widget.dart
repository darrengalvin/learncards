import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_text_block_model.dart';
export 'edit_text_block_model.dart';

class EditTextBlockWidget extends StatefulWidget {
  const EditTextBlockWidget({
    super.key,
    this.blockDoc,
    required this.tilesv2passedDoc,
  });

  final TileBlocksRecord? blockDoc;
  final Tilesv2Record? tilesv2passedDoc;

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

    _model.headerController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.tilesv2passedDoc?.title,
      '-',
    ));
    _model.headerFocusNode ??= FocusNode();

    _model.paragraphController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.blockDoc?.htmlContent,
      '-',
    ));
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: TextFormField(
              controller: _model.headerController,
              focusNode: _model.headerFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.headerController',
                const Duration(milliseconds: 2000),
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
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLines: null,
              validator: _model.headerControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
            child: TextFormField(
              controller: _model.paragraphController,
              focusNode: _model.paragraphFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.paragraphController',
                const Duration(milliseconds: 2000),
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
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLines: 20,
              validator:
                  _model.paragraphControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('EDIT_TEXT_BLOCK_COMP_UPDATE_BTN_ON_TAP');
                logFirebaseEvent('Button_backend_call');

                await widget.blockDoc!.reference
                    .update(createTileBlocksRecordData(
                  htmlContent: _model.paragraphController.text,
                  updatedTime: getCurrentTimestamp,
                ));
                logFirebaseEvent('Button_backend_call');

                await widget.blockDoc!.reference
                    .update(createTileBlocksRecordData(
                  title: _model.headerController.text,
                  updatedTime: getCurrentTimestamp,
                ));
                logFirebaseEvent('Button_bottom_sheet');
                Navigator.pop(context);
              },
              text: 'Update',
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: FlutterFlowTheme.of(context).alternate,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
