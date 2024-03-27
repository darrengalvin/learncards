import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navchipsimages_model.dart';
export 'navchipsimages_model.dart';

class NavchipsimagesWidget extends StatefulWidget {
  const NavchipsimagesWidget({
    super.key,
    int? initialTileIndex,
    this.tileDocs,
    required this.membershipLevel,
  }) : this.initialTileIndex = initialTileIndex ?? 0;

  final int initialTileIndex;
  final List<Tilesv2Record>? tileDocs;
  final MemberLevelsRecord? membershipLevel;

  @override
  State<NavchipsimagesWidget> createState() => _NavchipsimagesWidgetState();
}

class _NavchipsimagesWidgetState extends State<NavchipsimagesWidget> {
  late NavchipsimagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavchipsimagesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAVCHIPSIMAGES_navchipsimages_ON_INIT_ST');
      logFirebaseEvent('navchipsimages_update_app_state');
      FFAppState().navPath = [];
      if (widget.tileDocs!.length >= 1) {
        logFirebaseEvent('navchipsimages_update_app_state');
        FFAppState().addToNavPath(valueOrDefault<String>(
          widget.tileDocs?[widget.initialTileIndex]?.reference.id,
          '0',
        ));
        FFAppState().viewTileContentId = valueOrDefault<String>(
          widget.tileDocs?[widget.initialTileIndex]?.reference.id,
          '0',
        );
        FFAppState().updateTileNavStruct(
          (e) => e..tier0Id = widget.tileDocs?.first?.reference.id,
        );
      }
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
