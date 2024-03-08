import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dynamic_toggle_icon_model.dart';
export 'dynamic_toggle_icon_model.dart';

class DynamicToggleIconWidget extends StatefulWidget {
  const DynamicToggleIconWidget({
    super.key,
    bool? initalValue,
    required this.toggleOn,
    required this.toggleOff,
    this.action,
    bool? onToggleAction,
  })  : initalValue = initalValue ?? false,
        onToggleAction = onToggleAction ?? false;

  final bool initalValue;
  final Widget? toggleOn;
  final Widget? toggleOff;
  final Future Function()? action;
  final bool onToggleAction;

  @override
  State<DynamicToggleIconWidget> createState() =>
      _DynamicToggleIconWidgetState();
}

class _DynamicToggleIconWidgetState extends State<DynamicToggleIconWidget> {
  late DynamicToggleIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicToggleIconModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DYNAMIC_TOGGLE_ICON_dynamic_ToggleIcon_O');
      logFirebaseEvent('dynamic_ToggleIcon_update_component_stat');
      setState(() {
        _model.toggleValue = widget.initalValue;
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
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Builder(
        builder: (context) {
          if (_model.toggleValue) {
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('DYNAMIC_TOGGLE_ICON_Icon_akvaaach_ON_TAP');
                logFirebaseEvent('Icon_action_block');
                await _model.updateToggleValue(context);
                setState(() {});
                if (widget.onToggleAction) {
                  logFirebaseEvent('Icon_execute_callback');
                  await widget.action?.call();
                }
              },
              child: widget.toggleOff!,
            );
          } else {
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('DYNAMIC_TOGGLE_ICON_Icon_afy93t65_ON_TAP');
                logFirebaseEvent('Icon_action_block');
                await _model.updateToggleValue(context);
                setState(() {});
              },
              child: widget.toggleOn!,
            );
          }
        },
      ),
    );
  }
}
