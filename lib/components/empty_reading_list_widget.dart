import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'empty_reading_list_model.dart';
export 'empty_reading_list_model.dart';

class EmptyReadingListWidget extends StatefulWidget {
  const EmptyReadingListWidget({super.key});

  @override
  State<EmptyReadingListWidget> createState() => _EmptyReadingListWidgetState();
}

class _EmptyReadingListWidgetState extends State<EmptyReadingListWidget> {
  late EmptyReadingListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyReadingListModel());

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
      width: 350.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FaIcon(
            FontAwesomeIcons.book,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 72.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'Empty Reading List',
              style: FlutterFlowTheme.of(context).headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Text(
              'It seems that you don\'t have any items on your reading list yet, simply let me know what you would like to learn and I will take care of that for you.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
