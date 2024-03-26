import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'header_container_model.dart';
export 'header_container_model.dart';

class HeaderContainerWidget extends StatefulWidget {
  const HeaderContainerWidget({
    super.key,
    this.action,
    String? title,
    int? currentTier,
    this.companiesDoc,
    this.memberLevels,
    this.sessionsDoc,
  })  : title = title ?? 'Library',
        currentTier = currentTier ?? 0;

  final Future Function()? action;
  final String title;
  final int currentTier;
  final CompaniesRecord? companiesDoc;
  final List<MemberLevelsRecord>? memberLevels;
  final SessionsRecord? sessionsDoc;

  @override
  State<HeaderContainerWidget> createState() => _HeaderContainerWidgetState();
}

class _HeaderContainerWidgetState extends State<HeaderContainerWidget> {
  late HeaderContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderContainerModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<List<Tilesv2Record>>(
          stream: queryTilesv2Record(
            queryBuilder: (tilesv2Record) => tilesv2Record
                .where(
                  'companyDocId',
                  isEqualTo: widget.companiesDoc?.reference.id,
                )
                .orderBy('tile_index'),
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
            List<Tilesv2Record> containerTilesv2RecordList = snapshot.data!;
            return Container(
              constraints: const BoxConstraints(
                maxWidth: 850.0,
              ),
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        maxHeight:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                      ),
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final membeeLevelaFromPassed = widget
                                                    .memberLevels
                                                    ?.where((e) =>
                                                        valueOrDefault<bool>(
                                                          valueOrDefault<bool>(
                                                                (currentUserDocument?.hasaccess.toList() ??
                                                                            [])
                                                                        .contains(e
                                                                            .reference
                                                                            .id) ==
                                                                    false,
                                                                false,
                                                              ) ||
                                                              valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isadmin,
                                                                  false) ||
                                                              (widget.sessionsDoc
                                                                      ?.hasAccess
                                                                      .contains(e
                                                                          .reference
                                                                          .id) ==
                                                                  false) ||
                                                              (FFAppState()
                                                                      .debugCount >=
                                                                  5),
                                                          false,
                                                        ) &&
                                                        (e.companyDocId ==
                                                            widget.companiesDoc
                                                                ?.reference.id))
                                                    .toList()
                                                    .toList() ??
                                                [];
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  membeeLevelaFromPassed.length,
                                              itemBuilder: (context,
                                                  membeeLevelaFromPassedIndex) {
                                                final membeeLevelaFromPassedItem =
                                                    membeeLevelaFromPassed[
                                                        membeeLevelaFromPassedIndex];
                                                return InkWell(
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
                                                        'HEADER_CONTAINER_Column_i8lgm4oj_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .selectedMemberLevel =
                                                          membeeLevelaFromPassedItem
                                                              .reference.id;
                                                      FFAppState()
                                                              .selectedMemberLevelName =
                                                          valueOrDefault<
                                                              String>(
                                                        membeeLevelaFromPassedItem
                                                            .memberLevelName,
                                                        'namenotset',
                                                      );
                                                      FFAppState().leftPane =
                                                          membeeLevelaFromPassedItem
                                                              .leftColumn;
                                                    });
                                                    logFirebaseEvent(
                                                        'Column_haptic_feedback');
                                                    HapticFeedback
                                                        .heavyImpact();
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(5.0),
                                                        child: Container(
                                                          height: 100.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 300.0,
                                                            maxHeight: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.46,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        17.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          17.0),
                                                              child:
                                                                  Image.network(
                                                                membeeLevelaFromPassedItem
                                                                    .shield,
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.75,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.75,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
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
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        StreamBuilder<List<Tilesv2Record>>(
          stream: queryTilesv2Record(
            queryBuilder: (tilesv2Record) => tilesv2Record
                .where(
                  'companyDocId',
                  isEqualTo: widget.companiesDoc?.reference.id,
                )
                .orderBy('tile_index'),
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
            List<Tilesv2Record> containerTilesv2RecordList = snapshot.data!;
            return Container(
              constraints: const BoxConstraints(
                maxWidth: 850.0,
              ),
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder<List<CategoriesRecord>>(
                                      stream: queryCategoriesRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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
                                        List<CategoriesRecord>
                                            containerCatCategoriesRecordList =
                                            snapshot.data!;
                                        return Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            maxHeight: 130.0,
                                          ),
                                          decoration: const BoxDecoration(),
                                        );
                                      },
                                    ),
                                  ],
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
            );
          },
        ),
      ],
    );
  }
}
