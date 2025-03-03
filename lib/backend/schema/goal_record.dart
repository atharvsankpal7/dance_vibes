import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalRecord extends FirestoreRecord {
  GoalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "deadline" field.
  DateTime? _deadline;
  DateTime? get deadline => _deadline;
  bool hasDeadline() => _deadline != null;

  // "frequency" field.
  List<String>? _frequency;
  List<String> get frequency => _frequency ?? const [];
  bool hasFrequency() => _frequency != null;

  // "reminderTime" field.
  DateTime? _reminderTime;
  DateTime? get reminderTime => _reminderTime;
  bool hasReminderTime() => _reminderTime != null;

  // "reflectionStartingDate" field.
  DateTime? _reflectionStartingDate;
  DateTime? get reflectionStartingDate => _reflectionStartingDate;
  bool hasReflectionStartingDate() => _reflectionStartingDate != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "tobe" field.
  String? _tobe;
  String get tobe => _tobe ?? '';
  bool hasTobe() => _tobe != null;

  // "subGoals" field.
  List<DocumentReference>? _subGoals;
  List<DocumentReference> get subGoals => _subGoals ?? const [];
  bool hasSubGoals() => _subGoals != null;

  // "lastCompleteDate" field.
  DateTime? _lastCompleteDate;
  DateTime? get lastCompleteDate => _lastCompleteDate;
  bool hasLastCompleteDate() => _lastCompleteDate != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _description = snapshotData['description'] as String?;
    _deadline = snapshotData['deadline'] as DateTime?;
    _frequency = getDataList(snapshotData['frequency']);
    _reminderTime = snapshotData['reminderTime'] as DateTime?;
    _reflectionStartingDate =
        snapshotData['reflectionStartingDate'] as DateTime?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _tags = getDataList(snapshotData['tags']);
    _tobe = snapshotData['tobe'] as String?;
    _subGoals = getDataList(snapshotData['subGoals']);
    _lastCompleteDate = snapshotData['lastCompleteDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Goal');

  static Stream<GoalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalRecord.fromSnapshot(s));

  static Future<GoalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalRecord.fromSnapshot(s));

  static GoalRecord fromSnapshot(DocumentSnapshot snapshot) => GoalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalRecordData({
  DocumentReference? owner,
  DateTime? timeCreated,
  String? title,
  bool? isCompleted,
  String? description,
  DateTime? deadline,
  DateTime? reminderTime,
  DateTime? reflectionStartingDate,
  DateTime? createdTime,
  String? tobe,
  DateTime? lastCompleteDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'time_created': timeCreated,
      'title': title,
      'isCompleted': isCompleted,
      'description': description,
      'deadline': deadline,
      'reminderTime': reminderTime,
      'reflectionStartingDate': reflectionStartingDate,
      'created_time': createdTime,
      'tobe': tobe,
      'lastCompleteDate': lastCompleteDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalRecordDocumentEquality implements Equality<GoalRecord> {
  const GoalRecordDocumentEquality();

  @override
  bool equals(GoalRecord? e1, GoalRecord? e2) {
    const listEquality = ListEquality();
    return e1?.owner == e2?.owner &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.title == e2?.title &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.description == e2?.description &&
        e1?.deadline == e2?.deadline &&
        listEquality.equals(e1?.frequency, e2?.frequency) &&
        e1?.reminderTime == e2?.reminderTime &&
        e1?.reflectionStartingDate == e2?.reflectionStartingDate &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.tobe == e2?.tobe &&
        listEquality.equals(e1?.subGoals, e2?.subGoals) &&
        e1?.lastCompleteDate == e2?.lastCompleteDate;
  }

  @override
  int hash(GoalRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.timeCreated,
        e?.title,
        e?.isCompleted,
        e?.description,
        e?.deadline,
        e?.frequency,
        e?.reminderTime,
        e?.reflectionStartingDate,
        e?.createdTime,
        e?.tags,
        e?.tobe,
        e?.subGoals,
        e?.lastCompleteDate
      ]);

  @override
  bool isValidKey(Object? o) => o is GoalRecord;
}
