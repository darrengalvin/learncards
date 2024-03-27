import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_info_model.dart';
export 'page_info_model.dart';

class PageInfoWidget extends StatefulWidget {
  const PageInfoWidget({
    super.key,
    required this.companyDoc,
    required this.sessiondDoc,
  });

  final CompaniesRecord? companyDoc;
  final SessionsRecord? sessiondDoc;

  @override
  State<PageInfoWidget> createState() => _PageInfoWidgetState();
}

class _PageInfoWidgetState extends State<PageInfoWidget> {
  late PageInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageInfoModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
          child: StreamBuilder<List<CategoriesRecord>>(
            stream: queryCategoriesRecord(
              queryBuilder: (categoriesRecord) => categoriesRecord.where(
                'categoryname',
                isEqualTo: valueOrDefault<String>(
                  FFAppState().selectedCategoryName,
                  'Group Journeys',
                ),
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
              List<CategoriesRecord> cardModalBasicCategoriesRecordList =
                  snapshot.data!;
              return Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 570.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color(0xFFE0E3E7),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  cardModalBasicCategoriesRecordList
                                      .first.pageInfo.title,
                                  'title',
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: 30.0,
                            borderWidth: 2.0,
                            buttonSize: 44.0,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PAGE_INFO_COMP_close_rounded_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_bottom_sheet');
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              cardModalBasicCategoriesRecordList
                                  .first.pageInfo.themeIntro,
                              'Description ',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  fontSize: 14.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 24.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      Text(
                        valueOrDefault<String>(
                          cardModalBasicCategoriesRecordList
                              .first.pageInfo.description,
                          'Description ',
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  fontSize: 14.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Text(
                          valueOrDefault<String>(
                            cardModalBasicCategoriesRecordList
                                .first.pageInfo.description,
                            'Description',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                fontSize: 14.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
