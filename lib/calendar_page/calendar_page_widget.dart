import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_page_model.dart';
export 'calendar_page_model.dart';

class CalendarPageWidget extends StatefulWidget {
  const CalendarPageWidget({Key? key}) : super(key: key);

  static String routeName = 'CalendarPage';
  static String routePath = '/calendarPage';

  @override
  _CalendarPageWidgetState createState() => _CalendarPageWidgetState();
}

class _CalendarPageWidgetState extends State<CalendarPageWidget> {
  late CalendarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarPageModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Color getTaskCompletionColor(List<TaskRecord> tasks) {
    if (tasks.isEmpty) return Colors.transparent;

    int completedTasks = tasks.where((task) => task.isCompleted).length;
    double completionRate = completedTasks / tasks.length;

    if (completionRate == 1.0) {
      return Colors.green.withOpacity(0.3); // All tasks completed
    } else if (completionRate > 0) {
      return Colors.yellow.withOpacity(0.3); // Partially completed
    } else {
      return Colors.red.withOpacity(0.3); // No tasks completed
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TaskRecord>>(
      stream: queryTaskRecord(
        queryBuilder: (taskRecord) => taskRecord
          .where('owner', isEqualTo: currentUserReference)
          .orderBy('created_time'),
      ),
      builder: (context, snapshot) {
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

        List<TaskRecord> tasks = snapshot.data!;
        Map<DateTime, List<TaskRecord>> tasksByDate = {};

        // Group tasks by date
        for (var task in tasks) {
          DateTime taskDate = task.createdTime?.startOfDay ?? DateTime.now().startOfDay;
          tasksByDate[taskDate] = [...(tasksByDate[taskDate] ?? []), task];
        }

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            title: Text(
              'Task Calendar',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter Tight',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                    ),
                    margin: EdgeInsets.all(16.0),
                    child: FlutterFlowCalendar(
                      color: FlutterFlowTheme.of(context).primary,
                      weekFormat: false,
                      weekStartsMonday: false,
                      onChange: (DateTimeRange? newSelectedDate) {
                        setState(() => _model.calendarSelectedDay = newSelectedDate);
                      },
                      titleStyle: FlutterFlowTheme.of(context).headlineSmall,
                      dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
                      dateStyle: FlutterFlowTheme.of(context).bodyMedium,
                      selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
                      inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
                      calendarBuilderDelegate: (context, date) {
                        final dayTasks = tasksByDate[date.startOfDay] ?? [];
                        final backgroundColor = getTaskCompletionColor(dayTasks);

                        return Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Center(
                            child: Text(
                              date.day.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLegendItem(context, 'All Complete', Colors.green.withOpacity(0.3)),
                      _buildLegendItem(context, 'Partially Complete', Colors.yellow.withOpacity(0.3)),
                      _buildLegendItem(context, 'None Complete', Colors.red.withOpacity(0.3)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegendItem(BuildContext context, String label, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: FlutterFlowTheme.of(context).primary.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: FlutterFlowTheme.of(context).bodySmall,
        ),
      ],
    );
  }
}