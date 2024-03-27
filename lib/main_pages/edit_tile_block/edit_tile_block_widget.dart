import '/add_items/add_document_to_tile/add_document_to_tile_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/testpage/components/add_video_to_existing_tile/add_video_to_existing_tile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_tile_block_model.dart';
export 'edit_tile_block_model.dart';

class EditTileBlockWidget extends StatefulWidget {
  const EditTileBlockWidget({
    super.key,
    this.tiles,
    this.textblock,
    this.textblockref,
    this.tileref,
    this.createdTB,
    this.createdTBdoc,
    this.tileblock,
    this.tileblockref,
  });

  final TilesRecord? tiles;
  final TextblockRecord? textblock;
  final DocumentReference? textblockref;
  final DocumentReference? tileref;
  final DocumentReference? createdTB;
  final TextblockRecord? createdTBdoc;
  final TileblocksRecord? tileblock;
  final DocumentReference? tileblockref;

  @override
  State<EditTileBlockWidget> createState() => _EditTileBlockWidgetState();
}

class _EditTileBlockWidgetState extends State<EditTileBlockWidget>
    with TickerProviderStateMixin {
  late EditTileBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTileBlockModel());

    _model.headertextController ??=
        TextEditingController(text: widget.tileblock?.headertext);
    _model.headertextFocusNode ??= FocusNode();

    _model.paragraphController ??=
        TextEditingController(text: widget.tileblock?.textblock);
    _model.paragraphFocusNode ??= FocusNode();

    _model.tabBarCurrentController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.videoTitleController ??=
        TextEditingController(text: widget.tileblock?.videointext);
    _model.videoTitleFocusNode ??= FocusNode();

    _model.featuredsummaryController ??= TextEditingController();
    _model.featuredsummaryFocusNode ??= FocusNode();

    _model.videoURLController ??= TextEditingController();
    _model.videoURLFocusNode ??= FocusNode();

    _model.positionController1 ??= TextEditingController();
    _model.positionFocusNode1 ??= FocusNode();

    _model.existingNameController1 ??=
        TextEditingController(text: 'The Name Of The Video Exactly As It Is');
    _model.existingNameFocusNode1 ??= FocusNode();

    _model.tabBarController1 = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.bETAdocTitleController ??=
        TextEditingController(text: widget.tileblock?.docintext);
    _model.bETAdocTitleFocusNode ??= FocusNode();

    _model.positionController2 ??= TextEditingController();
    _model.positionFocusNode2 ??= FocusNode();

    _model.docLinkController ??=
        TextEditingController(text: widget.tileblock?.linkintext);
    _model.docLinkFocusNode ??= FocusNode();

    _model.existingNameController2 ??= TextEditingController(text: 'Search...');
    _model.existingNameFocusNode2 ??= FocusNode();

    _model.tabBarController2 = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.linktextController ??=
        TextEditingController(text: widget.tileblock?.buttontextlinktopage);
    _model.linktextFocusNode ??= FocusNode();

    _model.buttonlinkController1 ??=
        TextEditingController(text: widget.tileblock?.linktopage);
    _model.buttonlinkFocusNode1 ??= FocusNode();

    _model.socialfeednameController ??=
        TextEditingController(text: 'Social Feed Name');
    _model.socialfeednameFocusNode ??= FocusNode();

    _model.buttonlinkController2 ??=
        TextEditingController(text: 'Social Feed Summary');
    _model.buttonlinkFocusNode2 ??= FocusNode();

    _model.docTextController ??=
        TextEditingController(text: widget.tileblock?.docintext);
    _model.docTextFocusNode ??= FocusNode();

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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: 220.0,
                              height: 900.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7.0,
                                    color: Color(0x32171717),
                                    offset: Offset(0.0, -4.0),
                                  )
                                ],
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
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 8.0, 3.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 4.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDBE2E7),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      icon: Icon(
                                        Icons.cancel_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'EDIT_TILE_BLOCK_cancel_outlined_ICN_ON_T');
                                        logFirebaseEvent(
                                            'IconButton_bottom_sheet');
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Add Content Blocks',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Outfit'),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      ),
                                    ),
                                    SwitchListTile(
                                      value: _model.headerSwitchValue ??= widget
                                                  .tileblock?.headertext !=
                                              null &&
                                          widget.tileblock?.headertext != '',
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .headerSwitchValue = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_HeaderSwitch_ON_TOGGLE_O');
                                          logFirebaseEvent(
                                              'HeaderSwitch_update_component_state');
                                          setState(() {
                                            _model.addToChoicesselected(
                                                'Header Text');
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_HeaderSwitch_ON_TOGGLE_O');
                                          logFirebaseEvent(
                                              'HeaderSwitch_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Header Text');
                                          });
                                        }
                                      },
                                      title: Text(
                                        'Header Text',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                    SwitchListTile(
                                      value: _model.parawitchValue ??=
                                          widget.tileblock?.textblock != null &&
                                              widget.tileblock?.textblock != '',
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.parawitchValue = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_Parawitch_ON_TOGGLE_ON');
                                          logFirebaseEvent(
                                              'Parawitch_update_component_state');
                                          setState(() {
                                            _model.addToChoicesselected(
                                                'Paragraph');
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_Parawitch_ON_TOGGLE_OFF');
                                          logFirebaseEvent(
                                              'Parawitch_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Paragraph');
                                          });
                                        }
                                      },
                                      title: Text(
                                        'Paragraph',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                    SwitchListTile(
                                      value: _model.buttonSwitchValue ??= widget
                                                  .tileblock
                                                  ?.buttontextlinktopage !=
                                              null &&
                                          widget.tileblock
                                                  ?.buttontextlinktopage !=
                                              '',
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .buttonSwitchValue = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_buttonSwitch_ON_TOGGLE_O');
                                          logFirebaseEvent(
                                              'buttonSwitch_update_component_state');
                                          setState(() {
                                            _model
                                                .addToChoicesselected('Button');
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_buttonSwitch_ON_TOGGLE_O');
                                          logFirebaseEvent(
                                              'buttonSwitch_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Button');
                                          });
                                        }
                                      },
                                      title: Text(
                                        'Button',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                    SwitchListTile(
                                      value: _model.docSwitchValue ??=
                                          widget.tileblock?.docintext != null &&
                                              widget.tileblock?.docintext != '',
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.docSwitchValue = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_DocSwitch_ON_TOGGLE_ON');
                                          logFirebaseEvent(
                                              'DocSwitch_update_component_state');
                                          setState(() {
                                            _model.addToChoicesselected(
                                                'Document');
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_DocSwitch_ON_TOGGLE_OFF');
                                          logFirebaseEvent(
                                              'DocSwitch_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Document');
                                          });
                                        }
                                      },
                                      title: Text(
                                        'Document',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                    SwitchListTile(
                                      value: _model.imageSwitchValue ??= widget
                                                  .tileblock
                                                  ?.buttontextlinktopage !=
                                              null &&
                                          widget.tileblock
                                                  ?.buttontextlinktopage !=
                                              '',
                                      onChanged: (newValue) async {
                                        setState(() => _model.imageSwitchValue =
                                            newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_imageSwitch_ON_TOGGLE_ON');
                                          logFirebaseEvent(
                                              'imageSwitch_update_component_state');
                                          setState(() {
                                            _model
                                                .addToChoicesselected('Image');
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_imageSwitch_ON_TOGGLE_OF');
                                          logFirebaseEvent(
                                              'imageSwitch_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Image');
                                          });
                                        }
                                      },
                                      title: Text(
                                        'Image',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                    SwitchListTile(
                                      value: _model.videoSwitchValue1 ??= widget
                                              .tileblock!
                                              .videolisttitle
                                              .length >
                                          0,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .videoSwitchValue1 = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_videoSwitch_ON_TOGGLE_ON');
                                          logFirebaseEvent(
                                              'videoSwitch_update_component_state');
                                          setState(() {
                                            _model
                                                .addToChoicesselected('Video');
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_videoSwitch_ON_TOGGLE_OF');
                                          logFirebaseEvent(
                                              'videoSwitch_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Video');
                                          });
                                        }
                                      },
                                      title: Text(
                                        'Video',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                    SwitchListTile(
                                      value: _model.videoSwitchValue2 ??= widget
                                                  .tileblock?.tileintiletext !=
                                              null &&
                                          widget.tileblock?.tileintiletext !=
                                              '',
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .videoSwitchValue2 = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_videoSwitch_ON_TOGGLE_ON');
                                          logFirebaseEvent(
                                              'videoSwitch_update_component_state');
                                          setState(() {
                                            _model.addToChoicesselected('Tile');
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_videoSwitch_ON_TOGGLE_OF');
                                          logFirebaseEvent(
                                              'videoSwitch_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Tile');
                                          });
                                        }
                                      },
                                      title: Text(
                                        'Tile',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                    SwitchListTile(
                                      value: _model.socialFeedValue ??= true,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.socialFeedValue = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_SocialFeed_ON_TOGGLE_ON');
                                          logFirebaseEvent(
                                              'SocialFeed_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Social Feed');
                                          });
                                          logFirebaseEvent(
                                              'SocialFeed_backend_call');

                                          await widget.tileblock!.reference
                                              .update(
                                                  createTileblocksRecordData(
                                            hassocialfeed: true,
                                          ));
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_SocialFeed_ON_TOGGLE_OFF');
                                          logFirebaseEvent(
                                              'SocialFeed_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Social Feed');
                                          });
                                          logFirebaseEvent(
                                              'SocialFeed_backend_call');

                                          await widget.tileblock!.reference
                                              .update(
                                                  createTileblocksRecordData(
                                            hassocialfeed: false,
                                          ));
                                        }
                                      },
                                      title: Text(
                                        'Social Feed',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                    SwitchListTile(
                                      value: _model.aISwitchValue ??= false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.aISwitchValue = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_AISwitch_ON_TOGGLE_ON');
                                          logFirebaseEvent(
                                              'AISwitch_backend_call');

                                          await widget.tileblock!.reference
                                              .update(
                                                  createTileblocksRecordData(
                                            isAI: _model.aISwitchValue,
                                          ));
                                        } else {
                                          logFirebaseEvent(
                                              'EDIT_TILE_BLOCK_AISwitch_ON_TOGGLE_OFF');
                                          logFirebaseEvent(
                                              'AISwitch_update_component_state');
                                          setState(() {
                                            _model.removeFromChoicesselected(
                                                'Tile');
                                          });
                                        }
                                      },
                                      title: Text(
                                        'AI (Beta)',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).greenish,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((widget.tileblock?.headertext != null &&
                                    widget.tileblock?.headertext != '') ||
                                _model.choicesselected.contains('Header Text'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Header Text',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 28.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Roboto'),
                                                              ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      icon: Icon(
                                                        Icons.delete_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'EDIT_TILE_BLOCK_delete_outline_ICN_ON_TA');
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await widget.tileblock!
                                                            .reference
                                                            .update(
                                                                createTileblocksRecordData(
                                                          headertext: '',
                                                        ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.headertextController,
                                              focusNode:
                                                  _model.headertextFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.headertextController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  logFirebaseEvent(
                                                      'EDIT_TILE_BLOCK_headertext_ON_TEXTFIELD_');
                                                  logFirebaseEvent(
                                                      'headertext_backend_call');

                                                  await widget
                                                      .tileblock!.reference
                                                      .update(
                                                          createTileblocksRecordData(
                                                    headertext: _model
                                                        .headertextController
                                                        .text,
                                                  ));
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Text Block Content, You can add multiple lines',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .headertextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.tileblock?.textblock != null &&
                                    widget.tileblock?.textblock != '') ||
                                _model.choicesselected.contains('Paragraph'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Paragraph Text',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 28.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Roboto'),
                                                              ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      icon: Icon(
                                                        Icons.delete_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'EDIT_TILE_BLOCK_delete_outline_ICN_ON_TA');
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await widget.tileblock!
                                                            .reference
                                                            .update(
                                                                createTileblocksRecordData(
                                                          textblock: '',
                                                        ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.paragraphController,
                                              focusNode:
                                                  _model.paragraphFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.paragraphController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  logFirebaseEvent(
                                                      'EDIT_TILE_BLOCK_paragraph_ON_TEXTFIELD_C');
                                                  logFirebaseEvent(
                                                      'paragraph_backend_call');

                                                  await widget
                                                      .tileblock!.reference
                                                      .update(
                                                          createTileblocksRecordData(
                                                    textblock: _model
                                                        .paragraphController
                                                        .text,
                                                  ));
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Text Block Content, You can add multiple lines',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .paragraphControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.tileblock?.videointext != null &&
                                    widget.tileblock?.videointext != '') ||
                                _model.choicesselected.contains('Video'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Video',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Roboto'),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 900.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment(0.0, 0),
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
                                                                .bodyMedium,
                                                        unselectedLabelStyle:
                                                            TextStyle(),
                                                        indicatorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        tabs: [
                                                          Tab(
                                                            text: 'Add Video',
                                                          ),
                                                          Tab(
                                                            text:
                                                                'From Existing',
                                                          ),
                                                          Tab(
                                                            text: 'Current',
                                                          ),
                                                        ],
                                                        controller: _model
                                                            .tabBarCurrentController,
                                                        onTap: (i) async {
                                                          [
                                                            () async {},
                                                            () async {},
                                                            () async {}
                                                          ][i]();
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TabBarView(
                                                        controller: _model
                                                            .tabBarCurrentController,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'You can upload a video to the app from here which we will add to the Tile Block for you',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Inter'),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .videoTitleController,
                                                                      focusNode:
                                                                          _model
                                                                              .videoTitleFocusNode,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.videoTitleController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'EDIT_TILE_BLOCK_videoTitle_ON_TEXTFIELD_');
                                                                          logFirebaseEvent(
                                                                              'videoTitle_update_component_state');
                                                                          setState(
                                                                              () {
                                                                            _model.videoOnBlock =
                                                                                false;
                                                                          });
                                                                        },
                                                                      ),
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                      maxLines:
                                                                          null,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .multiline,
                                                                      validator: _model
                                                                          .videoTitleControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .featuredsummaryController,
                                                                      focusNode:
                                                                          _model
                                                                              .featuredsummaryFocusNode,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Summary',
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      maxLines:
                                                                          3,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .multiline,
                                                                      validator: _model
                                                                          .featuredsummaryControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .videoURLController,
                                                                      focusNode:
                                                                          _model
                                                                              .videoURLFocusNode,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Your Cloudinary URL here ',
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .multiline,
                                                                      validator: _model
                                                                          .videoURLControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .positionController1,
                                                                      focusNode:
                                                                          _model
                                                                              .positionFocusNode1,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Video ID Position Number',
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .multiline,
                                                                      validator: _model
                                                                          .positionController1Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .accent2,
                                                                    ),
                                                                    child:
                                                                        Checkbox(
                                                                      value: _model
                                                                              .checkboxValue1 ??=
                                                                          true,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxValue1 =
                                                                                newValue!);
                                                                      },
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Is AI Video',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'EDIT_TILE_BLOCK_COMP_CREATE_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await VideosRecord
                                                                            .collection
                                                                            .doc()
                                                                            .set({
                                                                          ...createVideosRecordData(
                                                                            title:
                                                                                _model.videoTitleController.text,
                                                                            videofromurl:
                                                                                _model.videoURLController.text,
                                                                            videosummary:
                                                                                _model.featuredsummaryController.text,
                                                                            id: valueOrDefault<int>(
                                                                              int.tryParse(_model.positionController1.text),
                                                                              0,
                                                                            ),
                                                                            isai:
                                                                                _model.checkboxValue1,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'tileref': [
                                                                                FFAppState().SelectedTileRef
                                                                              ],
                                                                            },
                                                                          ),
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await widget
                                                                            .tileblock!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'videolisttitle': FieldValue.arrayUnion([
                                                                                _model.videoTitleController.text
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_update_component_state');
                                                                        setState(
                                                                            () {
                                                                          _model.addToVideoselectedtitleLocal(_model
                                                                              .existingNameController1
                                                                              .text);
                                                                        });
                                                                      },
                                                                      text:
                                                                          'Create',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            30.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [],
                                                                  ),
                                                                  FlutterFlowVideoPlayer(
                                                                    path:
                                                                        'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                                                    videoType:
                                                                        VideoType
                                                                            .network,
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
                                                            ),
                                                          ),
                                                          SingleChildScrollView(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'If you would like to use an existing video, either name it below or using the list check the item you want',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          20.0,
                                                                          10.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.existingNameController1,
                                                                        focusNode:
                                                                            _model.existingNameFocusNode1,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.existingNameController1',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            logFirebaseEvent('EDIT_TILE_BLOCK_ExistingName_ON_TEXTFIEL');
                                                                            logFirebaseEvent('ExistingName_update_component_state');
                                                                            setState(() {
                                                                              _model.addToVideoselectedtitleLocal(_model.existingNameController1.text);
                                                                            });
                                                                            logFirebaseEvent('ExistingName_backend_call');

                                                                            await widget.tileblock!.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'videolisttitle': FieldValue.arrayUnion([
                                                                                    _model.existingNameController1.text
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              'Existing',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .existingNameController1Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        VideosRecord>>(
                                                                  stream:
                                                                      queryVideosRecord(
                                                                    queryBuilder:
                                                                        (videosRecord) =>
                                                                            videosRecord.orderBy('title'),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<VideosRecord>
                                                                        listViewVideosRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewVideosRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewVideosRecord =
                                                                            listViewVideosRecordList[listViewIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 3.0,
                                                                                  color: Color(0x32000000),
                                                                                  offset: Offset(0.0, 1.0),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 130.0,
                                                                                      decoration: BoxDecoration(
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 3.0,
                                                                                            color: Color(0x411D2429),
                                                                                            offset: Offset(0.0, 1.0),
                                                                                          )
                                                                                        ],
                                                                                        gradient: LinearGradient(
                                                                                          colors: [
                                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                                            FlutterFlowTheme.of(context).secondary
                                                                                          ],
                                                                                          stops: [0.0, 1.0],
                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            FlutterFlowVideoPlayer(
                                                                                              path: listViewVideosRecord.videofromurl,
                                                                                              videoType: VideoType.network,
                                                                                              autoPlay: false,
                                                                                              looping: true,
                                                                                              showControls: false,
                                                                                              allowFullScreen: true,
                                                                                              allowPlaybackSpeedMenu: false,
                                                                                              lazyLoad: true,
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      listViewVideosRecord.title,
                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: Color(0xFF090F13),
                                                                                                            fontSize: 18.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.standard,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.padded,
                                                                                                      shape: CircleBorder(),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValueMap2[listViewVideosRecord] ??= _model.selectedVideo.contains(listViewVideosRecord.reference),
                                                                                                    onChanged: (newValue) async {
                                                                                                      setState(() => _model.checkboxValueMap2[listViewVideosRecord] = newValue!);
                                                                                                      if (newValue!) {
                                                                                                        logFirebaseEvent('EDIT_TILE_BLOCK_Checkbox_i165t2gw_ON_TOG');
                                                                                                        if (_model.selectedVideo.contains(listViewVideosRecord.reference) == true) {
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.removeFromSelectedVideo(listViewVideosRecord.reference);
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await widget.tileblock!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'videolisttitle': FieldValue.arrayRemove([listViewVideosRecord.title]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await listViewVideosRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'tileref': FieldValue.arrayUnion([FFAppState().SelectedTileRef]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.removeFromVideoselectedtitleLocal(listViewVideosRecord.title);
                                                                                                          });
                                                                                                        } else {
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.addToSelectedVideo(listViewVideosRecord.reference);
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await widget.tileblock!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'videolisttitle': FieldValue.arrayUnion([listViewVideosRecord.title]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await listViewVideosRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'tileref': FieldValue.arrayUnion([FFAppState().SelectedTileRef]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.addToVideoselectedtitleLocal(listViewVideosRecord.title);
                                                                                                          });
                                                                                                        }
                                                                                                      } else {
                                                                                                        logFirebaseEvent('EDIT_TILE_BLOCK_Checkbox_i165t2gw_ON_TOG');
                                                                                                        if (_model.selectedVideo.contains(listViewVideosRecord.reference) == true) {
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.removeFromSelectedVideo(listViewVideosRecord.reference);
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await listViewVideosRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'tileref': FieldValue.arrayRemove([FFAppState().SelectedTileRef]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await widget.tileblock!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'videolisttitle': FieldValue.arrayRemove([listViewVideosRecord.title]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.removeFromVideoselectedtitleLocal(_model.existingNameController1.text);
                                                                                                          });
                                                                                                        } else {
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.addToSelectedVideo(listViewVideosRecord.reference);
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await listViewVideosRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'tileref': FieldValue.arrayRemove([FFAppState().SelectedTileRef]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await widget.tileblock!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'videolisttitle': FieldValue.arrayUnion([_model.videoTitleController.text]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.addToVideoselectedtitleLocal(_model.existingNameController1.text);
                                                                                                          });
                                                                                                        }
                                                                                                      }
                                                                                                    },
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                ),
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
                                                                                                  borderRadius: 30.0,
                                                                                                  borderWidth: 1.0,
                                                                                                  buttonSize: 40.0,
                                                                                                  icon: Icon(
                                                                                                    Icons.edit_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    logFirebaseEvent('EDIT_TILE_BLOCK_edit_rounded_ICN_ON_TAP');
                                                                                                    logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                    await showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      barrierColor: Color(0x00000000),
                                                                                                      enableDrag: false,
                                                                                                      context: context,
                                                                                                      builder: (context) {
                                                                                                        return WebViewAware(
                                                                                                          child: Padding(
                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                            child: AddVideoToExistingTileWidget(
                                                                                                              videos: listViewVideosRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                  },
                                                                                                ),
                                                                                              ],
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
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SingleChildScrollView(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'These are the videos you have on the page',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        VideosRecord>>(
                                                                  stream:
                                                                      queryVideosRecord(
                                                                    queryBuilder:
                                                                        (videosRecord) =>
                                                                            videosRecord.orderBy('title'),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<VideosRecord>
                                                                        listViewVideosRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewVideosRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewVideosRecord =
                                                                            listViewVideosRecordList[listViewIndex];
                                                                        return Visibility(
                                                                          visible:
                                                                              widget.tileblock?.videolisttitle?.contains(listViewVideosRecord.title) == true,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                8.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 3.0,
                                                                                    color: Color(0x32000000),
                                                                                    offset: Offset(0.0, 1.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 130.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: _model.tileselected.contains(listViewVideosRecord.title) == true ? FlutterFlowTheme.of(context).warning : FlutterFlowTheme.of(context).primaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 3.0,
                                                                                              color: Color(0x411D2429),
                                                                                              offset: Offset(0.0, 1.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(8.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              FlutterFlowVideoPlayer(
                                                                                                path: listViewVideosRecord.videofromurl,
                                                                                                videoType: VideoType.network,
                                                                                                autoPlay: false,
                                                                                                looping: true,
                                                                                                showControls: false,
                                                                                                allowFullScreen: true,
                                                                                                allowPlaybackSpeedMenu: false,
                                                                                                lazyLoad: true,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        listViewVideosRecord.title,
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                              fontFamily: 'Outfit',
                                                                                                              color: Color(0xFF090F13),
                                                                                                              fontSize: 18.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                children: [
                                                                                                  Theme(
                                                                                                    data: ThemeData(
                                                                                                      checkboxTheme: CheckboxThemeData(
                                                                                                        shape: CircleBorder(),
                                                                                                      ),
                                                                                                      unselectedWidgetColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    ),
                                                                                                    child: Checkbox(
                                                                                                      value: _model.checkboxValueMap3[listViewVideosRecord] ??= widget.tileblock!.videolisttitle.contains(listViewVideosRecord.title),
                                                                                                      onChanged: (newValue) async {
                                                                                                        setState(() => _model.checkboxValueMap3[listViewVideosRecord] = newValue!);
                                                                                                        if (newValue!) {
                                                                                                          logFirebaseEvent('EDIT_TILE_BLOCK_Checkbox_arb1j2ij_ON_TOG');
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.addToVideoselectedtitleLocal(listViewVideosRecord.title);
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await widget.tileblock!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'videolisttitle': FieldValue.arrayUnion([listViewVideosRecord.title]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await listViewVideosRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'tileref': FieldValue.arrayUnion([FFAppState().SelectedTileRef]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                        } else {
                                                                                                          logFirebaseEvent('EDIT_TILE_BLOCK_Checkbox_arb1j2ij_ON_TOG');
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {
                                                                                                            _model.removeFromVideoselectedtitleLocal(listViewVideosRecord.title);
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_update_app_state');
                                                                                                          setState(() {
                                                                                                            FFAppState().SelectedTileRef = widget.tileref;
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await widget.tileblock!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'videolisttitle': FieldValue.arrayRemove([listViewVideosRecord.title]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await listViewVideosRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'tileref': FieldValue.arrayRemove([FFAppState().SelectedTileRef]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                        }
                                                                                                      },
                                                                                                      activeColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      checkColor: FlutterFlowTheme.of(context).lighterred,
                                                                                                    ),
                                                                                                  ),
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 40.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.edit_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      logFirebaseEvent('EDIT_TILE_BLOCK_edit_rounded_ICN_ON_TAP');
                                                                                                      logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        barrierColor: Color(0x00000000),
                                                                                                        enableDrag: false,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return WebViewAware(
                                                                                                            child: Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: AddVideoToExistingTileWidget(
                                                                                                                videos: listViewVideosRecord,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                ],
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
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.tileblock?.docintext != null &&
                                    widget.tileblock?.docintext != '') ||
                                _model.choicesselected.contains('Document'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'BETA DOCUMENTS',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Roboto'),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedFile != null &&
                                              _model.uploadedFile != '')
                                            Text(
                                              _model.uploadedFile!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          Text(
                                            'Uploading',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 550.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment(0.0, 0),
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
                                                                .bodyMedium,
                                                        unselectedLabelStyle:
                                                            TextStyle(),
                                                        indicatorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        tabs: [
                                                          Tab(
                                                            text:
                                                                'Add Document',
                                                          ),
                                                          Tab(
                                                            text:
                                                                'From Existing',
                                                          ),
                                                        ],
                                                        controller: _model
                                                            .tabBarController1,
                                                        onTap: (i) async {
                                                          [
                                                            () async {},
                                                            () async {}
                                                          ][i]();
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TabBarView(
                                                        controller: _model
                                                            .tabBarController1,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'You can upload a document to the app from here which we will add to the Tile Block for you',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Inter'),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .bETAdocTitleController,
                                                                      focusNode:
                                                                          _model
                                                                              .bETAdocTitleFocusNode,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                      maxLines:
                                                                          null,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .multiline,
                                                                      validator: _model
                                                                          .bETAdocTitleControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .positionController2,
                                                                      focusNode:
                                                                          _model
                                                                              .positionFocusNode2,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'DOC ID Position Number',
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .multiline,
                                                                      validator: _model
                                                                          .positionController2Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: [
                                                                        ChipData(
                                                                            'Upload',
                                                                            Icons.train_outlined),
                                                                        ChipData(
                                                                            'Provide Link')
                                                                      ],
                                                                      onChanged:
                                                                          (val) async {
                                                                        setState(() =>
                                                                            _model.choiceChipsValue =
                                                                                val?.firstOrNull);
                                                                        logFirebaseEvent(
                                                                            'EDIT_TILE_BLOCK_ChoiceChips_d1dqkqi7_ON_');
                                                                        logFirebaseEvent(
                                                                            'ChoiceChips_update_component_state');
                                                                        setState(
                                                                            () {
                                                                          _model.fileProvideType =
                                                                              _model.choiceChipsValue;
                                                                        });
                                                                      },
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Colors.white,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        iconSize:
                                                                            18.0,
                                                                        elevation:
                                                                            4.0,
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: Color(0xFFE3E7ED),
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        iconSize:
                                                                            18.0,
                                                                        elevation:
                                                                            4.0,
                                                                      ),
                                                                      chipSpacing:
                                                                          20.0,
                                                                      rowSpacing:
                                                                          12.0,
                                                                      multiselect:
                                                                          false,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .choiceChipsValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [],
                                                                      ),
                                                                      wrapped:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .choiceChipsValue ==
                                                                      'Provide Link')
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.docLinkController,
                                                                        focusNode:
                                                                            _model.docLinkFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.docLinkController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            logFirebaseEvent('EDIT_TILE_BLOCK_docLink_ON_TEXTFIELD_CHA');
                                                                            logFirebaseEvent('docLink_update_component_state');
                                                                            setState(() {
                                                                              _model.uploadedFile = _model.docLinkController.text;
                                                                            });
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Document Link',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        maxLines:
                                                                            null,
                                                                        keyboardType:
                                                                            TextInputType.multiline,
                                                                        validator: _model
                                                                            .docLinkControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      if (_model
                                                                              .fileProvideType ==
                                                                          'Upload')
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('EDIT_TILE_BLOCK_UPLOAD_THE_FILE_BTN_ON_T');
                                                                            logFirebaseEvent('Button_upload_file_to_firebase');
                                                                            final selectedFiles =
                                                                                await selectFiles(
                                                                              allowedExtensions: [
                                                                                'pdf'
                                                                              ],
                                                                              multiFile: false,
                                                                            );
                                                                            if (selectedFiles !=
                                                                                null) {
                                                                              setState(() => _model.isDataUploading1 = true);
                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                              var downloadUrls = <String>[];
                                                                              try {
                                                                                showUploadMessage(
                                                                                  context,
                                                                                  'Uploading file...',
                                                                                  showLoading: true,
                                                                                );
                                                                                selectedUploadedFiles = selectedFiles
                                                                                    .map((m) => FFUploadedFile(
                                                                                          name: m.storagePath.split('/').last,
                                                                                          bytes: m.bytes,
                                                                                        ))
                                                                                    .toList();

                                                                                downloadUrls = (await Future.wait(
                                                                                  selectedFiles.map(
                                                                                    (f) async => await uploadData(f.storagePath, f.bytes),
                                                                                  ),
                                                                                ))
                                                                                    .where((u) => u != null)
                                                                                    .map((u) => u!)
                                                                                    .toList();
                                                                              } finally {
                                                                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                _model.isDataUploading1 = false;
                                                                              }
                                                                              if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                setState(() {
                                                                                  _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                });
                                                                                showUploadMessage(
                                                                                  context,
                                                                                  'Success!',
                                                                                );
                                                                              } else {
                                                                                setState(() {});
                                                                                showUploadMessage(
                                                                                  context,
                                                                                  'Failed to upload file',
                                                                                );
                                                                                return;
                                                                              }
                                                                            }
                                                                          },
                                                                          text:
                                                                              'Upload the file',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                150.0,
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'EDIT_TILE_BLOCK_ADD_THE_DOCUMENT_TO_THE_');
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        var documentsRecordReference = DocumentsRecord
                                                                            .collection
                                                                            .doc();
                                                                        await documentsRecordReference
                                                                            .set({
                                                                          ...createDocumentsRecordData(
                                                                            id: valueOrDefault<int>(
                                                                              int.tryParse(_model.positionController2.text),
                                                                              0,
                                                                            ),
                                                                            documenttitle:
                                                                                _model.bETAdocTitleController.text,
                                                                            documentupload:
                                                                                _model.uploadedFileUrl1,
                                                                            documenturl:
                                                                                _model.docLinkController.text,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'tiles': [
                                                                                FFAppState().SelectedTileRef?.id
                                                                              ],
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.docCreated =
                                                                            DocumentsRecord.getDocumentFromData({
                                                                          ...createDocumentsRecordData(
                                                                            id: valueOrDefault<int>(
                                                                              int.tryParse(_model.positionController2.text),
                                                                              0,
                                                                            ),
                                                                            documenttitle:
                                                                                _model.bETAdocTitleController.text,
                                                                            documentupload:
                                                                                _model.uploadedFileUrl1,
                                                                            documenturl:
                                                                                _model.docLinkController.text,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'tiles': [
                                                                                FFAppState().SelectedTileRef?.id
                                                                              ],
                                                                            },
                                                                          ),
                                                                        }, documentsRecordReference);
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await widget
                                                                            .tileblock!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'doclistitle': FieldValue.arrayUnion([
                                                                                _model.bETAdocTitleController.text
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await _model
                                                                            .docCreated!
                                                                            .reference
                                                                            .update({
                                                                          ...createDocumentsRecordData(
                                                                            documentupload:
                                                                                _model.uploadedFileUrl1,
                                                                            lastupdated:
                                                                                getCurrentTimestamp,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'tileref': FieldValue.arrayUnion([
                                                                                FFAppState().SelectedTileRef
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Document Created',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Add the Document to the Block',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            250.0,
                                                                        height:
                                                                            30.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SingleChildScrollView(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'If you would like to use an existing Document, either name it below or using the list check the item you want',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          20.0,
                                                                          10.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.existingNameController2,
                                                                        focusNode:
                                                                            _model.existingNameFocusNode2,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.existingNameController2',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            logFirebaseEvent('EDIT_TILE_BLOCK_ExistingName_ON_TEXTFIEL');
                                                                            logFirebaseEvent('ExistingName_update_component_state');
                                                                            setState(() {
                                                                              _model.addToVideoselectedtitleLocal(_model.existingNameController2.text);
                                                                            });
                                                                            logFirebaseEvent('ExistingName_backend_call');

                                                                            await widget.tileblock!.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'videolisttitle': FieldValue.arrayUnion([
                                                                                    _model.existingNameController2.text
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            logFirebaseEvent('ExistingName_update_component_state');
                                                                            setState(() {
                                                                              _model.searchString = _model.existingNameController1.text;
                                                                            });
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              'Existing',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .existingNameController2Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        DocumentsRecord>>(
                                                                  stream:
                                                                      queryDocumentsRecord(
                                                                    queryBuilder:
                                                                        (documentsRecord) =>
                                                                            documentsRecord.orderBy('documenttitle'),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<DocumentsRecord>
                                                                        listViewDocumentsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewDocumentsRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewDocumentsRecord =
                                                                            listViewDocumentsRecordList[listViewIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 3.0,
                                                                                  color: Color(0x32000000),
                                                                                  offset: Offset(0.0, 1.0),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('EDIT_TILE_BLOCK_COMP_tile_ON_TAP');
                                                                                        if (_model.selectedDoc.contains(listViewDocumentsRecord.reference) == true) {
                                                                                          logFirebaseEvent('tile_update_component_state');
                                                                                          setState(() {
                                                                                            _model.addToSelectedDoc(listViewDocumentsRecord.reference);
                                                                                          });
                                                                                        } else {
                                                                                          logFirebaseEvent('tile_update_component_state');
                                                                                          setState(() {
                                                                                            _model.removeFromSelectedDoc(listViewDocumentsRecord.reference);
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 130.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: _model.selectedDoc.contains(listViewDocumentsRecord.reference) == true ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 3.0,
                                                                                              color: Color(0x411D2429),
                                                                                              offset: Offset(0.0, 1.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(8.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        listViewDocumentsRecord.documenttitle,
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                              fontFamily: 'Outfit',
                                                                                                              color: Color(0xFF090F13),
                                                                                                              fontSize: 18.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                children: [
                                                                                                  Theme(
                                                                                                    data: ThemeData(
                                                                                                      checkboxTheme: CheckboxThemeData(
                                                                                                        shape: CircleBorder(),
                                                                                                      ),
                                                                                                      unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                    ),
                                                                                                    child: Checkbox(
                                                                                                      value: _model.checkboxValueMap4[listViewDocumentsRecord] ??= widget.tileblock!.doclistitle.contains(listViewDocumentsRecord.documenttitle),
                                                                                                      onChanged: (newValue) async {
                                                                                                        setState(() => _model.checkboxValueMap4[listViewDocumentsRecord] = newValue!);
                                                                                                        if (newValue!) {
                                                                                                          logFirebaseEvent('EDIT_TILE_BLOCK_Checkbox_4btq6ua2_ON_TOG');
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {});
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await widget.tileblock!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'doclistitle': FieldValue.arrayUnion([
                                                                                                                  listViewDocumentsRecord.documenttitle
                                                                                                                ]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await listViewDocumentsRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'tileref': FieldValue.arrayUnion([FFAppState().SelectedTileRef]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                        } else {
                                                                                                          logFirebaseEvent('EDIT_TILE_BLOCK_Checkbox_4btq6ua2_ON_TOG');
                                                                                                          logFirebaseEvent('Checkbox_update_component_state');
                                                                                                          setState(() {});
                                                                                                          logFirebaseEvent('Checkbox_backend_call');

                                                                                                          await widget.tileblock!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'doclistitle': FieldValue.arrayRemove([
                                                                                                                  listViewDocumentsRecord.documenttitle
                                                                                                                ]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                        }
                                                                                                      },
                                                                                                      activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                      checkColor: FlutterFlowTheme.of(context).lighterred,
                                                                                                    ),
                                                                                                  ),
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 40.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.edit_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      logFirebaseEvent('EDIT_TILE_BLOCK_edit_rounded_ICN_ON_TAP');
                                                                                                      logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        barrierColor: Color(0x00000000),
                                                                                                        enableDrag: false,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return WebViewAware(
                                                                                                            child: Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: AddDocumentToTileWidget(),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
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
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.tileblock?.tileintiletext != null &&
                                    widget.tileblock?.tileintiletext != '') ||
                                _model.choicesselected.contains('Tile'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'ADD TILES TO PAGE',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Roboto'),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 500.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment(0.0, 0),
                                                      child: TabBar(
                                                        isScrollable: true,
                                                        labelColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        unselectedLabelStyle:
                                                            TextStyle(),
                                                        indicatorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        tabs: [
                                                          Tab(
                                                            text:
                                                                'From Existing',
                                                          ),
                                                        ],
                                                        controller: _model
                                                            .tabBarController2,
                                                        onTap: (i) async {
                                                          [() async {}][i]();
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TabBarView(
                                                        controller: _model
                                                            .tabBarController2,
                                                        children: [
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                PagedListView<
                                                                    DocumentSnapshot<
                                                                        Object?>?,
                                                                    TilesRecord>(
                                                                  pagingController:
                                                                      _model
                                                                          .setListViewController4(
                                                                    TilesRecord
                                                                        .collection
                                                                        .orderBy(
                                                                            'title'),
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  reverse:
                                                                      false,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  builderDelegate:
                                                                      PagedChildBuilderDelegate<
                                                                          TilesRecord>(
                                                                    // Customize what your widget looks like when it's loading the first page.
                                                                    firstPageProgressIndicatorBuilder:
                                                                        (_) =>
                                                                            Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // Customize what your widget looks like when it's loading another page.
                                                                    newPageProgressIndicatorBuilder:
                                                                        (_) =>
                                                                            Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    itemBuilder:
                                                                        (context,
                                                                            _,
                                                                            listViewIndex) {
                                                                      final listViewTilesRecord = _model
                                                                          .listViewPagingController4!
                                                                          .itemList![listViewIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            8.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('EDIT_TILE_BLOCK_Container_0tcknvl5_ON_TA');
                                                                            if (widget.tileblock!.tileWithinTileRef.contains(listViewTilesRecord.reference)) {
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await widget.tileblockref!.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'tiles': FieldValue.arrayRemove([
                                                                                      listViewTilesRecord.title
                                                                                    ]),
                                                                                    'tileWithinTileRef': FieldValue.arrayRemove([
                                                                                      listViewTilesRecord.reference
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              logFirebaseEvent('Container_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: Text('Removed: ${listViewTilesRecord.reference.id}from: ${widget.tileblock?.reference.id}'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              logFirebaseEvent('Container_backend_call');

                                                                              await widget.tileblockref!.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'tiles': FieldValue.arrayUnion([
                                                                                      listViewTilesRecord.title
                                                                                    ]),
                                                                                    'tileWithinTileRef': FieldValue.arrayUnion([
                                                                                      listViewTilesRecord.reference
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              logFirebaseEvent('Container_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: Text('Added: ${listViewTilesRecord.reference.id}to: ${widget.tileblock?.reference.id}'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            }

                                                                            if (_model.selectedTile.contains(listViewTilesRecord.reference) ==
                                                                                true) {
                                                                              logFirebaseEvent('Container_update_component_state');
                                                                              setState(() {
                                                                                _model.addToSelectedTile(listViewTilesRecord.reference);
                                                                              });
                                                                            } else {
                                                                              logFirebaseEvent('Container_update_component_state');
                                                                              setState(() {
                                                                                _model.removeFromSelectedTile(listViewTilesRecord.reference);
                                                                              });
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: widget.tileblock?.tileWithinTileRef?.contains(listViewTilesRecord.reference) == true ? FlutterFlowTheme.of(context).warning : FlutterFlowTheme.of(context).tertiary,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 3.0,
                                                                                  color: Color(0x32000000),
                                                                                  offset: Offset(0.0, 1.0),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 130.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: widget.tileblock?.tileWithinTileRef?.contains(listViewTilesRecord.reference) == true ? FlutterFlowTheme.of(context).warning : FlutterFlowTheme.of(context).tertiary,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 3.0,
                                                                                            color: Color(0x411D2429),
                                                                                            offset: Offset(0.0, 1.0),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      listViewTilesRecord.title,
                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: Color(0xFF090F13),
                                                                                                            fontSize: 18.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                              AuthUserStreamWidget(
                                                                                                builder: (context) => Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('EDIT_TILE_BLOCK_Icon_1vvbsj7g_ON_TAP');
                                                                                                        logFirebaseEvent('Icon_backend_call');

                                                                                                        await widget.tileblock!.reference.update({
                                                                                                          ...mapToFirestore(
                                                                                                            {
                                                                                                              'tileWithinTileRef': FieldValue.arrayRemove([listViewTilesRecord.reference]),
                                                                                                            },
                                                                                                          ),
                                                                                                        });
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.cancel_outlined,
                                                                                                        color: Colors.black,
                                                                                                        size: 34.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 30.0,
                                                                                                      borderWidth: 1.0,
                                                                                                      buttonSize: 40.0,
                                                                                                      icon: Icon(
                                                                                                        Icons.edit_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        logFirebaseEvent('EDIT_TILE_BLOCK_edit_rounded_ICN_ON_TAP');
                                                                                                        logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          barrierColor: Color(0x00000000),
                                                                                                          enableDrag: false,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return WebViewAware(
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: AddDocumentToTileWidget(),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
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
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.tileblock?.buttontextlinktopage !=
                                        null &&
                                    widget.tileblock?.buttontextlinktopage !=
                                        '') ||
                                _model.choicesselected.contains('Button'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Button Link External',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Roboto'),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    'You can add a button, either to an external link make sure you add https:// or if you would like an existing page just use the page name block below.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Inter'),
                                                        ),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.linktextController,
                                              focusNode:
                                                  _model.linktextFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.linktextController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  logFirebaseEvent(
                                                      'EDIT_TILE_BLOCK_linktext_ON_TEXTFIELD_CH');
                                                  logFirebaseEvent(
                                                      'linktext_backend_call');

                                                  await widget
                                                      .tileblock!.reference
                                                      .update(
                                                          createTileblocksRecordData(
                                                    buttontextlinktopage: _model
                                                        .linktextController
                                                        .text,
                                                  ));
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Button Link Text',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .linktextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.buttonlinkController1,
                                              focusNode:
                                                  _model.buttonlinkFocusNode1,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.buttonlinkController1',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  logFirebaseEvent(
                                                      'EDIT_TILE_BLOCK_buttonlink_ON_TEXTFIELD_');
                                                  logFirebaseEvent(
                                                      'buttonlink_backend_call');

                                                  await widget
                                                      .tileblock!.reference
                                                      .update(
                                                          createTileblocksRecordData(
                                                    linktopage: _model
                                                        .buttonlinkController1
                                                        .text,
                                                  ));
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'https://',
                                                hintText:
                                                    'Link to another page External',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .buttonlinkController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.tileblock?.hassocialfeed == true) ||
                                _model.choicesselected.contains('Social Feed'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Social Feed',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Roboto'),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    'If you wish to have a community discussion  social feed on your tile block, you can add it here. ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Inter'),
                                                        ),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .socialfeednameController,
                                              focusNode: _model
                                                  .socialfeednameFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Button Link Text',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .socialfeednameControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.buttonlinkController2,
                                              focusNode:
                                                  _model.buttonlinkFocusNode2,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'https://',
                                                hintText:
                                                    'Link to another page External',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              maxLines: 5,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .buttonlinkController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'EDIT_TILE_BLOCK_COMP_CREATE_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var socialfeedRecordReference =
                                                  SocialfeedRecord.collection
                                                      .doc();
                                              await socialfeedRecordReference
                                                  .set(
                                                      createSocialfeedRecordData(
                                                category: '',
                                                name: _model
                                                    .socialfeednameController
                                                    .text,
                                                summary: _model
                                                    .buttonlinkController2.text,
                                                linkedtile: FFAppState()
                                                    .SelectedTileRef,
                                              ));
                                              _model.createdSocialFeed =
                                                  SocialfeedRecord.getDocumentFromData(
                                                      createSocialfeedRecordData(
                                                        category: '',
                                                        name: _model
                                                            .socialfeednameController
                                                            .text,
                                                        summary: _model
                                                            .buttonlinkController2
                                                            .text,
                                                        linkedtile: FFAppState()
                                                            .SelectedTileRef,
                                                      ),
                                                      socialfeedRecordReference);
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await _model.createdSocialFeed!
                                                  .socialfeedref!
                                                  .update(
                                                      createSocialfeedRecordData(
                                                socialfeedref: _model
                                                    .createdSocialFeed
                                                    ?.reference,
                                              ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await widget.tileblock!.reference
                                                  .update(
                                                      createTileblocksRecordData(
                                                hassocialfeed: true,
                                              ));
                                              logFirebaseEvent(
                                                  'Button_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: Text(
                                                          'Social Feed Created'),
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

                                              setState(() {});
                                            },
                                            text: 'Create',
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.tileblock?.docintext != null &&
                                    widget.tileblock?.docintext != '') ||
                                _model.choicesselected.contains('Document'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'A Document',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Roboto'),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    'To add a document simply put the name of the existing document here  (It Must Match)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Inter'),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.docTextController,
                                              focusNode:
                                                  _model.docTextFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.docTextController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  logFirebaseEvent(
                                                      'EDIT_TILE_BLOCK_docText_ON_TEXTFIELD_CHA');
                                                  logFirebaseEvent(
                                                      'docText_backend_call');

                                                  await widget
                                                      .tileblock!.reference
                                                      .update(
                                                          createTileblocksRecordData(
                                                    docintext: _model
                                                        .docTextController.text,
                                                  ));
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Document Name',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              style:
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
                                                                .grayIcon,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .docTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.tileblock?.image != null &&
                                    widget.tileblock?.image != '') ||
                                _model.choicesselected.contains('Image'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
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
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFEFF7F5),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                10.0, 10.0),
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
                                                            'EDIT_TILE_BLOCK_Text_o0a76165_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Text_clear_uploaded_data');
                                                        setState(() {
                                                          _model.isDataUploading2 =
                                                              false;
                                                          _model.uploadedLocalFile2 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
                                                          _model.uploadedFileUrl2 =
                                                              '';
                                                        });
                                                      },
                                                      child: Text(
                                                        'Clear',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
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
                                                              'EDIT_TILE_BLOCK_Text_f0s49mcb_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_upload_media_to_firebase');
                                                          final selectedMedia =
                                                              await selectMediaWithSourceBottomSheet(
                                                            context: context,
                                                            allowPhoto: true,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            setState(() => _model
                                                                    .isDataUploading2 =
                                                                true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading2 =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              setState(() {
                                                                _model.uploadedLocalFile2 =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl2 =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                            } else {
                                                              setState(() {});
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        child: Text(
                                                          'AddImage',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
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
                                                              'EDIT_TILE_BLOCK_Text_wsqeough_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_backend_call');

                                                          await widget
                                                              .tileblock!
                                                              .reference
                                                              .update(
                                                                  createTileblocksRecordData(
                                                            image: _model
                                                                .uploadedFileUrl2,
                                                          ));
                                                        },
                                                        child: Text(
                                                          'Save',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (widget.tileblock
                                                                ?.image ==
                                                            null ||
                                                        widget.tileblock
                                                                ?.image ==
                                                            '')
                                                      InkWell(
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
                                                              'EDIT_TILE_BLOCK_Imagejustuploaded_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Imagejustuploaded_update_component_state');
                                                          setState(() {
                                                            _model.showimageupload =
                                                                true;
                                                          });
                                                        },
                                                        child: Image.network(
                                                          _model
                                                              .uploadedFileUrl2,
                                                          width:
                                                              double.infinity,
                                                          height: 400.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    if (widget.tileblock
                                                                ?.image !=
                                                            null &&
                                                        widget.tileblock
                                                                ?.image !=
                                                            '')
                                                      InkWell(
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
                                                              'EDIT_TILE_BLOCK_Imagejustuploaded_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Imagejustuploaded_update_component_state');
                                                          setState(() {
                                                            _model.showimageupload =
                                                                true;
                                                          });
                                                        },
                                                        child: Image.network(
                                                          widget
                                                              .tileblock!.image,
                                                          width:
                                                              double.infinity,
                                                          height: 400.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
