import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/block_type_setup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'panel_block_setup_model.dart';
export 'panel_block_setup_model.dart';

class PanelBlockSetupWidget extends StatefulWidget {
  const PanelBlockSetupWidget({
    super.key,
    this.block,
  });

  final TileBlocksRecord? block;

  @override
  State<PanelBlockSetupWidget> createState() => _PanelBlockSetupWidgetState();
}

class _PanelBlockSetupWidgetState extends State<PanelBlockSetupWidget> {
  late PanelBlockSetupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanelBlockSetupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF1AADF9),
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'PANEL_BLOCK_SETUP_arrow_forward_ios_ICN_');
                      logFirebaseEvent('IconButton_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Edit Block',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Outfit'),
                          ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.delete_forever,
                      color: FlutterFlowTheme.of(context).error,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'PANEL_BLOCK_SETUP_delete_forever_ICN_ON_');
                      logFirebaseEvent('IconButton_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 18.0, 12.0, 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 300.0,
                  height: 600.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Builder(
                    builder: (context) {
                      final blockType = FFAppState()
                          .blockTypes
                          .where((e) => valueOrDefault<bool>(
                                valueOrDefault<bool>(
                                  widget.block?.blockType != null &&
                                      widget.block?.blockType != '',
                                  false,
                                )
                                    ? (e.type == widget.block?.blockType)
                                    : true,
                                true,
                              ))
                          .toList();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(blockType.length, (blockTypeIndex) {
                            final blockTypeItem = blockType[blockTypeIndex];
                            return wrapWithModel(
                              model: _model.blockTypeSetupModels.getModel(
                                blockTypeIndex.toString(),
                                blockTypeIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: BlockTypeSetupWidget(
                                key: Key(
                                  'Keyo6p_${blockTypeIndex.toString()}',
                                ),
                                parameter1: blockTypeItem.type,
                                parameter2: blockTypeItem.options,
                                parameter3: widget.block?.blockLayout,
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
