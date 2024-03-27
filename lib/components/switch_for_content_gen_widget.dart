import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'switch_for_content_gen_model.dart';
export 'switch_for_content_gen_model.dart';

class SwitchForContentGenWidget extends StatefulWidget {
  const SwitchForContentGenWidget({
    super.key,
    this.parameter1,
  });

  final DocumentReference? parameter1;

  @override
  State<SwitchForContentGenWidget> createState() =>
      _SwitchForContentGenWidgetState();
}

class _SwitchForContentGenWidgetState extends State<SwitchForContentGenWidget> {
  late SwitchForContentGenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchForContentGenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue ??= false,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue!);
        if (newValue!) {
          logFirebaseEvent('SWITCH_FOR_CONTENT_GEN_Switch_n0s7wv39_O');
          logFirebaseEvent('Switch_backend_call');

          await widget.parameter1!.update(createTilesv2RecordData(
            triggerWeekly: true,
          ));
          logFirebaseEvent('Switch_alert_dialog');
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      title: Text('This will use tokens'),
                      content: Text(
                          'By switching this on you will be activating content generation and activities, you should only do this if you wish to make this one of your weekly topics.'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
              ) ??
              false;
          if (confirmDialogResponse) {
            logFirebaseEvent('Switch_backend_call');

            await widget.parameter1!.update(createTilesv2RecordData(
              triggerWeekly: true,
            ));
          }
        } else {
          logFirebaseEvent('SWITCH_FOR_CONTENT_GEN_Switch_n0s7wv39_O');
          logFirebaseEvent('Switch_backend_call');

          await widget.parameter1!.update(createTilesv2RecordData(
            triggerWeekly: false,
          ));
        }
      },
      activeColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: Color(0xFF5AB84E),
      inactiveTrackColor: Color(0xFFE27676),
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
