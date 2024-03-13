import '/backend/backend.dart';
import '/components/learn_cards_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/left_pane/desktop_tile_nav_a_your_saved/desktop_tile_nav_a_your_saved_widget.dart';
import '/left_pane/desktop_tile_nav_ai_this_week/desktop_tile_nav_ai_this_week_widget.dart';
import '/left_pane/event_app_tiles/event_app_tiles_widget.dart';
import '/left_pane/main_app_tiles/main_app_tiles_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'left_column_model.dart';
export 'left_column_model.dart';

class LeftColumnWidget extends StatefulWidget {
  const LeftColumnWidget({
    super.key,
    bool? isLeftShow,
    this.sessionsDoc,
    this.companiesDoc,
  }) : this.isLeftShow = isLeftShow ?? false;

  final bool isLeftShow;
  final SessionsRecord? sessionsDoc;
  final CompaniesRecord? companiesDoc;

  @override
  State<LeftColumnWidget> createState() => _LeftColumnWidgetState();
}

class _LeftColumnWidgetState extends State<LeftColumnWidget> {
  late LeftColumnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeftColumnModel());

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
      visible: FFAppState().leftColumnShow == true,
      child: Align(
        alignment: AlignmentDirectional(-1.0, -1.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 420.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return 550.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 550.0;
              } else {
                return 550.0;
              }
            }(),
          ),
          decoration: BoxDecoration(),
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) {
                      if (FFAppState().leftPane == 'aiMenu') {
                        return SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 500.0,
                                ),
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: wrapWithModel(
                                          model: _model
                                              .desktopTileNavAiThisWeekModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: DesktopTileNavAiThisWeekWidget(
                                            sessionDoc: widget.sessionsDoc,
                                            companyDoc: widget.companiesDoc!,
                                          ),
                                        ),
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Your Saved Content',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium,
                                              ),
                                              Text(
                                                'Your Saved Content',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium,
                                              ),
                                              Expanded(
                                                child: wrapWithModel(
                                                  model: _model
                                                      .desktopTileNavAYourSavedModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      DesktopTileNavAYourSavedWidget(
                                                    sessionId: widget
                                                        .sessionsDoc
                                                        ?.reference
                                                        .id,
                                                    sessionDoc:
                                                        widget.sessionsDoc,
                                                  ),
                                                ),
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
                        );
                      } else if (FFAppState().leftPane == 'appMenu') {
                        return SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 400.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 500.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 600.0;
                                    } else {
                                      return 400.0;
                                    }
                                  }(),
                                ),
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.mainAppTilesModel,
                                  updateCallback: () => setState(() {}),
                                  child: MainAppTilesWidget(
                                    categorySelected:
                                        FFAppState().selectedCategoryName,
                                    companyDoc: widget.companiesDoc!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (FFAppState().leftPane == 'learnCards') {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut,
                              constraints: BoxConstraints(
                                maxWidth: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 400.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 500.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 600.0;
                                  } else {
                                    return 400.0;
                                  }
                                }(),
                              ),
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.learnCardsModel,
                                updateCallback: () => setState(() {}),
                                child: LearnCardsWidget(
                                  sessionsDoc: widget.sessionsDoc!,
                                  companyDoc: widget.companiesDoc!,
                                  showRight: FFAppState().leftColumnShow,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (FFAppState().leftPane == 'events') {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 400.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 500.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 600.0;
                                  } else {
                                    return 400.0;
                                  }
                                }(),
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: wrapWithModel(
                                model: _model.eventAppTilesModel,
                                updateCallback: () => setState(() {}),
                                child: EventAppTilesWidget(
                                  categorySelected:
                                      FFAppState().selectedCategoryName,
                                  companyDoc: widget.companiesDoc!,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
