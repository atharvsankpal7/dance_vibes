import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _DefaultDate = prefs.containsKey('ff_DefaultDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_DefaultDate')!)
          : _DefaultDate;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _OnBoardingGoalList = [];
  List<String> get OnBoardingGoalList => _OnBoardingGoalList;
  set OnBoardingGoalList(List<String> value) {
    _OnBoardingGoalList = value;
  }

  void addToOnBoardingGoalList(String value) {
    OnBoardingGoalList.add(value);
  }

  void removeFromOnBoardingGoalList(String value) {
    OnBoardingGoalList.remove(value);
  }

  void removeAtIndexFromOnBoardingGoalList(int index) {
    OnBoardingGoalList.removeAt(index);
  }

  void updateOnBoardingGoalListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    OnBoardingGoalList[index] = updateFn(_OnBoardingGoalList[index]);
  }

  void insertAtIndexInOnBoardingGoalList(int index, String value) {
    OnBoardingGoalList.insert(index, value);
  }

  List<String> _OnBoardingFeatureList = [];
  List<String> get OnBoardingFeatureList => _OnBoardingFeatureList;
  set OnBoardingFeatureList(List<String> value) {
    _OnBoardingFeatureList = value;
  }

  void addToOnBoardingFeatureList(String value) {
    OnBoardingFeatureList.add(value);
  }

  void removeFromOnBoardingFeatureList(String value) {
    OnBoardingFeatureList.remove(value);
  }

  void removeAtIndexFromOnBoardingFeatureList(int index) {
    OnBoardingFeatureList.removeAt(index);
  }

  void updateOnBoardingFeatureListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    OnBoardingFeatureList[index] = updateFn(_OnBoardingFeatureList[index]);
  }

  void insertAtIndexInOnBoardingFeatureList(int index, String value) {
    OnBoardingFeatureList.insert(index, value);
  }

  DateTime? _DefaultDate = DateTime.fromMillisecondsSinceEpoch(1740066360000);
  DateTime? get DefaultDate => _DefaultDate;
  set DefaultDate(DateTime? value) {
    _DefaultDate = value;
    value != null
        ? prefs.setInt('ff_DefaultDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_DefaultDate');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
