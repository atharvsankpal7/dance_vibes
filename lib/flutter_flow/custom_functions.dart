import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getTodaysDay() {
// return today's day in camelcase
  var now = DateTime.now();
  var formatter = DateFormat('EEEE');
  var day = formatter.format(now);
  return day.substring(0, 1).toUpperCase() + day.substring(1);
}

double? calculateWorkProgress(
  DateTime startDate,
  DateTime endDate,
  List<String> workingDays,
) {
  // Normalize dates to start of day to ensure consistent calculations
  startDate = DateTime(startDate.year, startDate.month, startDate.day);
  endDate = DateTime(endDate.year, endDate.month, endDate.day);
  final currentDate = DateTime.now();

  // Convert day names to integers (Monday = 1, Sunday = 7)
  final workingDayNumbers = workingDays.map((day) {
    final Map<String, int> dayToNumber = {
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      'Sunday': 7,
    };
    return dayToNumber[day] ?? 0;
  }).toList();

  // Function to count working days between two dates
  int countWorkingDays(DateTime from, DateTime to) {
    int workingDaysCount = 0;
    DateTime current = from;

    while (current.isBefore(to) || current.isAtSameMomentAs(to)) {
      // weekday in Dart is 1 (Monday) through 7 (Sunday)
      if (workingDayNumbers.contains(current.weekday)) {
        workingDaysCount++;
      }
      current = current.add(const Duration(days: 1));
    }

    return workingDaysCount;
  }

  // Calculate total working days in project
  final totalWorkingDays = countWorkingDays(startDate, endDate);

  // Calculate elapsed working days
  final DateTime effectiveCurrentDate = currentDate.isBefore(startDate)
      ? startDate
      : (currentDate.isAfter(endDate) ? endDate : currentDate);
  final elapsedWorkingDays = countWorkingDays(startDate, effectiveCurrentDate);

  // Calculate progress percentage
  if (totalWorkingDays == 0) return 0.0;

  double progress = (elapsedWorkingDays / totalWorkingDays) * 100;

  // Ensure progress is between 0 and 100
  return (progress.clamp(0.0, 100.0)) / 100;
}

bool doneToday(DateTime recievedDate) {
  DateTime todayDate = DateTime.now();

  if (todayDate.day == recievedDate.day &&
      todayDate.month == recievedDate.month &&
      todayDate.year == recievedDate.year) {
    return true;
  } else {
    return false;
  }
}
