import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubGoalsRecord extends FirestoreRecord {
  SubGoalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "parentGoal" field.
  DocumentReference? _parentGoal;
  DocumentReference? get parentGoal => _parentGoal;
  bool hasParentGoal() => _parentGoal != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "reminderTime" field.
  DateTime? _reminderTime;
  DateTime? get reminderTime => _reminderTime;
  bool hasReminderTime() => _reminderTime != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _parentGoal = snapshotData['parentGoal'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _reminderTime = snapshotData['reminderTime'] as DateTime?;
    _isComplete = snapshotData['isComplete'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subGoals');

  static Stream<SubGoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubGoalsRecord.fromSnapshot(s));

  static Future<SubGoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubGoalsRecord.fromSnapshot(s));

  static SubGoalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubGoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubGoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubGoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubGoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubGoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubGoalsRecordData({
  DocumentReference? owner,
  DocumentReference? parentGoal,
  String? title,
  DateTime? reminderTime,
  bool? isComplete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'parentGoal': parentGoal,
      'title': title,
      'reminderTime': reminderTime,
      'isComplete': isComplete,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubGoalsRecordDocumentEquality implements Equality<SubGoalsRecord> {
  const SubGoalsRecordDocumentEquality();

  @override
  bool equals(SubGoalsRecord? e1, SubGoalsRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.parentGoal == e2?.parentGoal &&
        e1?.title == e2?.title &&
        e1?.reminderTime == e2?.reminderTime &&
        e1?.isComplete == e2?.isComplete;
  }

  @override
  int hash(SubGoalsRecord? e) => const ListEquality().hash(
      [e?.owner, e?.parentGoal, e?.title, e?.reminderTime, e?.isComplete]);

  @override
  bool isValidKey(Object? o) => o is SubGoalsRecord;
}
