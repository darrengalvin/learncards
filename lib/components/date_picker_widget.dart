import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'date_picker_model.dart';
export 'date_picker_model.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    required this.tilev2passed,
  });

  final Tilesv2Record? tilev2passed;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DatePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Go Live Date ${dateTimeFormat('MMMMEEEEd', _model.calendarSelectedDay?.start)}',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Outfit'),
                        ),
                  ),
                ],
              ),
            ),
            if (valueOrDefault<bool>(
              _model.calendarSelectedDay != null,
              false,
            ))
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).darkSeaGreen,
                  icon: Icon(
                    Icons.check_sharp,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('DATE_PICKER_COMP_check_sharp_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_backend_call');

                    await widget.tilev2passed!.reference
                        .update(createTilesv2RecordData(
                      triggerWeekly: true,
                    ));
                    logFirebaseEvent('IconButton_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Saved',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 500.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).primary,
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                weekFormat: false,
                weekStartsMonday: true,
                initialDate: getCurrentTimestamp,
                rowHeight: 64.0,
                onChange: (DateTimeRange? newSelectedDate) async {
                  if (_model.calendarSelectedDay == newSelectedDate) {
                    return;
                  }
                  _model.calendarSelectedDay = newSelectedDate;
                  logFirebaseEvent('DATE_PICKER_Calendar_t6r8zgil_ON_DATE_SE');
                  logFirebaseEvent('Calendar_backend_call');

                  await widget.tilev2passed!.reference
                      .update(createTilesv2RecordData(
                    showUsersDate: _model.calendarSelectedDay?.start,
                  ));
                  setState(() {});
                },
                titleStyle: FlutterFlowTheme.of(context).headlineSmall,
                dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
                dateStyle: FlutterFlowTheme.of(context).bodyMedium,
                selectedDateStyle: FlutterFlowTheme.of(context)
                    .titleSmall
                    .override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: FlutterFlowTheme.of(context).alternate,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
