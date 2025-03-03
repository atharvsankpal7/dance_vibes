import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'goals_page_model.dart';
export 'goals_page_model.dart';

class GoalsPageWidget extends StatefulWidget {
  const GoalsPageWidget({super.key});

  static String routeName = 'GoalsPage';
  static String routePath = '/goalsPage';

  @override
  State<GoalsPageWidget> createState() => _GoalsPageWidgetState();
}

class _GoalsPageWidgetState extends State<GoalsPageWidget>
    with TickerProviderStateMixin {
  late GoalsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalsPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'stackOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, -5.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 2.0),
          ),
        ],
      ),
      'stackOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, -5.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 2.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Lottie.asset(
                            'assets/jsons/Target_Icon.json',
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.cover,
                            repeat: false,
                            animate: true,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Text(
                                'My Goals',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.add_box,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(
                                AddGoalPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.scale,
                                    alignment: Alignment.bottomCenter,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondary,
                          tabs: [
                            Tab(
                              text: 'Goals to complete',
                            ),
                            Tab(
                              text: 'Goals I\'ve completed',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: StreamBuilder<List<GoalRecord>>(
                                      stream: queryGoalRecord(
                                        queryBuilder: (goalRecord) => goalRecord
                                            .where(
                                              'isCompleted',
                                              isEqualTo: false,
                                            )
                                            .where(
                                              'owner',
                                              isEqualTo: currentUserReference,
                                            ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<GoalRecord>
                                            listViewGoalRecordList =
                                            snapshot.data!;
                                        if (listViewGoalRecordList.isEmpty) {
                                          return Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.8,
                                            child: EmptyListWidget(),
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewGoalRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewGoalRecord =
                                                listViewGoalRecordList[
                                                    listViewIndex];
                                            return Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              listViewGoalRecord.title,
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Inter Tight',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  EditGoalPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'goalDocument': serializeParam(
                                                                                      listViewGoalRecord,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'goalDocument': listViewGoalRecord,
                                                                                    kTransitionInfoKey: TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.scale,
                                                                                      alignment: Alignment.bottomCenter,
                                                                                      duration: Duration(milliseconds: 200),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.edit,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.checkboxValueMap1[listViewGoalRecord] ??= listViewGoalRecord.isCompleted,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.checkboxValueMap1[listViewGoalRecord] = newValue!);
                                                                                if (newValue!) {
                                                                                  await listViewGoalRecord.reference.update(createGoalRecordData(
                                                                                    isCompleted: true,
                                                                                  ));
                                                                                }
                                                                              },
                                                                              side: BorderSide(
                                                                                width: 2,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                              activeColor: FlutterFlowTheme.of(context).secondary,
                                                                              checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              listViewGoalRecord.description,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.4,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              buttonSize: 32.0,
                                                                              icon: Icon(
                                                                                Icons.add,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 16.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  AddSubGoalWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'goal': serializeParam(
                                                                                      listViewGoalRecord,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'goal': listViewGoalRecord,
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        5.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      LinearPercentIndicator(
                                                                        percent: functions.calculateWorkProgress(
                                                                            listViewGoalRecord.timeCreated!,
                                                                            listViewGoalRecord.deadline!,
                                                                            listViewGoalRecord.frequency.toList())!,
                                                                        width:
                                                                            1.0,
                                                                        lineHeight:
                                                                            10.0,
                                                                        animation:
                                                                            false,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        barRadius:
                                                                            Radius.circular(5.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            6.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            SubGoalsRecord>>(
                                                                      stream:
                                                                          querySubGoalsRecord(
                                                                        queryBuilder:
                                                                            (subGoalsRecord) =>
                                                                                subGoalsRecord.where(
                                                                          'parentGoal',
                                                                          isEqualTo:
                                                                              listViewGoalRecord.reference,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<SubGoalsRecord>
                                                                            listViewSubGoalsRecordList =
                                                                            snapshot.data!;

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listViewSubGoalsRecordList.length,
                                                                          itemBuilder:
                                                                              (context, listViewIndex) {
                                                                            final listViewSubGoalsRecord =
                                                                                listViewSubGoalsRecordList[listViewIndex];
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  listViewSubGoalsRecord.title,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FlutterFlowIconButton(
                                                                                      borderRadius: 8.0,
                                                                                      buttonSize: 40.0,
                                                                                      icon: Icon(
                                                                                        Icons.edit,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        context.pushNamed(
                                                                                          EditSubGoalWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'subGoals': serializeParam(
                                                                                              listViewSubGoalsRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'subGoals': listViewSubGoalsRecord,
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                    Theme(
                                                                                      data: ThemeData(
                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                          visualDensity: VisualDensity.compact,
                                                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                                          ),
                                                                                        ),
                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                      child: Checkbox(
                                                                                        value: _model.checkboxValueMap2[listViewSubGoalsRecord] ??= listViewSubGoalsRecord.isComplete == true,
                                                                                        onChanged: (newValue) async {
                                                                                          safeSetState(() => _model.checkboxValueMap2[listViewSubGoalsRecord] = newValue!);
                                                                                          if (newValue!) {
                                                                                            await listViewSubGoalsRecord.reference.update(createSubGoalsRecordData(
                                                                                              isComplete: true,
                                                                                            ));
                                                                                          }
                                                                                        },
                                                                                        side: BorderSide(
                                                                                          width: 2,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                        activeColor: FlutterFlowTheme.of(context).secondary,
                                                                                        checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation1']!),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'stackOnPageLoadAnimation1']!);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  PagedListView<DocumentSnapshot<Object?>?,
                                      GoalRecord>(
                                    pagingController:
                                        _model.setListViewController3(
                                      GoalRecord.collection
                                          .where(
                                            'isCompleted',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'owner',
                                            isEqualTo: currentUserReference,
                                          )
                                          .orderBy('time_created',
                                              descending: true),
                                    ),
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    reverse: false,
                                    scrollDirection: Axis.vertical,
                                    builderDelegate:
                                        PagedChildBuilderDelegate<GoalRecord>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Customize what your widget looks like when it's loading another page.
                                      newPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      noItemsFoundIndicatorBuilder: (_) =>
                                          Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.8,
                                        child: EmptyListWidget(),
                                      ),
                                      itemBuilder: (context, _, listViewIndex) {
                                        final listViewGoalRecord = _model
                                            .listViewPagingController3!
                                            .itemList![listViewIndex];
                                        return Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 25.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 0.0, 24.0,
                                                          10.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        GoalDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'goal':
                                                              serializeParam(
                                                            listViewGoalRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'goal':
                                                              listViewGoalRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            listViewGoalRecord.title,
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter Tight',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            listViewGoalRecord.description,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  lineHeight: 1.4,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      5.0,
                                                                      10.0,
                                                                      5.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                SubGoalsRecord>>(
                                                          stream:
                                                              querySubGoalsRecord(
                                                            queryBuilder:
                                                                (subGoalsRecord) =>
                                                                    subGoalsRecord
                                                                        .where(
                                                              'parentGoal',
                                                              isEqualTo:
                                                                  listViewGoalRecord
                                                                      .reference,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<SubGoalsRecord>
                                                                listViewSubGoalsRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewSubGoalsRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewSubGoalsRecord =
                                                                    listViewSubGoalsRecordList[
                                                                        listViewIndex];
                                                                return Text(
                                                                  listViewSubGoalsRecord
                                                                      .title,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation2']!),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'stackOnPageLoadAnimation2']!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
