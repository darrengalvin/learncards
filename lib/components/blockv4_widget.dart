import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blockv4_model.dart';
export 'blockv4_model.dart';

class Blockv4Widget extends StatefulWidget {
  const Blockv4Widget({
    super.key,
    this.tileBlock,
  });

  final TileBlocksRecord? tileBlock;

  @override
  State<Blockv4Widget> createState() => _Blockv4WidgetState();
}

class _Blockv4WidgetState extends State<Blockv4Widget> {
  late Blockv4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Blockv4Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BLOCKV4_COMP_blockv4_ON_INIT_STATE');
      logFirebaseEvent('blockv4_update_app_state');
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

    return Container();
  }
}
