import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_personalised_journey_model.dart';
export 'empty_personalised_journey_model.dart';

class EmptyPersonalisedJourneyWidget extends StatefulWidget {
  const EmptyPersonalisedJourneyWidget({super.key});

  @override
  State<EmptyPersonalisedJourneyWidget> createState() =>
      _EmptyPersonalisedJourneyWidgetState();
}

class _EmptyPersonalisedJourneyWidgetState
    extends State<EmptyPersonalisedJourneyWidget> {
  late EmptyPersonalisedJourneyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPersonalisedJourneyModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.notifications_none,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 72.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'No Personalised Journey',
              style: FlutterFlowTheme.of(context).headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Text(
              'You do not yet have a personalised Journey, you must be a member to use this facility.\n\nThis feature will be ready to try on the 7th April ',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
