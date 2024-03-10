// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppStruct extends FFFirebaseStruct {
  AppStruct({
    String? name,
    String? details,
    Color? primaryColor,
    Color? secondaryColor,
    Color? primaryText,
    Color? secondaryText,
    String? mainImage,
    String? thumbImage,
    List<String>? modules,
    int? startPage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _details = details,
        _primaryColor = primaryColor,
        _secondaryColor = secondaryColor,
        _primaryText = primaryText,
        _secondaryText = secondaryText,
        _mainImage = mainImage,
        _thumbImage = thumbImage,
        _modules = modules,
        _startPage = startPage,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;
  bool hasDetails() => _details != null;

  // "primaryColor" field.
  Color? _primaryColor;
  Color? get primaryColor => _primaryColor;
  set primaryColor(Color? val) => _primaryColor = val;
  bool hasPrimaryColor() => _primaryColor != null;

  // "secondaryColor" field.
  Color? _secondaryColor;
  Color? get secondaryColor => _secondaryColor;
  set secondaryColor(Color? val) => _secondaryColor = val;
  bool hasSecondaryColor() => _secondaryColor != null;

  // "primaryText" field.
  Color? _primaryText;
  Color? get primaryText => _primaryText;
  set primaryText(Color? val) => _primaryText = val;
  bool hasPrimaryText() => _primaryText != null;

  // "secondaryText" field.
  Color? _secondaryText;
  Color? get secondaryText => _secondaryText;
  set secondaryText(Color? val) => _secondaryText = val;
  bool hasSecondaryText() => _secondaryText != null;

  // "mainImage" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  set mainImage(String? val) => _mainImage = val;
  bool hasMainImage() => _mainImage != null;

  // "thumbImage" field.
  String? _thumbImage;
  String get thumbImage => _thumbImage ?? '';
  set thumbImage(String? val) => _thumbImage = val;
  bool hasThumbImage() => _thumbImage != null;

  // "modules" field.
  List<String>? _modules;
  List<String> get modules => _modules ?? const [];
  set modules(List<String>? val) => _modules = val;
  void updateModules(Function(List<String>) updateFn) =>
      updateFn(_modules ??= []);
  bool hasModules() => _modules != null;

  // "startPage" field.
  int? _startPage;
  int get startPage => _startPage ?? 0;
  set startPage(int? val) => _startPage = val;
  void incrementStartPage(int amount) => _startPage = startPage + amount;
  bool hasStartPage() => _startPage != null;

  static AppStruct fromMap(Map<String, dynamic> data) => AppStruct(
        name: data['name'] as String?,
        details: data['details'] as String?,
        primaryColor: getSchemaColor(data['primaryColor']),
        secondaryColor: getSchemaColor(data['secondaryColor']),
        primaryText: getSchemaColor(data['primaryText']),
        secondaryText: getSchemaColor(data['secondaryText']),
        mainImage: data['mainImage'] as String?,
        thumbImage: data['thumbImage'] as String?,
        modules: getDataList(data['modules']),
        startPage: castToType<int>(data['startPage']),
      );

  static AppStruct? maybeFromMap(dynamic data) =>
      data is Map ? AppStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'details': _details,
        'primaryColor': _primaryColor,
        'secondaryColor': _secondaryColor,
        'primaryText': _primaryText,
        'secondaryText': _secondaryText,
        'mainImage': _mainImage,
        'thumbImage': _thumbImage,
        'modules': _modules,
        'startPage': _startPage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'details': serializeParam(
          _details,
          ParamType.String,
        ),
        'primaryColor': serializeParam(
          _primaryColor,
          ParamType.Color,
        ),
        'secondaryColor': serializeParam(
          _secondaryColor,
          ParamType.Color,
        ),
        'primaryText': serializeParam(
          _primaryText,
          ParamType.Color,
        ),
        'secondaryText': serializeParam(
          _secondaryText,
          ParamType.Color,
        ),
        'mainImage': serializeParam(
          _mainImage,
          ParamType.String,
        ),
        'thumbImage': serializeParam(
          _thumbImage,
          ParamType.String,
        ),
        'modules': serializeParam(
          _modules,
          ParamType.String,
          true,
        ),
        'startPage': serializeParam(
          _startPage,
          ParamType.int,
        ),
      }.withoutNulls;

  static AppStruct fromSerializableMap(Map<String, dynamic> data) => AppStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        details: deserializeParam(
          data['details'],
          ParamType.String,
          false,
        ),
        primaryColor: deserializeParam(
          data['primaryColor'],
          ParamType.Color,
          false,
        ),
        secondaryColor: deserializeParam(
          data['secondaryColor'],
          ParamType.Color,
          false,
        ),
        primaryText: deserializeParam(
          data['primaryText'],
          ParamType.Color,
          false,
        ),
        secondaryText: deserializeParam(
          data['secondaryText'],
          ParamType.Color,
          false,
        ),
        mainImage: deserializeParam(
          data['mainImage'],
          ParamType.String,
          false,
        ),
        thumbImage: deserializeParam(
          data['thumbImage'],
          ParamType.String,
          false,
        ),
        modules: deserializeParam<String>(
          data['modules'],
          ParamType.String,
          true,
        ),
        startPage: deserializeParam(
          data['startPage'],
          ParamType.int,
          false,
        ),
      );

  static AppStruct fromAlgoliaData(Map<String, dynamic> data) => AppStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        details: convertAlgoliaParam(
          data['details'],
          ParamType.String,
          false,
        ),
        primaryColor: convertAlgoliaParam(
          data['primaryColor'],
          ParamType.Color,
          false,
        ),
        secondaryColor: convertAlgoliaParam(
          data['secondaryColor'],
          ParamType.Color,
          false,
        ),
        primaryText: convertAlgoliaParam(
          data['primaryText'],
          ParamType.Color,
          false,
        ),
        secondaryText: convertAlgoliaParam(
          data['secondaryText'],
          ParamType.Color,
          false,
        ),
        mainImage: convertAlgoliaParam(
          data['mainImage'],
          ParamType.String,
          false,
        ),
        thumbImage: convertAlgoliaParam(
          data['thumbImage'],
          ParamType.String,
          false,
        ),
        modules: convertAlgoliaParam<String>(
          data['modules'],
          ParamType.String,
          true,
        ),
        startPage: convertAlgoliaParam(
          data['startPage'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AppStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AppStruct &&
        name == other.name &&
        details == other.details &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        primaryText == other.primaryText &&
        secondaryText == other.secondaryText &&
        mainImage == other.mainImage &&
        thumbImage == other.thumbImage &&
        listEquality.equals(modules, other.modules) &&
        startPage == other.startPage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        details,
        primaryColor,
        secondaryColor,
        primaryText,
        secondaryText,
        mainImage,
        thumbImage,
        modules,
        startPage
      ]);
}

AppStruct createAppStruct({
  String? name,
  String? details,
  Color? primaryColor,
  Color? secondaryColor,
  Color? primaryText,
  Color? secondaryText,
  String? mainImage,
  String? thumbImage,
  int? startPage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppStruct(
      name: name,
      details: details,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      primaryText: primaryText,
      secondaryText: secondaryText,
      mainImage: mainImage,
      thumbImage: thumbImage,
      startPage: startPage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppStruct? updateAppStruct(
  AppStruct? app, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    app
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppStructData(
  Map<String, dynamic> firestoreData,
  AppStruct? app,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (app == null) {
    return;
  }
  if (app.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && app.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appData = getAppFirestoreData(app, forFieldValue);
  final nestedData = appData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = app.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppFirestoreData(
  AppStruct? app, [
  bool forFieldValue = false,
]) {
  if (app == null) {
    return {};
  }
  final firestoreData = mapToFirestore(app.toMap());

  // Add any Firestore field values
  app.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppListFirestoreData(
  List<AppStruct>? apps,
) =>
    apps?.map((e) => getAppFirestoreData(e, true)).toList() ?? [];
