import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'AuthPage': ParameterData.none(),
  'OnBoardingPage': ParameterData.none(),
  'HabitsPage': ParameterData.none(),
  'AddGoalPage': ParameterData.none(),
  'AddHabitPage': ParameterData.none(),
  'ReflectionPage': (data) async => ParameterData(
        allParams: {
          'goal': getParameter<DocumentReference>(data, 'goal'),
          'habit': getParameter<DocumentReference>(data, 'habit'),
        },
      ),
  'userprofilePage': ParameterData.none(),
  'GoalsPage': ParameterData.none(),
  'EditGoalPage': (data) async => ParameterData(
        allParams: {
          'goalDocument': await getDocumentParameter<GoalRecord>(
              data, 'goalDocument', GoalRecord.fromSnapshot),
        },
      ),
  'EditHabitPage': (data) async => ParameterData(
        allParams: {
          'habitDocument': await getDocumentParameter<TaskRecord>(
              data, 'habitDocument', TaskRecord.fromSnapshot),
        },
      ),
  'AddSubTask': (data) async => ParameterData(
        allParams: {
          'habit': await getDocumentParameter<TaskRecord>(
              data, 'habit', TaskRecord.fromSnapshot),
        },
      ),
  'HabitDetails': (data) async => ParameterData(
        allParams: {
          'habit': await getDocumentParameter<TaskRecord>(
              data, 'habit', TaskRecord.fromSnapshot),
        },
      ),
  'EditSubTask': (data) async => ParameterData(
        allParams: {
          'subTask': await getDocumentParameter<SubTasksRecord>(
              data, 'subTask', SubTasksRecord.fromSnapshot),
        },
      ),
  'AddSubGoal': (data) async => ParameterData(
        allParams: {
          'goal': await getDocumentParameter<GoalRecord>(
              data, 'goal', GoalRecord.fromSnapshot),
        },
      ),
  'VerifyEmail': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'GoalDetails': (data) async => ParameterData(
        allParams: {
          'goal': await getDocumentParameter<GoalRecord>(
              data, 'goal', GoalRecord.fromSnapshot),
        },
      ),
  'EditSubGoal': (data) async => ParameterData(
        allParams: {
          'subGoals': await getDocumentParameter<SubGoalsRecord>(
              data, 'subGoals', SubGoalsRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
