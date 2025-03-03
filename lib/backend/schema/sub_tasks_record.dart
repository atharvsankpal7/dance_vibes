import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubTasksRecord extends FirestoreRecord {
  SubTasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "deadLine" field.
  DateTime? _deadLine;
  DateTime? get deadLine => _deadLine;
  bool hasDeadLine() => _deadLine != null;

  // "ParentTask" field.
  DocumentReference? _parentTask;
  DocumentReference? get parentTask => _parentTask;
  bool hasParentTask() => _parentTask != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "Owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _deadLine = snapshotData['deadLine'] as DateTime?;
    _parentTask = snapshotData['ParentTask'] as DocumentReference?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _owner = snapshotData['Owner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SubTasks');

  static Stream<SubTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubTasksRecord.fromSnapshot(s));

  static Future<SubTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubTasksRecord.fromSnapshot(s));

  static SubTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubTasksRecordData({
  String? title,
  DateTime? deadLine,
  DocumentReference? parentTask,
  bool? isComplete,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'deadLine': deadLine,
      'ParentTask': parentTask,
      'isComplete': isComplete,
      'Owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubTasksRecordDocumentEquality implements Equality<SubTasksRecord> {
  const SubTasksRecordDocumentEquality();

  @override
  bool equals(SubTasksRecord? e1, SubTasksRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.deadLine == e2?.deadLine &&
        e1?.parentTask == e2?.parentTask &&
        e1?.isComplete == e2?.isComplete &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(SubTasksRecord? e) => const ListEquality()
      .hash([e?.title, e?.deadLine, e?.parentTask, e?.isComplete, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is SubTasksRecord;
}
