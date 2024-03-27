import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/commenting_thread_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chata_c_t_i_v_i_t_y_model.dart';
export 'chata_c_t_i_v_i_t_y_model.dart';

class ChataCTIVITYWidget extends StatefulWidget {
  const ChataCTIVITYWidget({
    super.key,
    this.learnCardTitle,
    this.learnCardType,
    this.learnCardSummary,
    this.parameter4,
    this.learningCardId,
    this.sessionsDoc,
    this.learnCardDocument,
    this.companyDoc,
  });

  final String? learnCardTitle;
  final String? learnCardType;
  final String? learnCardSummary;
  final Color? parameter4;
  final String? learningCardId;
  final SessionsRecord? sessionsDoc;
  final LearnCardsRecord? learnCardDocument;
  final CompaniesRecord? companyDoc;

  @override
  State<ChataCTIVITYWidget> createState() => _ChataCTIVITYWidgetState();
}

class _ChataCTIVITYWidgetState extends State<ChataCTIVITYWidget> {
  late ChataCTIVITYModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChataCTIVITYModel());

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            _model.learnCardBackgroundColour,
            FlutterFlowTheme.of(context).primary,
          ),
          borderRadius: BorderRadius.circular(17.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/learncards.webp',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.learnCardTitle!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily),
                                    ),
                              ),
                              Text(
                                widget.learnCardType!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      fontSize: 12.0,
                                      fontStyle: FontStyle.italic,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily),
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    widget.learnCardSummary!
                                        .maybeHandleOverflow(
                                      maxChars: 85,
                                      replacement: '…',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          fontSize: 13.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ],
                ),
                if (FFAppState().isAParent != true)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.commentingThreadModel,
                                  updateCallback: () => setState(() {}),
                                  child: CommentingThreadWidget(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (FFAppState().isAParent != true)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      AlignedTooltip(
                        content: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Message...',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            )),
                        offset: 4.0,
                        preferredDirection: AxisDirection.down,
                        borderRadius: BorderRadius.circular(8.0),
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 4.0,
                        tailBaseWidth: 24.0,
                        tailLength: 12.0,
                        waitDuration: Duration(milliseconds: 100),
                        showDuration: Duration(milliseconds: 1500),
                        triggerMode: TooltipTriggerMode.tap,
                        child: Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
        logFirebaseEvent('CHATA_C_T_I_V_I_T_Y_MouseRegion_fxr7w4t0');
        logFirebaseEvent('MouseRegion_firestore_query');
        _model.companyForColor1 = await queryCompaniesRecordOnce(
          queryBuilder: (companiesRecord) => companiesRecord.where(
            'companyCode',
            isEqualTo: FFAppState().companySecretCode,
          ),
        );
        logFirebaseEvent('MouseRegion_update_component_state');
        setState(() {
          _model.learnCardBackgroundColour =
              _model.companyForColor1?.first?.colors?.teritoryColor;
        });

        setState(() {});
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
        logFirebaseEvent('CHATA_C_T_I_V_I_T_Y_MouseRegion_fxr7w4t0');
        logFirebaseEvent('MouseRegion_update_component_state');
        setState(() {
          _model.learnCardBackgroundColour =
              _model.companyForColor1?.first?.colors?.secondaryTextColor;
        });
      }),
    );
  }
}
