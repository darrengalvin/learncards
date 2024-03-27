import '/backend/backend.dart';
import '/components/learn_cards_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'right_column_model.dart';
export 'right_column_model.dart';

class RightColumnWidget extends StatefulWidget {
  const RightColumnWidget({
    super.key,
    required this.sessionsDoc,
    required this.companyDoc,
    bool? rightColumnShow,
  }) : this.rightColumnShow = rightColumnShow ?? false;

  final SessionsRecord? sessionsDoc;
  final CompaniesRecord? companyDoc;
  final bool rightColumnShow;

  @override
  State<RightColumnWidget> createState() => _RightColumnWidgetState();
}

class _RightColumnWidgetState extends State<RightColumnWidget> {
  late RightColumnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RightColumnModel());

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
      visible: (FFAppState().rightColumnShow == true) || widget.rightColumnShow,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) {
              if (FFAppState().rightPane == 'learnCards') {
                return Container(
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.learnCardsModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: LearnCardsWidget(
                      color: widget.companyDoc?.colors?.secondaryColor,
                      sessionsDoc: widget.sessionsDoc!,
                      companyDoc: widget.companyDoc!,
                      showRight: !widget.rightColumnShow,
                    ),
                  ),
                );
              } else if (FFAppState().rightPane == 'events') {
                return Container(
                  width: 500.0,
                  height: 600.0,
                  constraints: BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                );
              } else {
                return Container(
                  width: 500.0,
                  height: 1000.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
