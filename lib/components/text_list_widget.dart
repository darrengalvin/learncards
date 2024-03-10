import '/backend/backend.dart';
import '/components/dynamic_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_list_model.dart';
export 'text_list_model.dart';

class TextListWidget extends StatefulWidget {
  const TextListWidget({
    super.key,
    this.blockDoc,
  });

  final TileBlocksRecord? blockDoc;

  @override
  State<TextListWidget> createState() => _TextListWidgetState();
}

class _TextListWidgetState extends State<TextListWidget> {
  late TextListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TEXT_LIST_COMP_TextList_ON_INIT_STATE');
      logFirebaseEvent('TextList_update_component_state');
      setState(() {
        _model.textList = (widget.blockDoc != null) == true
            ? widget.blockDoc!.textList
            : ([]).toList().cast<String>();
      });
    });

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
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create a list',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).accent2,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TEXT_LIST_COMP_Icon_110827bk_ON_TAP');
                            logFirebaseEvent('Icon_update_component_state');
                            setState(() {
                              _model.addToTextList('');
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  final bulletPoint = _model.textList.toList();
                  return ReorderableListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: bulletPoint.length,
                    itemBuilder: (context, bulletPointIndex) {
                      final bulletPointItem = bulletPoint[bulletPointIndex];
                      return Container(
                        key: ValueKey("ListView_kezpnalm" '_' +
                            bulletPointIndex.toString()),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: wrapWithModel(
                            model: _model.dynamicTextFieldModels.getModel(
                              bulletPointIndex.toString(),
                              bulletPointIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: DynamicTextFieldWidget(
                              key: Key(
                                'Key2ax_${bulletPointIndex.toString()}',
                              ),
                              action: () async {},
                            ),
                          ),
                        ),
                      );
                    },
                    onReorder: (int reorderableOldIndex,
                        int reorderableNewIndex) async {},
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
