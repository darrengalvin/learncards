import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'panel_edit_block_model.dart';
export 'panel_edit_block_model.dart';

class PanelEditBlockWidget extends StatefulWidget {
  const PanelEditBlockWidget({
    super.key,
    this.editBlockId,
    required this.action,
    this.tileBlock,
    bool? isDrawer,
  }) : isDrawer = isDrawer ?? false;

  final String? editBlockId;
  final Future Function()? action;
  final TileBlocksRecord? tileBlock;
  final bool isDrawer;

  @override
  State<PanelEditBlockWidget> createState() => _PanelEditBlockWidgetState();
}

class _PanelEditBlockWidgetState extends State<PanelEditBlockWidget> {
  late PanelEditBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanelEditBlockModel());

    _model.blockTitleController ??=
        TextEditingController(text: widget.tileBlock?.title);
    _model.blockTitleFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        width: valueOrDefault<double>(
          _model.panelSize,
          450.0,
        ),
        constraints: const BoxConstraints(
          maxWidth: 450.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: StreamBuilder<List<TileBlocksRecord>>(
          stream: queryTileBlocksRecord(
            queryBuilder: (tileBlocksRecord) => tileBlocksRecord.where(
              'block_id',
              isEqualTo: widget.editBlockId,
            ),
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<TileBlocksRecord> columnTileBlocksRecordList = snapshot.data!;
            final columnTileBlocksRecord = columnTileBlocksRecordList.isNotEmpty
                ? columnTileBlocksRecordList.first
                : null;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isDrawer)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PANEL_EDIT_BLOCK_COMP_CANCEL_BTN_ON_TAP');
                              logFirebaseEvent('Button_execute_callback');
                              await widget.action?.call();
                            },
                            text: 'Cancel',
                            options: FFButtonOptions(
                              height: 32.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 18.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF1AADF9),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '>',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Label',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium,
                                        ),
                                      ),
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                    width: 250.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: TextFormField(
                                      controller: _model.blockTitleController,
                                      focusNode: _model.blockTitleFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.blockTitleController',
                                        const Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText: 'Enter a name',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .btnBk,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFF1AADF9),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .blockTitleControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 18.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF1AADF9),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '>',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Label',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium,
                                        ),
                                      ),
                                  ],
                                ),
                                Container(
                                  width: 250.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FlutterFlowChoiceChips(
                                    options: const [
                                      ChipData('Text'),
                                      ChipData('Image'),
                                      ChipData('Video')
                                    ],
                                    onChanged: (val) => setState(() =>
                                        _model.blockTypeChipsValue =
                                            val?.firstOrNull),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .customColor7,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      iconColor:
                                          FlutterFlowTheme.of(context).white,
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .customColor7,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    chipSpacing: 12.0,
                                    rowSpacing: 12.0,
                                    multiselect: false,
                                    initialized:
                                        _model.blockTypeChipsValue != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.blockTypeChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [
                                        valueOrDefault<String>(
                                          widget.tileBlock?.blockType,
                                          'Text',
                                        )
                                      ],
                                    ),
                                    wrapped: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
