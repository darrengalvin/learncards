import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tag_vertical_model.dart';
export 'tag_vertical_model.dart';

class TagVerticalWidget extends StatefulWidget {
  const TagVerticalWidget({super.key});

  @override
  State<TagVerticalWidget> createState() => _TagVerticalWidgetState();
}

class _TagVerticalWidgetState extends State<TagVerticalWidget> {
  late TagVerticalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagVerticalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).selectedButton,
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          'Tile Layouts',
          textAlign: TextAlign.start,
          maxLines: 1,
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
              ),
        ),
      ),
    );
  }
}
