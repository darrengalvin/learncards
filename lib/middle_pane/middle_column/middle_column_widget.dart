import '/backend/backend.dart';
import '/components/social_feed_bottoms_h_e_e_t_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/middle_pane/body_content/body_content_widget.dart';
import '/middle_pane/body_content_mainiles/body_content_mainiles_widget.dart';
import '/middle_pane/body_contentt_learn_cards/body_contentt_learn_cards_widget.dart';
import '/middle_pane/preparing/preparing_widget.dart';
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'middle_column_model.dart';
export 'middle_column_model.dart';

class MiddleColumnWidget extends StatefulWidget {
  const MiddleColumnWidget({
    super.key,
    required this.companyDoc,
    required this.sessionsDoc,
    bool? isMiddleShow,
  }) : isMiddleShow = isMiddleShow ?? false;

  final CompaniesRecord? companyDoc;
  final SessionsRecord? sessionsDoc;
  final bool isMiddleShow;

  @override
  State<MiddleColumnWidget> createState() => _MiddleColumnWidgetState();
}

class _MiddleColumnWidgetState extends State<MiddleColumnWidget> {
  late MiddleColumnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiddleColumnModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MIDDLE_COLUMN_MiddleColumn_ON_INIT_STATE');
      logFirebaseEvent('MiddleColumn_update_app_state');
      setState(() {
        FFAppState().showLearnCard = true;
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

    return Visibility(
      visible: valueOrDefault<bool>(
        (FFAppState().middleColumnShow == true) ||
            valueOrDefault<bool>(
              widget.isMiddleShow,
              false,
            ),
        false,
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Builder(
                builder: (context) {
                  if (FFAppState().middlePane == 'preparing') {
                    return wrapWithModel(
                      model: _model.preparingModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: PreparingWidget(
                        companyDoc: widget.companyDoc!,
                        sessionsDoc: widget.sessionsDoc!,
                      ),
                    );
                  } else if (FFAppState().middlePane == 'bodyContent') {
                    return wrapWithModel(
                      model: _model.bodyContentModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: BodyContentWidget(
                        companyDoc: widget.companyDoc!,
                        sessionId: widget.sessionsDoc!,
                      ),
                    );
                  } else if (FFAppState().middlePane == 'social') {
                    return wrapWithModel(
                      model: _model.socialFeedNewComponantModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: const SocialFeedNewComponantWidget(),
                    );
                  } else if (FFAppState().middlePane ==
                      'bodyContentMainTiles') {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.bodyContentMainTilesModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: BodyContentMainilesWidget(
                            companyDoc: widget.companyDoc!,
                            sessionId: widget.sessionsDoc!,
                          ),
                        ),
                      ],
                    );
                  } else if (FFAppState().middlePane == 'Social') {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.socialFeedBottomsHEETModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: SocialFeedBottomsHEETWidget(
                            askingQuestion: false,
                            companiesDoc: widget.companyDoc!,
                          ),
                        ),
                      ],
                    );
                  } else if (FFAppState().middlePane == 'learnCardsContent') {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.bodyContenttLearnCardsModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: BodyContenttLearnCardsWidget(
                              companyDoc: widget.companyDoc!,
                              sessionId: widget.sessionsDoc!,
                              rightColumnShow: false,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Column(
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
    );
  }
}
