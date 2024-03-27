import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'threads_drop_down_model.dart';
export 'threads_drop_down_model.dart';

class ThreadsDropDownWidget extends StatefulWidget {
  const ThreadsDropDownWidget({
    super.key,
    this.sessionDoc,
  });

  final SessionsRecord? sessionDoc;

  @override
  State<ThreadsDropDownWidget> createState() => _ThreadsDropDownWidgetState();
}

class _ThreadsDropDownWidgetState extends State<ThreadsDropDownWidget> {
  late ThreadsDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadsDropDownModel());

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

    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= widget.sessionDoc?.threads?.first?.threadName,
      ),
      options: List<String>.from(widget.sessionDoc!.threads
          .map((e) => valueOrDefault<String>(
                e.threadId,
                'nameNotSet',
              ))
          .toList()),
      optionLabels: widget.sessionDoc!.threads
          .map((e) => valueOrDefault<String>(
                e.threadName,
                'nameNotSet',
              ))
          .toList(),
      onChanged: (val) async {
        setState(() => _model.dropDownValue = val);
        logFirebaseEvent('THREADS_DROP_DOWN_DropDown_49vozinp_ON_F');
        logFirebaseEvent('DropDown_update_app_state');
        setState(() {
          FFAppState().selectedThreadId = _model.dropDownValue!;
        });
        logFirebaseEvent('DropDown_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: Text('Thread Id set to '),
                content: Text(FFAppState().selectedThreadId),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
      },
      width: 300.0,
      height: 50.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium,
      hintText: 'Please select...',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: FlutterFlowTheme.of(context).alternate,
      borderWidth: 2.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
      hidesUnderline: true,
      isOverButton: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
