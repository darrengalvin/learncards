import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'commenting_thread_model.dart';
export 'commenting_thread_model.dart';

class CommentingThreadWidget extends StatefulWidget {
  const CommentingThreadWidget({super.key});

  @override
  State<CommentingThreadWidget> createState() => _CommentingThreadWidgetState();
}

class _CommentingThreadWidgetState extends State<CommentingThreadWidget>
    with TickerProviderStateMixin {
  late CommentingThreadModel _model;

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentingThreadModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: StreamBuilder<List<LearnCardEntriesRecord>>(
        stream: queryLearnCardEntriesRecord(),
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
          List<LearnCardEntriesRecord>
              contentCommentsLearnCardEntriesRecordList = snapshot.data!;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Builder(
              builder: (context) {
                final listOfLearnCardEntries =
                    contentCommentsLearnCardEntriesRecordList
                        .where((e) =>
                            e.associatedLearnCard ==
                            FFAppState().selectedLearnCardId)
                        .toList()
                        .sortedList((e) => e.postedTime!)
                        .toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listOfLearnCardEntries.length,
                  itemBuilder: (context, listOfLearnCardEntriesIndex) {
                    final listOfLearnCardEntriesItem =
                        listOfLearnCardEntries[listOfLearnCardEntriesIndex];
                    return Opacity(
                      opacity: 0.9,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      if (valueOrDefault<bool>(
                                        listOfLearnCardEntriesItem.private !=
                                            true,
                                        false,
                                      ))
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                        listOfLearnCardEntriesItem.private ==
                                            true,
                                        true,
                                      ))
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.lock_person,
                                            color: Color(0xFFCEBB57),
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  listOfLearnCardEntriesItem
                                                      .postedBy,
                                                  'userName',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge,
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [],
                                              ),
                                              AlignedTooltip(
                                                content: Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Text(
                                                      'This will show you your hidden comment but will not make it visible to all users.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    )),
                                                offset: 4.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 4.0,
                                                tailBaseWidth: 24.0,
                                                tailLength: 12.0,
                                                waitDuration:
                                                    Duration(milliseconds: 100),
                                                showDuration: Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'COMMENTING_THREAD_Container_hkp8nqgn_ON_');
                                                    logFirebaseEvent(
                                                        'Container_update_component_state');
                                                    setState(() {
                                                      _model.showHiddenComment =
                                                          !_model
                                                              .showHiddenComment;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Visibility(
                                                      visible:
                                                          listOfLearnCardEntriesItem
                                                                  .private ==
                                                              true,
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.remove_red_eye,
                                                          color: listOfLearnCardEntriesItem
                                                                      .private ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor3,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                  'relative',
                                                  listOfLearnCardEntriesItem
                                                      .postedTime!),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  if (valueOrDefault<bool>(
                                    (contentCommentsLearnCardEntriesRecordList
                                                .first.private ==
                                            true) &&
                                        (_model.showHiddenComment != true),
                                    false,
                                  ))
                                    Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Text(
                                                  'PRIVATE',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                    (contentCommentsLearnCardEntriesRecordList
                                                .first.private !=
                                            true) ||
                                        (_model.showHiddenComment == true),
                                    false,
                                  ))
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Text(
                                                  listOfLearnCardEntriesItem
                                                      .postDetails,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            listOfLearnCardEntriesItem
                                                .postLikes.length
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'likes',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.mode_comment_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '8',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Comments',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 12.0),
                                child: StreamBuilder<
                                    List<LearnCardEntryCommentsRecord>>(
                                  stream: queryLearnCardEntryCommentsRecord(
                                    queryBuilder:
                                        (learnCardEntryCommentsRecord) =>
                                            learnCardEntryCommentsRecord
                                                .where(
                                                  'associatedLearnCard',
                                                  isEqualTo: FFAppState()
                                                      .selectedLearnCardId,
                                                )
                                                .where(
                                                  'associatedLearnCardEntry',
                                                  isEqualTo:
                                                      listOfLearnCardEntriesItem
                                                          .reference.id,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<LearnCardEntryCommentsRecord>
                                        listViewLearnCardEntryCommentsRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewLearnCardEntryCommentsRecordList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewLearnCardEntryCommentsRecord =
                                            listViewLearnCardEntryCommentsRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  if (valueOrDefault<bool>(
                                                    listOfLearnCardEntriesItem
                                                            .private !=
                                                        true,
                                                    false,
                                                  ))
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (valueOrDefault<bool>(
                                                    listOfLearnCardEntriesItem
                                                            .private ==
                                                        true,
                                                    true,
                                                  ))
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.lock_person,
                                                        color:
                                                            Color(0xFFCEBB57),
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.8,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.75,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  listViewLearnCardEntryCommentsRecord
                                                                      .commentedBy,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  listViewLearnCardEntryCommentsRecord
                                                                      .commentDetails,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'relative',
                                                          listViewLearnCardEntryCommentsRecord
                                                              .commentTime!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).animateOnPageLoad(
                    animationsMap['listViewOnPageLoadAnimation']!);
              },
            ),
          );
        },
      ),
    );
  }
}
