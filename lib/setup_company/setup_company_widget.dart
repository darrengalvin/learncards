import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'setup_company_model.dart';
export 'setup_company_model.dart';

class SetupCompanyWidget extends StatefulWidget {
  const SetupCompanyWidget({
    super.key,
    required this.companyDoc,
  });

  final CompaniesRecord? companyDoc;

  @override
  State<SetupCompanyWidget> createState() => _SetupCompanyWidgetState();
}

class _SetupCompanyWidgetState extends State<SetupCompanyWidget>
    with TickerProviderStateMixin {
  late SetupCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetupCompanyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'setupCompany'});
    _model.flowiseURLController ??= TextEditingController(
        text:
            'https://nafya-flowise.alikibao.online/api/v1/prediction/bdae9275-a3cd-49db-9278-2b8f0789aca1');
    _model.flowiseURLFocusNode ??= FocusNode();
    _model.flowiseURLFocusNode!.addListener(() => setState(() {}));
    _model.queryNameController ??=
        TextEditingController(text: 'match_journeyforward_embeddings');
    _model.queryNameFocusNode ??= FocusNode();
    _model.queryNameFocusNode!.addListener(() => setState(() {}));
    _model.tableNameController ??= TextEditingController();
    _model.tableNameFocusNode ??= FocusNode();
    _model.tableNameFocusNode!.addListener(() => setState(() {}));
    _model.supabaseProjectURLController ??=
        TextEditingController(text: 'https://efdipbnxemvehcjbxekx.supabase.co');
    _model.supabaseProjectURLFocusNode ??= FocusNode();
    _model.supabaseProjectURLFocusNode!.addListener(() => setState(() {}));
    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.promptController ??= TextEditingController();
    _model.promptFocusNode ??= FocusNode();
    _model.promptFocusNode!.addListener(() => setState(() {}));
    _model.descriptionController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();
    _model.descriptionFocusNode!.addListener(() => setState(() {}));
    _model.usergatherdataController ??= TextEditingController();
    _model.usergatherdataFocusNode ??= FocusNode();
    _model.usergatherdataFocusNode!.addListener(() => setState(() {}));
    _model.coachmepromptController ??= TextEditingController();
    _model.coachmepromptFocusNode ??= FocusNode();
    _model.coachmepromptFocusNode!.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'setupCompany',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    title: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            'Set up ${valueOrDefault<String>(
                              widget.companyDoc?.companyname,
                              '-',
                            )}',
                            '-',
                          ),
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                        Text(
                          'Please fill in the information below to continue.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                    actions: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 12.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'SETUP_COMPANY_close_rounded_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.safePop();
                          },
                        ),
                      ),
                    ],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 770.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Company Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              StreamBuilder<
                                                  List<Tilesv2Record>>(
                                                stream: queryTilesv2Record(
                                                  queryBuilder:
                                                      (tilesv2Record) =>
                                                          tilesv2Record
                                                              .where(
                                                                'companyDocId',
                                                                isEqualTo: widget
                                                                    .companyDoc
                                                                    ?.companyDocId,
                                                              )
                                                              .where(
                                                                'tile_tier',
                                                                isEqualTo: 1,
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
                                                  List<Tilesv2Record>
                                                      listViewTilesv2RecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewTilesv2RecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewTilesv2Record =
                                                          listViewTilesv2RecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xB2FAFAFA),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            border: Border.all(
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      listViewTilesv2Record.image !=
                                                                              null &&
                                                                          listViewTilesv2Record.image !=
                                                                              '',
                                                                      false,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Opacity(
                                                                              opacity: 0.4,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  listViewTilesv2Record.image,
                                                                                  width: 60.0,
                                                                                  height: 60.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      listViewTilesv2Record.title,
                                                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final activities = listViewTilesv2Record.dailyActivities.toList();
                                                                              return SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(activities.length, (activitiesIndex) {
                                                                                    final activitiesItem = activities[activitiesIndex];
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                activitiesItem,
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 15.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  }),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                child: Container(
                                                                                  width: 40.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowIconButton(
                                                                                        borderColor: FlutterFlowTheme.of(context).primary,
                                                                                        borderRadius: 20.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 40.0,
                                                                                        fillColor: FlutterFlowTheme.of(context).darkSeaGreen,
                                                                                        icon: Icon(
                                                                                          Icons.grade,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('SETUP_COMPANY_PAGE_grade_ICN_ON_TAP');
                                                                                          logFirebaseEvent('IconButton_update_page_state');
                                                                                          setState(() {
                                                                                            _model.showCalendar = !_model.showCalendar;
                                                                                            _model.showCalendarTileId = valueOrDefault<String>(
                                                                                              listViewTilesv2Record.reference.id,
                                                                                              '-',
                                                                                            );
                                                                                          });
                                                                                        },
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
                                                                  ],
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    (_model.showCalendar ==
                                                                            true) &&
                                                                        (_model.showCalendarTileId ==
                                                                            listViewTilesv2Record.reference.id),
                                                                    false,
                                                                  ))
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              DatePickerWidget(
                                                                            key:
                                                                                Key('Keyg0t_${listViewIndex}_of_${listViewTilesv2RecordList.length}'),
                                                                            tilev2passed:
                                                                                listViewTilesv2Record,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'SETUP_COMPANY_GET_A_NEW_WEEKLY_TOPIC_BTN');
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    _model.apiResultdkp =
                                                        await CloudFunctionsGroup
                                                            .getTopicsCall
                                                            .call(
                                                      sessionId: FFAppState()
                                                          .nonLoggedInSessionId,
                                                      systemMessagePrompt:
                                                          'As a business that ${widget.companyDoc?.companyAiData?.companySummary}${valueOrDefault<String>(
                                                        widget.companyDoc
                                                            ?.getTilesPrompt,
                                                        '|',
                                                      )}I need a weekly topic to help my users with their business journey, lean on some famous frameworks if it helps. The topic should  have a unique name and have 5 days of activities, these activities are delivered via by my interactive ai coach and mentor in an app, so they can either be designed to get immediate responses or for the individual to take an action and then share their actions,The activity should be designed to last only 6-8 minutes, they are bite size.  The 5 days  must have a conclusion, whereby the person who has completed 1-5 activities feels satisfied and complete with a learning outcome that will move them forward. Please return JSON in the following format. Id increment by 1, start at 1 pillarCategory weeklyTopicName dailyActivity (list of 1-5 days of activities)  just the activity name a showAdminDate which is always today. And reasonForTopic, a short paragraph explaining why you have chosen this topic for the user, if you hold any previous conversations or data then use that for context.  Always Use English UK Locale and Spelling do not use backticks or new line characters, note to AI: This request can be made multiple times so even if you have been asked before please continue to carry out the task',
                                                      flowiseUrl: _model
                                                          .flowiseURLController
                                                          .text,
                                                      companyDocId: widget
                                                          .companyDoc
                                                          ?.reference
                                                          .id,
                                                      tableName: _model
                                                          .tableNameController
                                                          .text,
                                                      queryName: _model
                                                          .queryNameController
                                                          .text,
                                                      supabaseProjUrl: _model
                                                          .supabaseProjectURLController
                                                          .text,
                                                    );
                                                    if ((_model.apiResultdkp
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'Button_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Success '),
                                                              content: Text((_model
                                                                      .apiResultdkp
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'API Failed'),
                                                              content: Text((_model
                                                                      .apiResultdkp
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  text:
                                                      'Get a new Weekly Topic',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 48.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallFamily),
                                                            ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'Prompts',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        Divider(
                                          height: 2.0,
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Divider(
                                          height: 2.0,
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Text(
                                          'Ap Information',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Text(
                                          'Company Email',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        Text(
                                          'This weeks topic',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        Text(
                                          'Flowise URL',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.flowiseURLController,
                                          focusNode: _model.flowiseURLFocusNode,
                                          autofocus: true,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Url',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            errorStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 12.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor: (_model
                                                        .flowiseURLFocusNode
                                                        ?.hasFocus ??
                                                    false)
                                                ? FlutterFlowTheme.of(context)
                                                    .accent1
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .flowiseURLControllerValidator
                                              .asValidator(context),
                                        ),
                                        Text(
                                          'QueryName',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.queryNameController,
                                          focusNode: _model.queryNameFocusNode,
                                          autofocus: true,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Query Name',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            errorStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 12.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor: (_model
                                                        .queryNameFocusNode
                                                        ?.hasFocus ??
                                                    false)
                                                ? FlutterFlowTheme.of(context)
                                                    .accent1
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .queryNameControllerValidator
                                              .asValidator(context),
                                        ),
                                        Text(
                                          'Table name',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.tableNameController,
                                          focusNode: _model.tableNameFocusNode,
                                          autofocus: true,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'journeyforward_embeddings',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            errorStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 12.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor: (_model
                                                        .tableNameFocusNode
                                                        ?.hasFocus ??
                                                    false)
                                                ? FlutterFlowTheme.of(context)
                                                    .accent1
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .tableNameControllerValidator
                                              .asValidator(context),
                                        ),
                                        Text(
                                          'Supabase Project URL',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        TextFormField(
                                          controller: _model
                                              .supabaseProjectURLController,
                                          focusNode: _model
                                              .supabaseProjectURLFocusNode,
                                          onFieldSubmitted: (_) async {
                                            logFirebaseEvent(
                                                'SETUP_COMPANY_supabaseProjectURL_ON_TEXT');
                                            logFirebaseEvent(
                                                'supabaseProjectURL_navigate_to');

                                            context.pushNamed(
                                              'setupCompany',
                                              queryParameters: {
                                                'companyDoc': serializeParam(
                                                  widget.companyDoc,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'companyDoc': widget.companyDoc,
                                              },
                                            );
                                          },
                                          autofocus: true,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Superbase Project URL',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            errorStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 12.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                (_model.supabaseProjectURLFocusNode
                                                            ?.hasFocus ??
                                                        false)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .accent1
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .supabaseProjectURLControllerValidator
                                              .asValidator(context),
                                        ),
                                        Text(
                                          'Prompts',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                fontSize: 16.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                        ),
                                        Container(
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment(-1.0, 0),
                                                child: TabBar(
                                                  isScrollable: true,
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  unselectedLabelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium,
                                                  unselectedLabelStyle:
                                                      TextStyle(),
                                                  indicatorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  padding: EdgeInsets.all(4.0),
                                                  tabs: [
                                                    Tab(
                                                      text: 'Welcome Message',
                                                    ),
                                                    Tab(
                                                      text: 'Welcome prompt',
                                                    ),
                                                    Tab(
                                                      text: 'User gather data ',
                                                    ),
                                                    Tab(
                                                      text: 'Coach',
                                                    ),
                                                  ],
                                                  controller:
                                                      _model.tabBarController,
                                                  onTap: (i) async {
                                                    [
                                                      () async {},
                                                      () async {},
                                                      () async {},
                                                      () async {}
                                                    ][i]();
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  controller:
                                                      _model.tabBarController,
                                                  children: [
                                                    TextFormField(
                                                      controller: _model
                                                          .promptController,
                                                      focusNode: _model
                                                          .promptFocusNode,
                                                      autofocus: true,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Welcome Message',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                        alignLabelWithHint:
                                                            true,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: (_model
                                                                    .promptFocusNode
                                                                    ?.hasFocus ??
                                                                false)
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                      maxLines: 9,
                                                      minLines: 8,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .promptControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .descriptionController,
                                                      focusNode: _model
                                                          .descriptionFocusNode,
                                                      autofocus: true,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Welcome Prompt',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                        alignLabelWithHint:
                                                            true,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: (_model
                                                                    .descriptionFocusNode
                                                                    ?.hasFocus ??
                                                                false)
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                      maxLines: 9,
                                                      minLines: 8,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .descriptionControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .usergatherdataController,
                                                      focusNode: _model
                                                          .usergatherdataFocusNode,
                                                      autofocus: true,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'User Gather data.',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                        alignLabelWithHint:
                                                            true,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: (_model
                                                                    .usergatherdataFocusNode
                                                                    ?.hasFocus ??
                                                                false)
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                      maxLines: 9,
                                                      minLines: 8,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .usergatherdataControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .coachmepromptController,
                                                      focusNode: _model
                                                          .coachmepromptFocusNode,
                                                      autofocus: true,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Coach Me Prompt',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                        alignLabelWithHint:
                                                            true,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: (_model
                                                                    .coachmepromptFocusNode
                                                                    ?.hasFocus ??
                                                                false)
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                      maxLines: 15,
                                                      minLines: 8,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .coachmepromptControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ]
                                          .divide(SizedBox(height: 12.0))
                                          .addToEnd(SizedBox(height: 32.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 770.0,
                        ),
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
