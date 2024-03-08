import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blockv31_model.dart';
export 'blockv31_model.dart';

class Blockv31Widget extends StatefulWidget {
  const Blockv31Widget({
    super.key,
    this.tileBlock,
    String? topicItem,
    this.readingItem,
    required this.sessionId,
    required this.companyDoc,
    this.tileDocOriginal,
  }) : topicItem = topicItem ?? 'topicItem';

  final TileblocksRecord? tileBlock;
  final String topicItem;
  final String? readingItem;
  final SessionsRecord? sessionId;
  final CompaniesRecord? companyDoc;
  final TilesRecord? tileDocOriginal;

  @override
  State<Blockv31Widget> createState() => _Blockv31WidgetState();
}

class _Blockv31WidgetState extends State<Blockv31Widget> {
  late Blockv31Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Blockv31Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BLOCKV31_COMP_blockv31_ON_INIT_STATE');
      logFirebaseEvent('blockv31_update_app_state');
      setState(() {
        FFAppState().QuizReadyToMoveOn = true;
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

    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget.tileBlock?.title,
              'title not set ',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  fontSize: 28.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
        ],
      ),
    );
  }
}
