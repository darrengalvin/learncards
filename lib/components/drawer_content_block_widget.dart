import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'drawer_content_block_model.dart';
export 'drawer_content_block_model.dart';

class DrawerContentBlockWidget extends StatefulWidget {
  const DrawerContentBlockWidget({
    super.key,
    this.editBlockId,
    required this.action,
    this.tileBlock,
    bool? isDrawer,
  }) : isDrawer = isDrawer ?? false;

  final String? editBlockId;
  final Future Function()? action;
  final TileblocksRecord? tileBlock;
  final bool isDrawer;

  @override
  State<DrawerContentBlockWidget> createState() =>
      _DrawerContentBlockWidgetState();
}

class _DrawerContentBlockWidgetState extends State<DrawerContentBlockWidget> {
  late DrawerContentBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerContentBlockModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      width: 640.0,
      constraints: const BoxConstraints(
        maxHeight: 800.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
      ),
    );
  }
}
