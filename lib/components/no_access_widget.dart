import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'no_access_model.dart';
export 'no_access_model.dart';

class NoAccessWidget extends StatefulWidget {
  const NoAccessWidget({super.key});

  @override
  State<NoAccessWidget> createState() => _NoAccessWidgetState();
}

class _NoAccessWidgetState extends State<NoAccessWidget> {
  late NoAccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoAccessModel());

    _model.youEnquiryController ??= TextEditingController(
        text:
            'My name is  ${currentUserDisplayName} and I am interested in learning more about ${FFAppState().selectedcategory}  and to gain access to the members area content please contact me on ');
    _model.youEnquiryFocusNode ??= FocusNode();

    _model.yoMobileController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.mobilenumber, 0).toString());
    _model.yoMobileFocusNode ??= FocusNode();

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

    return Visibility(
      visible: !(currentUserDocument?.hasaccess?.toList() ?? [])
          .contains(FFAppState().selectedcategory),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: AuthUserStreamWidget(
            builder: (context) => Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 1.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: StreamBuilder<List<CategoriesRecord>>(
                  stream: queryCategoriesRecord(
                    queryBuilder: (categoriesRecord) => categoriesRecord.where(
                      'categoryname',
                      isEqualTo: FFAppState().selectedcategory,
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
                    List<CategoriesRecord> listViewCategoriesRecordList =
                        snapshot.data!;
                    final listViewCategoriesRecord =
                        listViewCategoriesRecordList.isNotEmpty
                            ? listViewCategoriesRecordList.first
                            : null;
                    return ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      children: [
                        if (!(currentUserDocument?.hasaccess?.toList() ?? [])
                            .contains(FFAppState().selectedcategory))
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.no_encryption,
                                    color: Color(0xFF7C8791),
                                    size: 90.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (listViewCategoriesRecord
                                              ?.userspendingaccess
                                              ?.contains(
                                                  currentUserReference) ==
                                          false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 10.0),
                                          child: Text(
                                            listViewCategoriesRecord!
                                                .noaccesstitle,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Outfit'),
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if (listViewCategoriesRecord?.userspendingaccess
                                        ?.contains(currentUserReference) ==
                                    false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Text(
                                      listViewCategoriesRecord!.noaccessbody,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                if (listViewCategoriesRecord?.userspendingaccess
                                        ?.contains(currentUserReference) ==
                                    true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 20.0, 10.0),
                                    child: Text(
                                      listViewCategoriesRecord!
                                          .accesspendngmessage,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                if (_model.accessRequested != true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 22.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'NO_ACCESS_HAVE_AN_ACCESS_CODE_BTN_ON_TAP');
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          accessrequested:
                                              FFAppState().selectedcategory,
                                        ));
                                        logFirebaseEvent(
                                            'Button_update_component_state');
                                        setState(() {
                                          _model.accessRequested = true;
                                        });
                                        logFirebaseEvent('Button_backend_call');

                                        await listViewCategoriesRecord!
                                            .reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'userspendingaccess':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      },
                                      text: 'Have an access code',
                                      icon: Icon(
                                        Icons.lock_open_rounded,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 230.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Lexend Deca'),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible: _model.accessRequested == true,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 20.0, 10.0, 0.0),
                                      child: PinCodeTextField(
                                        autoDisposeControllers: false,
                                        appContext: context,
                                        length: 6,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        enableActiveFill: false,
                                        autoFocus: true,
                                        enablePinAutofill: true,
                                        errorTextSpace: 16.0,
                                        showCursor: true,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        obscureText: false,
                                        hintCharacter: '●',
                                        pinTheme: PinTheme(
                                          fieldHeight: 50.0,
                                          fieldWidth: 50.0,
                                          borderWidth: 2.0,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12.0),
                                            bottomRight: Radius.circular(12.0),
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                          ),
                                          shape: PinCodeFieldShape.box,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          selectedColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          activeFillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveFillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          selectedFillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        controller: _model.pinCodeController,
                                        onChanged: (_) {},
                                        onCompleted: (_) async {
                                          logFirebaseEvent(
                                              'NO_ACCESS_PinCode_s5poj1rv_ON_PINCODE_CO');
                                          logFirebaseEvent(
                                              'PinCode_backend_call');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            accessrequested:
                                                FFAppState().selectedcategory,
                                          ));
                                          if (listViewCategoriesRecord
                                                  ?.accesscode ==
                                              _model.pinCodeController!.text) {
                                            logFirebaseEvent(
                                                'PinCode_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Success',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'PinCode_update_component_state');
                                            setState(() {
                                              _model.accessRequested = true;
                                            });
                                            logFirebaseEvent(
                                                'PinCode_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'hasaccess':
                                                      FieldValue.arrayUnion([
                                                    listViewCategoriesRecord
                                                        ?.categoryname
                                                  ]),
                                                },
                                              ),
                                            });
                                          } else {
                                            logFirebaseEvent(
                                                'PinCode_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text(
                                                        'Error - The code does not match'),
                                                    content: Text(
                                                        'Your entries are being logged, incorrect entries may result in your account being suspended and/or deleted, please only try to add the code if you have been given one from an official source.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: _model
                                            .pinCodeControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.tellMeMorePressed != true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 22.0, 0.0, 22.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'NO_ACCESS_COMP_TELL_ME_MORE_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().update(() {
                                          FFAppState().showtellmemore = true;
                                        });
                                        logFirebaseEvent(
                                            'Button_update_component_state');
                                        setState(() {
                                          _model.tellMeMorePressed = true;
                                        });
                                      },
                                      text: 'Tell me more',
                                      icon: Icon(
                                        Icons.perm_device_info,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 190.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Lexend Deca'),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().showtellmemore == true)
                                  Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Visibility(
                                        visible:
                                            FFAppState().showtellmemore == true,
                                        child: Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${FFAppState().selectedcategory} Enquiry',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                                ),
                                                TextFormField(
                                                  controller: _model
                                                      .youEnquiryController,
                                                  focusNode: _model
                                                      .youEnquiryFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        '[Some hint text...]',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  maxLines: null,
                                                  validator: _model
                                                      .youEnquiryControllerValidator
                                                      .asValidator(context),
                                                ),
                                                TextFormField(
                                                  controller:
                                                      _model.yoMobileController,
                                                  focusNode:
                                                      _model.yoMobileFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'Mobile Number',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  maxLines: null,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .yoMobileControllerValidator
                                                      .asValidator(context),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 22.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'NO_ACCESS_COMP_SEND_ENQUIRY_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      await EnquiriesRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createEnquiriesRecordData(
                                                            enquiry: _model
                                                                .youEnquiryController
                                                                .text,
                                                            uid:
                                                                currentUserReference,
                                                            username:
                                                                currentUserDisplayName,
                                                            phonenumber: _model
                                                                .yoMobileController
                                                                .text,
                                                            level: FFAppState()
                                                                .selectedcategory,
                                                            datesent:
                                                                getCurrentTimestamp,
                                                            userpic:
                                                                currentUserPhoto,
                                                          ));
                                                      logFirebaseEvent(
                                                          'Button_update_app_state');
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .showtellmemore =
                                                            false;
                                                      });
                                                    },
                                                    text: 'Send Enquiry',
                                                    icon: Icon(
                                                      Icons.send_to_mobile,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 190.0,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Lexend Deca'),
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
