import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'api_stream_chats_model.dart';
export 'api_stream_chats_model.dart';

class ApiStreamChatsWidget extends StatefulWidget {
  const ApiStreamChatsWidget({super.key});

  @override
  State<ApiStreamChatsWidget> createState() => _ApiStreamChatsWidgetState();
}

class _ApiStreamChatsWidgetState extends State<ApiStreamChatsWidget> {
  late ApiStreamChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApiStreamChatsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'apiStreamChats'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('API_STREAM_CHATS_apiStreamChats_ON_INIT_');
      logFirebaseEvent('apiStreamChats_custom_action');
      _model.jsonOutput2 = await actions.convertListToJson(
        FFAppState().chatHistory.toList(),
      );
      logFirebaseEvent('apiStreamChats_custom_action');
      await actions.streamApiResponse(
        _model.jsonOutput2!.toList(),
        () async {
          logFirebaseEvent('_update_app_state');
          setState(() {});
          logFirebaseEvent('_scroll_to');
          await _model.listViewController?.animateTo(
            _model.listViewController!.position.maxScrollExtent,
            duration: Duration(milliseconds: 100),
            curve: Curves.ease,
          );
        },
      );
      logFirebaseEvent('apiStreamChats_scroll_to');
      await _model.listViewController?.animateTo(
        _model.listViewController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.askTheQuestionController ??= TextEditingController();
    _model.askTheQuestionFocusNode ??= FocusNode();

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
        title: 'apiStreamChats',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'API_STREAM_CHATS_arrow_back_rounded_ICN_');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      'Page Title',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Colors.white,
                                fontSize: 22.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 2.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                controller: _model.columnController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        FFAppState().aggregatedResponse,
                        'aggregated response not set',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Container(
                      width: 400.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'API_STREAM_CHATS_PAGE_CLEAR_BTN_ON_TAP');
                              logFirebaseEvent('Button_update_app_state');
                              setState(() {
                                FFAppState().chatMessageStringsTest = [];
                              });
                            },
                            text: 'clear',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'API_STREAM_CHATS_PAGE_ADD_BTN_ON_TAP');
                              logFirebaseEvent('Button_update_app_state');
                              setState(() {
                                FFAppState().addToChatMessageStringsTest(
                                    'TEST ITEM ADDED');
                              });
                            },
                            text: 'add',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).warning,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 400.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Builder(
                        builder: (context) {
                          final listOfStrings =
                              FFAppState().chatMessageStringsTest.toList();
                          if (listOfStrings.isEmpty) {
                            return Image.asset(
                              'assets/images/learning.webp',
                            );
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(listOfStrings.length,
                                (listOfStringsIndex) {
                              final listOfStringsItem =
                                  listOfStrings[listOfStringsIndex];
                              return Text(
                                listOfStringsIndex.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 18.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final listOfStrings = FFAppState()
                            .chatHistory
                            .map((e) => e.content)
                            .toList();
                        if (listOfStrings.isEmpty) {
                          return Image.asset(
                            'assets/images/learning.webp',
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(listOfStrings.length,
                              (listOfStringsIndex) {
                            final listOfStringsItem =
                                listOfStrings[listOfStringsIndex];
                            return Text(
                              valueOrDefault<String>(
                                listOfStringsItem,
                                'nodefault',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            );
                          }),
                        );
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 500.0,
                            height: 700.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final chatHistory =
                                    FFAppState().chatHistory.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: chatHistory.length,
                                  itemBuilder: (context, chatHistoryIndex) {
                                    final chatHistoryItem =
                                        chatHistory[chatHistoryIndex];
                                    return Builder(
                                      builder: (context) {
                                        if (chatHistoryItem.role == 'user') {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(17.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/985/600',
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    chatHistoryItem.content,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(17.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/299/600',
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            '${chatHistoryItem.role}: ${chatHistoryItem.content}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              chatHistoryItem
                                                                  .content,
                                                              'content not ready',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  controller: _model.listViewController,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 8.0),
                                  child: TextFormField(
                                    controller: _model.askTheQuestionController,
                                    focusNode: _model.askTheQuestionFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Respond Here',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            fontSize: 18.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF464646),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 0.0, 0.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 18.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    validator: _model
                                        .askTheQuestionControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 5.0,
                                borderWidth: 1.0,
                                buttonSize: 55.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                icon: Icon(
                                  Icons.send_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'API_STREAM_CHATS_send_sharp_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  setState(() {
                                    FFAppState()
                                        .addToChatHistory(ChatResponseStruct(
                                      content:
                                          _model.askTheQuestionController.text,
                                      role: 'user',
                                    ));
                                  });
                                  logFirebaseEvent(
                                      'IconButton_reset_form_fields');
                                  setState(() {
                                    _model.askTheQuestionController?.clear();
                                  });
                                  logFirebaseEvent('IconButton_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFAppState()
                                            .chatHistory
                                            .take(5)
                                            .toList()
                                            .first
                                            .content,
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  logFirebaseEvent('IconButton_custom_action');
                                  _model.jsonOutput =
                                      await actions.convertListToJson(
                                    FFAppState().chatHistory.toList(),
                                  );
                                  logFirebaseEvent('IconButton_custom_action');
                                  await actions.streamApiResponse(
                                    _model.jsonOutput!.toList(),
                                    () async {
                                      logFirebaseEvent('_update_app_state');
                                      setState(() {});
                                      logFirebaseEvent('_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            FFAppState()
                                                .chatHistory
                                                .first
                                                .content,
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor3,
                                        ),
                                      );
                                      logFirebaseEvent('_scroll_to');
                                      await _model.listViewController
                                          ?.animateTo(
                                        _model.listViewController!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );
                                    },
                                  );
                                  logFirebaseEvent('IconButton_scroll_to');
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
