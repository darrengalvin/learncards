// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PageStruct extends FFFirebaseStruct {
  PageStruct({
    DateTime? updatedTime,
    DateTime? createdTime,
    DocumentReference? user,
    String? uid,
    String? name,
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _updatedTime = updatedTime,
        _createdTime = createdTime,
        _user = user,
        _uid = uid,
        _name = name,
        _title = title,
        super(firestoreUtilData);

  // "updatedTime" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  set updatedTime(DateTime? val) => _updatedTime = val;
  bool hasUpdatedTime() => _updatedTime != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  static PageStruct fromMap(Map<String, dynamic> data) => PageStruct(
        updatedTime: data['updatedTime'] as DateTime?,
        createdTime: data['createdTime'] as DateTime?,
        user: data['user'] as DocumentReference?,
        uid: data['uid'] as String?,
        name: data['name'] as String?,
        title: data['title'] as String?,
      );

  static PageStruct? maybeFromMap(dynamic data) =>
      data is Map ? PageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'updatedTime': _updatedTime,
        'createdTime': _createdTime,
        'user': _user,
        'uid': _uid,
        'name': _name,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'updatedTime': serializeParam(
          _updatedTime,
          ParamType.DateTime,
        ),
        'createdTime': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static PageStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageStruct(
        updatedTime: deserializeParam(
          data['updatedTime'],
          ParamType.DateTime,
          false,
        ),
        createdTime: deserializeParam(
          data['createdTime'],
          ParamType.DateTime,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  static PageStruct fromAlgoliaData(Map<String, dynamic> data) => PageStruct(
        updatedTime: convertAlgoliaParam(
          data['updatedTime'],
          ParamType.DateTime,
          false,
        ),
        createdTime: convertAlgoliaParam(
          data['createdTime'],
          ParamType.DateTime,
          false,
        ),
        user: convertAlgoliaParam(
          data['user'],
          ParamType.DocumentReference,
          false,
        ),
        uid: convertAlgoliaParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageStruct &&
        updatedTime == other.updatedTime &&
        createdTime == other.createdTime &&
        user == other.user &&
        uid == other.uid &&
        name == other.name &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([updatedTime, createdTime, user, uid, name, title]);
}

PageStruct createPageStruct({
  DateTime? updatedTime,
  DateTime? createdTime,
  DocumentReference? user,
  String? uid,
  String? name,
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageStruct(
      updatedTime: updatedTime,
      createdTime: createdTime,
      user: user,
      uid: uid,
      name: name,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageStruct? updatePageStruct(
  PageStruct? page, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    page
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageStructData(
  Map<String, dynamic> firestoreData,
  PageStruct? page,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (page == null) {
    return;
  }
  if (page.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && page.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageData = getPageFirestoreData(page, forFieldValue);
  final nestedData = pageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = page.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageFirestoreData(
  PageStruct? page, [
  bool forFieldValue = false,
]) {
  if (page == null) {
    return {};
  }
  final firestoreData = mapToFirestore(page.toMap());

  // Add any Firestore field values
  page.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageListFirestoreData(
  List<PageStruct>? pages,
) =>
    pages?.map((e) => getPageFirestoreData(e, true)).toList() ?? [];
