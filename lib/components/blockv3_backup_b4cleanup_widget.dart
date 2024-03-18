import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/column_image_component_widget.dart';
import '/components/document_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/right_pane/chata_c_t_i_v_i_t_y/chata_c_t_i_v_i_t_y_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blockv3_backup_b4cleanup_model.dart';
export 'blockv3_backup_b4cleanup_model.dart';

class Blockv3BackupB4cleanupWidget extends StatefulWidget {
  const Blockv3BackupB4cleanupWidget({
    super.key,
    required this.tileBlock,
    String? topicItem,
    this.readingItem,
    this.tilesv2Passed,
    required this.sessionId,
    required this.companyDoc,
  }) : this.topicItem = topicItem ?? 'topicItem';

  final TileBlocksRecord? tileBlock;
  final String topicItem;
  final String? readingItem;
  final Tilesv2Record? tilesv2Passed;
  final SessionsRecord? sessionId;
  final CompaniesRecord? companyDoc;

  @override
  State<Blockv3BackupB4cleanupWidget> createState() =>
      _Blockv3BackupB4cleanupWidgetState();
}

class _Blockv3BackupB4cleanupWidgetState
    extends State<Blockv3BackupB4cleanupWidget> {
  late Blockv3BackupB4cleanupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Blockv3BackupB4cleanupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BLOCKV3_BACKUP_B4CLEANUP_blockv3-backupB');
      logFirebaseEvent('blockv3-backupB4cleanup_update_app_state');
      setState(() {
        FFAppState().QuizReadyToMoveOn = true;
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
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Text(
                      FFAppState().videoControlType,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Text(
                      FFAppState().analyticsLocal.sessionId,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Text(
                      FFAppState().analyticsLocal.videoDuration.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Text(
                      FFAppState().analyticsLocal.videoWatchedTime.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 800.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 800.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (valueOrDefault<bool>(
                                    widget.tileBlock?.htmlContent != null &&
                                        widget.tileBlock?.htmlContent != '',
                                    false,
                                  ))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Container(
                                                width: 800.0,
                                                height: 240.0,
                                                decoration: BoxDecoration(),
                                                child: StreamBuilder<
                                                    List<LearnCardsRecord>>(
                                                  stream: queryLearnCardsRecord(
                                                    queryBuilder:
                                                        (learnCardsRecord) =>
                                                            learnCardsRecord
                                                                .where(
                                                      'associatedTileBlock',
                                                      isEqualTo: widget
                                                          .tileBlock
                                                          ?.reference
                                                          .id,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<LearnCardsRecord>
                                                        listViewLearnCardsRecordList =
                                                        snapshot.data!;
                                                    if (listViewLearnCardsRecordList
                                                        .isEmpty) {
                                                      return Image.asset(
                                                        'assets/images/learncards.webp',
                                                      );
                                                    }
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          listViewLearnCardsRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewLearnCardsRecord =
                                                            listViewLearnCardsRecordList[
                                                                listViewIndex];
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ChataCTIVITYWidget(
                                                              key: Key(
                                                                  'Keyc1g_${listViewIndex}_of_${listViewLearnCardsRecordList.length}'),
                                                              learnCardTitle:
                                                                  listViewLearnCardsRecord
                                                                      .title,
                                                              learnCardType:
                                                                  listViewLearnCardsRecord
                                                                      .type,
                                                              learnCardSummary:
                                                                  listViewLearnCardsRecord
                                                                      .summary,
                                                              parameter4:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model
                                                                    .cardBackgroundColor,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              learningCardId:
                                                                  listViewLearnCardsRecord
                                                                      .reference
                                                                      .id,
                                                              sessionsDoc: widget
                                                                  .sessionId,
                                                              learnCardDocument:
                                                                  listViewLearnCardsRecord,
                                                              companyDoc: widget
                                                                  .companyDoc,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  if (_model.showEdit != true)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 800.0,
                                              ),
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                16.0, 16.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xB2FAFAFA),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFE0E3E7),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState().selectedLearnCardId ==
                                                                              null ||
                                                                          FFAppState().selectedLearnCardId ==
                                                                              '',
                                                                      false,
                                                                    ))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(16.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsets.all(24.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      if (responsiveVisibility(
                                                                                        context: context,
                                                                                        phone: false,
                                                                                        tablet: false,
                                                                                        tabletLandscape: false,
                                                                                        desktop: false,
                                                                                      ))
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: Text(
                                                                                                  '20 Minutes',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Readex Pro',
                                                                                                        color: Color(0xFF14181B),
                                                                                                        fontSize: 14.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Readex Pro'),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                              child: Text(
                                                                                                'CPD  Credits: ',
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Readex Pro',
                                                                                                      color: Color(0xFF57636C),
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Readex Pro'),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              height: 32.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0xFFF1F4F8),
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                child: Text(
                                                                                                  '2',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Readex Pro',
                                                                                                        color: Color(0xFF14181B),
                                                                                                        fontSize: 14.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Readex Pro'),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      if (valueOrDefault<bool>(
                                                                                        widget.tileBlock?.htmlContent != null && widget.tileBlock?.htmlContent != '',
                                                                                        false,
                                                                                      ))
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                          child: Html(
                                                                                            data: widget.tileBlock!.htmlContent,
                                                                                            onLinkTap: (url, _, __, ___) => launchURL(url!),
                                                                                          ),
                                                                                        ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState().selectedLearnCardId !=
                                                                              null &&
                                                                          FFAppState().selectedLearnCardId !=
                                                                              '',
                                                                      false,
                                                                    ))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(16.0),
                                                                          child:
                                                                              StreamBuilder<List<LearnCardsRecord>>(
                                                                            stream:
                                                                                queryLearnCardsRecord(
                                                                              queryBuilder: (learnCardsRecord) => learnCardsRecord.where(
                                                                                'learnCardId',
                                                                                isEqualTo: FFAppState().selectedLearnCardId,
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<LearnCardsRecord> learnCardContentLearnCardsRecordList = snapshot.data!;
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(24.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                            desktop: false,
                                                                                          ))
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                    child: Text(
                                                                                                      '20 Minutes',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Readex Pro',
                                                                                                            color: Color(0xFF14181B),
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Readex Pro'),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'CPD  Credits: ',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Color(0xFF57636C),
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey('Readex Pro'),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  height: 32.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFF1F4F8),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    child: Text(
                                                                                                      '2',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Readex Pro',
                                                                                                            color: Color(0xFF14181B),
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Readex Pro'),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(),
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    if (valueOrDefault<bool>(
                                                                                      FFAppState().tempStreamingMessage != null && FFAppState().tempStreamingMessage != '',
                                                                                      false,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            if (valueOrDefault<bool>(
                                                                                              FFAppState().tempStreamingMessage != null && FFAppState().tempStreamingMessage != '',
                                                                                              false,
                                                                                            ))
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 20.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    FFAppState().tempStreamingMessage,
                                                                                                    'temp message',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FutureBuilder<
                                                              List<MessageRow>>(
                                                            future:
                                                                MessageTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eq(
                                                                'session_id',
                                                                FFAppState()
                                                                    .nonLoggedInSessionId,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MessageRow>
                                                                  containerMessageRowList =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                      tablet:
                                                                          false,
                                                                      tabletLandscape:
                                                                          false,
                                                                      desktop:
                                                                          false,
                                                                    ))
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          widget
                                                                              .tileBlock
                                                                              ?.blockTitle,
                                                                          'titleNOTSet',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                      tablet:
                                                                          false,
                                                                      tabletLandscape:
                                                                          false,
                                                                      desktop:
                                                                          false,
                                                                    ))
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          widget
                                                                              .tileBlock
                                                                              ?.blockId,
                                                                          'bloCKIDnOTsET',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                      tablet:
                                                                          false,
                                                                      tabletLandscape:
                                                                          false,
                                                                      desktop:
                                                                          false,
                                                                    ))
                                                                      FlutterFlowVideoPlayer(
                                                                        path:
                                                                            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                                                        videoType:
                                                                            VideoType.network,
                                                                        autoPlay:
                                                                            false,
                                                                        looping:
                                                                            true,
                                                                        showControls:
                                                                            true,
                                                                        allowFullScreen:
                                                                            true,
                                                                        allowPlaybackSpeedMenu:
                                                                            false,
                                                                      ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 800.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: valueOrDefault<bool>(
                                    () {
                                      if (widget.tileBlock?.blockType ==
                                          'Document') {
                                        return true;
                                      } else if (widget.tileBlock?.blockType !=
                                          'Document') {
                                        return false;
                                      } else {
                                        return false;
                                      }
                                    }(),
                                    false,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.documentModel,
                                    updateCallback: () => setState(() {}),
                                    child: DocumentWidget(
                                      tileBlock: widget.tileBlock!,
                                      isEditPassed: _model.showEdit,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 800.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: valueOrDefault<bool>(
                                    () {
                                      if (widget.tileBlock?.blockType ==
                                          'Image') {
                                        return true;
                                      } else if (widget.tileBlock?.blockType !=
                                          'Image') {
                                        return false;
                                      } else if (widget.tileBlock?.image ==
                                          'Image') {
                                        return true;
                                      } else if (widget.tileBlock?.image !=
                                          'Image') {
                                        return false;
                                      } else {
                                        return false;
                                      }
                                    }(),
                                    false,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.columnImageComponentModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: ColumnImageComponentWidget(
                                      editmode: _model.showEdit,
                                      imageHeight: valueOrDefault<int>(
                                        widget.tileBlock?.imageH,
                                        100,
                                      ),
                                      imageWidth: valueOrDefault<int>(
                                        widget.tileBlock?.imageW,
                                        100,
                                      ),
                                      blocksDoc: widget.tileBlock!,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    StreamBuilder<List<LearnCardsRecord>>(
                      stream: queryLearnCardsRecord(
                        queryBuilder: (learnCardsRecord) =>
                            learnCardsRecord.where(
                          'associatedTileBlock',
                          isEqualTo: widget.tileBlock?.reference.id,
                        ),
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
                        List<LearnCardsRecord> listViewLearnCardsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewLearnCardsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewLearnCardsRecord =
                                listViewLearnCardsRecordList[listViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: ChataCTIVITYWidget(
                                    key: Key(
                                        'Keysvn_${listViewIndex}_of_${listViewLearnCardsRecordList.length}'),
                                    learnCardTitle:
                                        listViewLearnCardsRecord.title,
                                    learnCardType:
                                        listViewLearnCardsRecord.type,
                                    learnCardSummary:
                                        listViewLearnCardsRecord.summary,
                                    parameter4: valueOrDefault<Color>(
                                      _model.cardBackgroundColor,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    learningCardId:
                                        listViewLearnCardsRecord.reference.id,
                                    sessionsDoc: widget.sessionId,
                                    learnCardDocument: listViewLearnCardsRecord,
                                    companyDoc: widget.companyDoc,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
