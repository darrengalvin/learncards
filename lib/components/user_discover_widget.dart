import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_discover_model.dart';
export 'user_discover_model.dart';

class UserDiscoverWidget extends StatefulWidget {
  const UserDiscoverWidget({
    super.key,
    bool? askingQuestion,
  }) : this.askingQuestion = askingQuestion ?? false;

  final bool askingQuestion;

  @override
  State<UserDiscoverWidget> createState() => _UserDiscoverWidgetState();
}

class _UserDiscoverWidgetState extends State<UserDiscoverWidget> {
  late UserDiscoverModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDiscoverModel());

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

    return StreamBuilder<List<FlowiseChatsRecord>>(
      stream: queryFlowiseChatsRecord(
        queryBuilder: (flowiseChatsRecord) => flowiseChatsRecord
            .where(
              'thread_id',
              isEqualTo: FFAppState().activeThread,
            )
            .orderBy('created_time'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<FlowiseChatsRecord> userDiscoverFlowiseChatsRecordList =
            snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (valueOrDefault<bool>(
              FFAppState().tempStreamingMessage != null &&
                  FFAppState().tempStreamingMessage != '',
              false,
            ))
              Container(
                decoration: BoxDecoration(),
              ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
