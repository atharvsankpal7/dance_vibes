import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowCalendar(
      color: FlutterFlowTheme.of(context).primary,
      iconColor: FlutterFlowTheme.of(context).secondaryText,
      weekFormat: false,
      weekStartsMonday: false,
      rowHeight: 48.0,
      onChange: (DateTimeRange? newSelectedDate) {
        safeSetState(() => _model.calendarSelectedDay = newSelectedDate);
      },
      titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
            fontFamily: 'Inter Tight',
            letterSpacing: 0.0,
          ),
      dayOfWeekStyle: FlutterFlowTheme.of(context).bodyLarge.override(
            fontFamily: 'Inter',
            letterSpacing: 0.0,
          ),
      dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Inter',
            letterSpacing: 0.0,
          ),
      selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
            fontFamily: 'Inter Tight',
            letterSpacing: 0.0,
          ),
      inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Inter',
            letterSpacing: 0.0,
          ),
    );
  }
}
