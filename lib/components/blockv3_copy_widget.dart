import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/panel_edit_block_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'blockv3_copy_model.dart';
export 'blockv3_copy_model.dart';

class Blockv3CopyWidget extends StatefulWidget {
  const Blockv3CopyWidget({
    super.key,
    required this.tileBlock,
    this.action,
  });

  final TileBlocksRecord? tileBlock;
  final Future Function()? action;

  @override
  State<Blockv3CopyWidget> createState() => _Blockv3CopyWidgetState();
}

class _Blockv3CopyWidgetState extends State<Blockv3CopyWidget> {
  late Blockv3CopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Blockv3CopyModel());

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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent4,
              width: 3.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                constraints: const BoxConstraints(
                  maxWidth: 960.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      _model.showEdit
                          ? FlutterFlowTheme.of(context).customColor7
                          : Colors.transparent,
                      Colors.transparent,
                    ),
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (valueOrDefault<bool>(
                          valueOrDefault<bool>(
                              currentUserDocument?.isadmin, false),
                          false,
                        ) &&
                        responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
                      AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50.0,
                                height: 40.0,
                                decoration: const BoxDecoration(),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'App: ${FFAppState().showEdit.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Component${_model.showEdit.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Container(
                                      width: 300.0,
                                      height: 34.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (valueOrDefault<bool>(
                                            _model.showEdit,
                                            false,
                                          )) {
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                48.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 34.0,
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      hoverIconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'BLOCKV3_COPY_COMP_delete_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        await widget.tileBlock!
                                                            .reference
                                                            .delete();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 34.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      hoverIconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'BLOCKV3_COPY_COMP_close_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_update_component_state');
                                                        setState(() {
                                                          _model.showEdit =
                                                              false;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 34.0,
                                                      icon: Icon(
                                                        Icons.check,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'BLOCKV3_COPY_COMP_check_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_update_component_state');
                                                        setState(() {
                                                          _model.showEdit =
                                                              valueOrDefault<
                                                                  bool>(
                                                            _model.showEdit
                                                                ? false
                                                                : true,
                                                            true,
                                                          );
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                                  .showEdit =
                                                              valueOrDefault<
                                                                  bool>(
                                                            FFAppState()
                                                                    .showEdit
                                                                ? false
                                                                : true,
                                                            true,
                                                          );
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return const Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Visibility(
                                      visible: !_model.showEdit,
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor7,
                                          hoverIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons
                                                .four_g_plus_mobiledata_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'BLOCKV3_COPY_four_g_plus_mobiledata_roun');
                                            logFirebaseEvent(
                                                'IconButton_update_app_state');
                                            _model.updatePage(() {
                                              FFAppState().drawerBlockId =
                                                  widget.tileBlock!.blockId;
                                            });
                                            logFirebaseEvent(
                                                'IconButton_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: const Text('block id is '),
                                                    content: Text(FFAppState()
                                                        .drawerBlockId),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            logFirebaseEvent(
                                                'IconButton_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: const Text('block id is '),
                                                    content: Text(widget
                                                        .tileBlock!.blockName),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
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
                                  ),
                                  Container(
                                    width: 50.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Visibility(
                                      visible: !_model.showEdit,
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor7,
                                          hoverIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.edit,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'BLOCKV3_COPY_COMP_edit_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: const Text('block id is '),
                                                    content: Text(FFAppState()
                                                        .drawerBlockId),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            logFirebaseEvent(
                                                'IconButton_update_component_state');
                                            _model.updatePage(() {
                                              _model.showEdit =
                                                  valueOrDefault<bool>(
                                                _model.showEdit ? false : true,
                                                true,
                                              );
                                            });
                                            logFirebaseEvent(
                                                'IconButton_update_app_state');
                                            _model.updatePage(() {
                                              FFAppState().showEdit =
                                                  valueOrDefault<bool>(
                                                FFAppState().showEdit
                                                    ? false
                                                    : true,
                                                true,
                                              );
                                            });
                                            logFirebaseEvent(
                                                'IconButton_update_app_state');
                                            _model.updatePage(() {
                                              FFAppState().drawerBlockId =
                                                  _model.newInlineBlockEnd!
                                                      .reference.id;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (valueOrDefault<bool>(
                          _model.showEdit,
                          false,
                        ) &&
                        responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [],
                      ),
                    if (!_model.showEdit)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (valueOrDefault<bool>(
                                          widget.tileBlock?.blockType == 'Text',
                                          false,
                                        ) &&
                                        (FFAppState().drawerBlockId ==
                                            widget.tileBlock?.blockId)) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (valueOrDefault<bool>(
                                                widget.tileBlock?.blockLayout ==
                                                    'Header',
                                                false,
                                              ))
                                                Text(
                                                  widget.tileBlock!.text,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor7,
                                                        fontSize: 28.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily),
                                                      ),
                                                ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 640.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                  widget.tileBlock
                                                          ?.blockLayout ==
                                                      'Body',
                                                  false,
                                                ))
                                                  Text(
                                                    functions.formatText(
                                                        widget.tileBlock?.text),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                          lineHeight: 1.8,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (valueOrDefault<bool>(
                                            widget.tileBlock?.blockLayout ==
                                                'List',
                                            false,
                                          ))
                                            Builder(
                                              builder: (context) {
                                                final textList = widget
                                                        .tileBlock?.textList
                                                        .toList() ??
                                                    [];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      textList.length,
                                                      (textListIndex) {
                                                    final textListItem =
                                                        textList[textListIndex];
                                                    return Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxWidth: 640.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 12.0,
                                                                height: 12.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                textListItem,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      lineHeight:
                                                                          1.6,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                        ],
                                      );
                                    } else if (valueOrDefault<bool>(
                                      widget.tileBlock?.blockType == 'Image',
                                      false,
                                    )) {
                                      return Visibility(
                                        visible: valueOrDefault<bool>(
                                          widget.tileBlock?.blockType ==
                                              'Image',
                                          false,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      100.0, 0.0, 100.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  width: 800.0,
                                                  constraints: const BoxConstraints(
                                                    maxHeight: 400.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
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
                                                            'BLOCKV3_COPY_COMP_Image_j0ls99a9_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Image_expand_image');
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                widget.tileBlock!
                                                                        .imageGallery[
                                                                    valueOrDefault<
                                                                        int>(
                                                                  _model
                                                                      .viewImageIndex,
                                                                  0,
                                                                )],
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: widget
                                                                      .tileBlock!
                                                                      .imageGallery[
                                                                  valueOrDefault<
                                                                      int>(
                                                                _model
                                                                    .viewImageIndex,
                                                                0,
                                                              )],
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: widget.tileBlock!
                                                                .imageGallery[
                                                            valueOrDefault<int>(
                                                          _model.viewImageIndex,
                                                          0,
                                                        )],
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            widget.tileBlock!
                                                                    .imageGallery[
                                                                valueOrDefault<
                                                                    int>(
                                                              _model
                                                                  .viewImageIndex,
                                                              0,
                                                            )],
                                                            width:
                                                                double.infinity,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                  widget.tileBlock
                                                          ?.blockLayout ==
                                                      'Gallery',
                                                  false,
                                                ))
                                                  Text(
                                                    valueOrDefault<String>(
                                                      widget.tileBlock
                                                              ?.textList[
                                                          valueOrDefault<int>(
                                                        () {
                                                          if (widget.tileBlock
                                                                  ?.blockType ==
                                                              'Video') {
                                                            return _model
                                                                .pageViewCurrentIndex;
                                                          } else if (widget
                                                                  .tileBlock
                                                                  ?.blockType ==
                                                              'Image') {
                                                            return _model
                                                                .viewImageIndex;
                                                          } else {
                                                            return 0;
                                                          }
                                                        }(),
                                                        0,
                                                      )],
                                                      'Gallery',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                              ],
                                            ),
                                            if (valueOrDefault<bool>(
                                              widget.tileBlock!.imageGallery
                                                      .length >
                                                  1,
                                              false,
                                            ))
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final image = widget
                                                            .tileBlock
                                                            ?.imageGallery
                                                            .toList() ??
                                                        [];
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            image.length,
                                                            (imageIndex) {
                                                          final imageItem =
                                                              image[imageIndex];
                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Container(
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: _model
                                                                              .viewImageIndex ==
                                                                          imageIndex
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor7
                                                                      : const Color(
                                                                          0x00000000),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'BLOCKV3_COPY_COMP_Image_aospbtrz_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Image_update_component_state');
                                                                    setState(
                                                                        () {
                                                                      _model.viewImageIndex =
                                                                          imageIndex;
                                                                    });
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      imageItem,
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    } else if (valueOrDefault<bool>(
                                      widget.tileBlock?.blockType == 'Video',
                                      false,
                                    )) {
                                      return Visibility(
                                        visible: valueOrDefault<bool>(
                                          widget.tileBlock?.blockType ==
                                              'Video',
                                          false,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                  widget.tileBlock
                                                          ?.blockLayout ==
                                                      'Gallery',
                                                  false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget.tileBlock
                                                                ?.textList[
                                                            valueOrDefault<int>(
                                                          () {
                                                            if (widget.tileBlock
                                                                    ?.blockType ==
                                                                'Video') {
                                                              return _model
                                                                  .pageViewCurrentIndex;
                                                            } else if (widget
                                                                    .tileBlock
                                                                    ?.blockType ==
                                                                'Image') {
                                                              return _model
                                                                  .viewImageIndex;
                                                            } else {
                                                              return 0;
                                                            }
                                                          }(),
                                                          0,
                                                        )],
                                                        'Gallery',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 22.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            ClipRRect(
                                              child: Container(
                                                constraints: const BoxConstraints(
                                                  minHeight: 400.0,
                                                ),
                                                decoration: const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final video = widget
                                                              .tileBlock
                                                              ?.videoGallery
                                                              .toList() ??
                                                          [];
                                                      return SizedBox(
                                                        width: 640.0,
                                                        height: 400.0,
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          50.0),
                                                              child: PageView
                                                                  .builder(
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                controller: _model
                                                                        .pageViewController ??=
                                                                    PageController(
                                                                        initialPage: min(
                                                                            0,
                                                                            video.length -
                                                                                1)),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount: video
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        videoIndex) {
                                                                  final videoItem =
                                                                      video[
                                                                          videoIndex];
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          FlutterFlowVideoPlayer(
                                                                        path: widget
                                                                            .tileBlock!
                                                                            .videoGallery[valueOrDefault<int>(
                                                                          _model
                                                                              .pageViewCurrentIndex,
                                                                          0,
                                                                        )],
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
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: smooth_page_indicator
                                                                    .SmoothPageIndicator(
                                                                  controller: _model
                                                                          .pageViewController ??=
                                                                      PageController(
                                                                          initialPage: min(
                                                                              0,
                                                                              video.length - 1)),
                                                                  count: video
                                                                      .length,
                                                                  axisDirection:
                                                                      Axis.horizontal,
                                                                  onDotClicked:
                                                                      (i) async {
                                                                    await _model
                                                                        .pageViewController!
                                                                        .animateToPage(
                                                                      i,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  effect: smooth_page_indicator
                                                                      .SlideEffect(
                                                                    spacing:
                                                                        12.0,
                                                                    radius:
                                                                        16.0,
                                                                    dotWidth:
                                                                        16.0,
                                                                    dotHeight:
                                                                        12.0,
                                                                    dotColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .btnBk,
                                                                    activeDotColor:
                                                                        const Color(
                                                                            0xFF1A5AF9),
                                                                    paintStyle:
                                                                        PaintingStyle
                                                                            .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (valueOrDefault<bool>(
                                              widget.tileBlock!.videoGallery
                                                      .length >=
                                                  2,
                                              false,
                                            ))
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                48.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'BLOCKV3_COPY_COMP_BACK_BTN_ON_TAP');
                                                      },
                                                      text: 'Back',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(48.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'BLOCKV3_COPY_COMP_NEXT_BTN_ON_TAP');
                                                      },
                                                      text: 'Next',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      );
                                    } else if ((FFAppState().showEdit !=
                                            false) ||
                                        (_model.showEdit != false)) {
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          wrapWithModel(
                                            model: _model.panelEditBlockModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: PanelEditBlockWidget(
                                              isDrawer: false,
                                              tileBlock: widget.tileBlock,
                                              action: () async {},
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Hello World',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Container(
                width: 960.0,
                height: 40.0,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        hoverColor: FlutterFlowTheme.of(context).customColor7,
                        hoverIconColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).grayIcon,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent('BLOCKV3_COPY_COMP_add_ICN_ON_TAP');
                          final firestoreBatch =
                              FirebaseFirestore.instance.batch();
                          try {
                            logFirebaseEvent('IconButton_backend_call');

                            var tileBlocksRecordReference =
                                TileBlocksRecord.collection.doc();
                            firestoreBatch.set(tileBlocksRecordReference, {
                              ...createTileBlocksRecordData(
                                createdTime: getCurrentTimestamp,
                                updatedTime: getCurrentTimestamp,
                                user: currentUserReference,
                                uid: currentUserUid,
                                blockId: '',
                                blockType: 'Text',
                                blockIndex: valueOrDefault<int>(
                                  (valueOrDefault<int>(
                                            widget.tileBlock?.blockIndex,
                                            0,
                                          ) -
                                          1) ??
                                      0,
                                  0,
                                ),
                                blockName: 'Block -  ',
                                blockStatus: 'Draft',
                                tileId: widget.tileBlock?.tileId,
                                image: '',
                                thumbnail: '',
                                isDefaultTheme: true,
                                blockLayout: 'Header',
                                blockTitle: ' - Block ',
                                blockSubtitle: '',
                                video: '',
                                audio: '',
                                text: '',
                                header: '',
                                subtitle: '',
                                title: 'title',
                              ),
                              ...mapToFirestore(
                                {
                                  'audio_gallery': functions.emptyAudioList(),
                                  'video_gallery': functions.emptyVideoList(),
                                  'textList': [],
                                  'image_gallery': functions.emptyImageList(),
                                },
                              ),
                            });
                            _model.newInlineBlockEnd =
                                TileBlocksRecord.getDocumentFromData({
                              ...createTileBlocksRecordData(
                                createdTime: getCurrentTimestamp,
                                updatedTime: getCurrentTimestamp,
                                user: currentUserReference,
                                uid: currentUserUid,
                                blockId: '',
                                blockType: 'Text',
                                blockIndex: valueOrDefault<int>(
                                  (valueOrDefault<int>(
                                            widget.tileBlock?.blockIndex,
                                            0,
                                          ) -
                                          1) ??
                                      0,
                                  0,
                                ),
                                blockName: 'Block -  ',
                                blockStatus: 'Draft',
                                tileId: widget.tileBlock?.tileId,
                                image: '',
                                thumbnail: '',
                                isDefaultTheme: true,
                                blockLayout: 'Header',
                                blockTitle: ' - Block ',
                                blockSubtitle: '',
                                video: '',
                                audio: '',
                                text: '',
                                header: '',
                                subtitle: '',
                                title: 'title',
                              ),
                              ...mapToFirestore(
                                {
                                  'audio_gallery': functions.emptyAudioList(),
                                  'video_gallery': functions.emptyVideoList(),
                                  'textList': [],
                                  'image_gallery': functions.emptyImageList(),
                                },
                              ),
                            }, tileBlocksRecordReference);
                            logFirebaseEvent('IconButton_backend_call');

                            firestoreBatch.update(
                                _model.newInlineBlockEnd!.reference,
                                createTileBlocksRecordData(
                                  blockId:
                                      _model.newInlineBlockEnd?.reference.id,
                                ));
                            logFirebaseEvent('IconButton_update_app_state');
                            _model.updatePage(() {
                              FFAppState().drawerBlockId =
                                  _model.newInlineBlockEnd!.reference.id;
                            });
                            logFirebaseEvent(
                                'IconButton_update_component_state');
                            _model.updatePage(() {
                              _model.showEdit = valueOrDefault<bool>(
                                _model.showEdit ? false : true,
                                true,
                              );
                            });
                            logFirebaseEvent('IconButton_update_app_state');
                            _model.updatePage(() {
                              FFAppState().showEdit = valueOrDefault<bool>(
                                FFAppState().showEdit ? false : true,
                                true,
                              );
                            });
                          } finally {
                            await firestoreBatch.commit();
                          }

                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 640.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
