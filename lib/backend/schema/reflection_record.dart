import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReflectionRecord extends FirestoreRecord {
  ReflectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Goal" field.
  DocumentReference? _goal;
  DocumentReference? get goal => _goal;
  bool hasGoal() => _goal != null;

  // "thoughts" field.
  String? _thoughts;
  String get thoughts => _thoughts ?? '';
  bool hasThoughts() => _thoughts != null;

  // "journey" field.
  String? _journey;
  String get journey => _journey ?? '';
  bool hasJourney() => _journey != null;

  // "perspective" field.
  String? _perspective;
  String get perspective => _perspective ?? '';
  bool hasPerspective() => _perspective != null;

  // "celebration" field.
  String? _celebration;
  String get celebration => _celebration ?? '';
  bool hasCelebration() => _celebration != null;

  // "nextSteps" field.
  String? _nextSteps;
  String get nextSteps => _nextSteps ?? '';
  bool hasNextSteps() => _nextSteps != null;

  // "Habit" field.
  DocumentReference? _habit;
  DocumentReference? get habit => _habit;
  bool hasHabit() => _habit != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _goal = snapshotData['Goal'] as DocumentReference?;
    _thoughts = snapshotData['thoughts'] as String?;
    _journey = snapshotData['journey'] as String?;
    _perspective = snapshotData['perspective'] as String?;
    _celebration = snapshotData['celebration'] as String?;
    _nextSteps = snapshotData['nextSteps'] as String?;
    _habit = snapshotData['Habit'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reflection');

  static Stream<ReflectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReflectionRecord.fromSnapshot(s));

  static Future<ReflectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReflectionRecord.fromSnapshot(s));

  static ReflectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReflectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReflectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReflectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReflectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReflectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReflectionRecordData({
  DocumentReference? goal,
  String? thoughts,
  String? journey,
  String? perspective,
  String? celebration,
  String? nextSteps,
  DocumentReference? habit,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Goal': goal,
      'thoughts': thoughts,
      'journey': journey,
      'perspective': perspective,
      'celebration': celebration,
      'nextSteps': nextSteps,
      'Habit': habit,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReflectionRecordDocumentEquality implements Equality<ReflectionRecord> {
  const ReflectionRecordDocumentEquality();

  @override
  bool equals(ReflectionRecord? e1, ReflectionRecord? e2) {
    return e1?.goal == e2?.goal &&
        e1?.thoughts == e2?.thoughts &&
        e1?.journey == e2?.journey &&
        e1?.perspective == e2?.perspective &&
        e1?.celebration == e2?.celebration &&
        e1?.nextSteps == e2?.nextSteps &&
        e1?.habit == e2?.habit &&
        e1?.date == e2?.date;
  }

  @override
  int hash(ReflectionRecord? e) => const ListEquality().hash([
        e?.goal,
        e?.thoughts,
        e?.journey,
        e?.perspective,
        e?.celebration,
        e?.nextSteps,
        e?.habit,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is ReflectionRecord;
}
