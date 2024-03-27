// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigStruct extends FFFirebaseStruct {
  ConfigStruct({
    String? configtype,
    bool? isSingleValue,
    String? configKey,
    List<int>? configInt,
    String? configString,
    List<int>? valueInt,
    List<String>? valueString,
    bool? valueBool,
    Color? valueColour,
    List<String>? valueImage,
    List<String>? valueVideo,
    String? valueAudio,
    List<DateTime>? valueDateTime,
    List<LatLng>? valueLatLng,
    List<double>? valueDouble,
    List<String>? configlabel,
    bool? isConfigLabel,
    bool? isValueLabels,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _configtype = configtype,
        _isSingleValue = isSingleValue,
        _configKey = configKey,
        _configInt = configInt,
        _configString = configString,
        _valueInt = valueInt,
        _valueString = valueString,
        _valueBool = valueBool,
        _valueColour = valueColour,
        _valueImage = valueImage,
        _valueVideo = valueVideo,
        _valueAudio = valueAudio,
        _valueDateTime = valueDateTime,
        _valueLatLng = valueLatLng,
        _valueDouble = valueDouble,
        _configlabel = configlabel,
        _isConfigLabel = isConfigLabel,
        _isValueLabels = isValueLabels,
        super(firestoreUtilData);

  // "configtype" field.
  String? _configtype;
  String get configtype => _configtype ?? '';
  set configtype(String? val) => _configtype = val;
  bool hasConfigtype() => _configtype != null;

  // "isSingleValue" field.
  bool? _isSingleValue;
  bool get isSingleValue => _isSingleValue ?? false;
  set isSingleValue(bool? val) => _isSingleValue = val;
  bool hasIsSingleValue() => _isSingleValue != null;

  // "configKey" field.
  String? _configKey;
  String get configKey => _configKey ?? '';
  set configKey(String? val) => _configKey = val;
  bool hasConfigKey() => _configKey != null;

  // "configInt" field.
  List<int>? _configInt;
  List<int> get configInt => _configInt ?? const [];
  set configInt(List<int>? val) => _configInt = val;
  void updateConfigInt(Function(List<int>) updateFn) =>
      updateFn(_configInt ??= []);
  bool hasConfigInt() => _configInt != null;

  // "configString" field.
  String? _configString;
  String get configString => _configString ?? '';
  set configString(String? val) => _configString = val;
  bool hasConfigString() => _configString != null;

  // "valueInt" field.
  List<int>? _valueInt;
  List<int> get valueInt => _valueInt ?? const [];
  set valueInt(List<int>? val) => _valueInt = val;
  void updateValueInt(Function(List<int>) updateFn) =>
      updateFn(_valueInt ??= []);
  bool hasValueInt() => _valueInt != null;

  // "valueString" field.
  List<String>? _valueString;
  List<String> get valueString => _valueString ?? const [];
  set valueString(List<String>? val) => _valueString = val;
  void updateValueString(Function(List<String>) updateFn) =>
      updateFn(_valueString ??= []);
  bool hasValueString() => _valueString != null;

  // "valueBool" field.
  bool? _valueBool;
  bool get valueBool => _valueBool ?? false;
  set valueBool(bool? val) => _valueBool = val;
  bool hasValueBool() => _valueBool != null;

  // "valueColour" field.
  Color? _valueColour;
  Color? get valueColour => _valueColour;
  set valueColour(Color? val) => _valueColour = val;
  bool hasValueColour() => _valueColour != null;

  // "valueImage" field.
  List<String>? _valueImage;
  List<String> get valueImage => _valueImage ?? const [];
  set valueImage(List<String>? val) => _valueImage = val;
  void updateValueImage(Function(List<String>) updateFn) =>
      updateFn(_valueImage ??= []);
  bool hasValueImage() => _valueImage != null;

  // "valueVideo" field.
  List<String>? _valueVideo;
  List<String> get valueVideo => _valueVideo ?? const [];
  set valueVideo(List<String>? val) => _valueVideo = val;
  void updateValueVideo(Function(List<String>) updateFn) =>
      updateFn(_valueVideo ??= []);
  bool hasValueVideo() => _valueVideo != null;

  // "valueAudio" field.
  String? _valueAudio;
  String get valueAudio => _valueAudio ?? '';
  set valueAudio(String? val) => _valueAudio = val;
  bool hasValueAudio() => _valueAudio != null;

  // "valueDateTime" field.
  List<DateTime>? _valueDateTime;
  List<DateTime> get valueDateTime => _valueDateTime ?? const [];
  set valueDateTime(List<DateTime>? val) => _valueDateTime = val;
  void updateValueDateTime(Function(List<DateTime>) updateFn) =>
      updateFn(_valueDateTime ??= []);
  bool hasValueDateTime() => _valueDateTime != null;

  // "valueLatLng" field.
  List<LatLng>? _valueLatLng;
  List<LatLng> get valueLatLng => _valueLatLng ?? const [];
  set valueLatLng(List<LatLng>? val) => _valueLatLng = val;
  void updateValueLatLng(Function(List<LatLng>) updateFn) =>
      updateFn(_valueLatLng ??= []);
  bool hasValueLatLng() => _valueLatLng != null;

  // "valueDouble" field.
  List<double>? _valueDouble;
  List<double> get valueDouble => _valueDouble ?? const [];
  set valueDouble(List<double>? val) => _valueDouble = val;
  void updateValueDouble(Function(List<double>) updateFn) =>
      updateFn(_valueDouble ??= []);
  bool hasValueDouble() => _valueDouble != null;

  // "configlabel" field.
  List<String>? _configlabel;
  List<String> get configlabel => _configlabel ?? const [];
  set configlabel(List<String>? val) => _configlabel = val;
  void updateConfiglabel(Function(List<String>) updateFn) =>
      updateFn(_configlabel ??= []);
  bool hasConfiglabel() => _configlabel != null;

  // "isConfigLabel" field.
  bool? _isConfigLabel;
  bool get isConfigLabel => _isConfigLabel ?? false;
  set isConfigLabel(bool? val) => _isConfigLabel = val;
  bool hasIsConfigLabel() => _isConfigLabel != null;

  // "isValueLabels" field.
  bool? _isValueLabels;
  bool get isValueLabels => _isValueLabels ?? false;
  set isValueLabels(bool? val) => _isValueLabels = val;
  bool hasIsValueLabels() => _isValueLabels != null;

  static ConfigStruct fromMap(Map<String, dynamic> data) => ConfigStruct(
        configtype: data['configtype'] as String?,
        isSingleValue: data['isSingleValue'] as bool?,
        configKey: data['configKey'] as String?,
        configInt: getDataList(data['configInt']),
        configString: data['configString'] as String?,
        valueInt: getDataList(data['valueInt']),
        valueString: getDataList(data['valueString']),
        valueBool: data['valueBool'] as bool?,
        valueColour: getSchemaColor(data['valueColour']),
        valueImage: getDataList(data['valueImage']),
        valueVideo: getDataList(data['valueVideo']),
        valueAudio: data['valueAudio'] as String?,
        valueDateTime: getDataList(data['valueDateTime']),
        valueLatLng: getDataList(data['valueLatLng']),
        valueDouble: getDataList(data['valueDouble']),
        configlabel: getDataList(data['configlabel']),
        isConfigLabel: data['isConfigLabel'] as bool?,
        isValueLabels: data['isValueLabels'] as bool?,
      );

  static ConfigStruct? maybeFromMap(dynamic data) =>
      data is Map ? ConfigStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'configtype': _configtype,
        'isSingleValue': _isSingleValue,
        'configKey': _configKey,
        'configInt': _configInt,
        'configString': _configString,
        'valueInt': _valueInt,
        'valueString': _valueString,
        'valueBool': _valueBool,
        'valueColour': _valueColour,
        'valueImage': _valueImage,
        'valueVideo': _valueVideo,
        'valueAudio': _valueAudio,
        'valueDateTime': _valueDateTime,
        'valueLatLng': _valueLatLng,
        'valueDouble': _valueDouble,
        'configlabel': _configlabel,
        'isConfigLabel': _isConfigLabel,
        'isValueLabels': _isValueLabels,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'configtype': serializeParam(
          _configtype,
          ParamType.String,
        ),
        'isSingleValue': serializeParam(
          _isSingleValue,
          ParamType.bool,
        ),
        'configKey': serializeParam(
          _configKey,
          ParamType.String,
        ),
        'configInt': serializeParam(
          _configInt,
          ParamType.int,
          true,
        ),
        'configString': serializeParam(
          _configString,
          ParamType.String,
        ),
        'valueInt': serializeParam(
          _valueInt,
          ParamType.int,
          true,
        ),
        'valueString': serializeParam(
          _valueString,
          ParamType.String,
          true,
        ),
        'valueBool': serializeParam(
          _valueBool,
          ParamType.bool,
        ),
        'valueColour': serializeParam(
          _valueColour,
          ParamType.Color,
        ),
        'valueImage': serializeParam(
          _valueImage,
          ParamType.String,
          true,
        ),
        'valueVideo': serializeParam(
          _valueVideo,
          ParamType.String,
          true,
        ),
        'valueAudio': serializeParam(
          _valueAudio,
          ParamType.String,
        ),
        'valueDateTime': serializeParam(
          _valueDateTime,
          ParamType.DateTime,
          true,
        ),
        'valueLatLng': serializeParam(
          _valueLatLng,
          ParamType.LatLng,
          true,
        ),
        'valueDouble': serializeParam(
          _valueDouble,
          ParamType.double,
          true,
        ),
        'configlabel': serializeParam(
          _configlabel,
          ParamType.String,
          true,
        ),
        'isConfigLabel': serializeParam(
          _isConfigLabel,
          ParamType.bool,
        ),
        'isValueLabels': serializeParam(
          _isValueLabels,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigStruct(
        configtype: deserializeParam(
          data['configtype'],
          ParamType.String,
          false,
        ),
        isSingleValue: deserializeParam(
          data['isSingleValue'],
          ParamType.bool,
          false,
        ),
        configKey: deserializeParam(
          data['configKey'],
          ParamType.String,
          false,
        ),
        configInt: deserializeParam<int>(
          data['configInt'],
          ParamType.int,
          true,
        ),
        configString: deserializeParam(
          data['configString'],
          ParamType.String,
          false,
        ),
        valueInt: deserializeParam<int>(
          data['valueInt'],
          ParamType.int,
          true,
        ),
        valueString: deserializeParam<String>(
          data['valueString'],
          ParamType.String,
          true,
        ),
        valueBool: deserializeParam(
          data['valueBool'],
          ParamType.bool,
          false,
        ),
        valueColour: deserializeParam(
          data['valueColour'],
          ParamType.Color,
          false,
        ),
        valueImage: deserializeParam<String>(
          data['valueImage'],
          ParamType.String,
          true,
        ),
        valueVideo: deserializeParam<String>(
          data['valueVideo'],
          ParamType.String,
          true,
        ),
        valueAudio: deserializeParam(
          data['valueAudio'],
          ParamType.String,
          false,
        ),
        valueDateTime: deserializeParam<DateTime>(
          data['valueDateTime'],
          ParamType.DateTime,
          true,
        ),
        valueLatLng: deserializeParam<LatLng>(
          data['valueLatLng'],
          ParamType.LatLng,
          true,
        ),
        valueDouble: deserializeParam<double>(
          data['valueDouble'],
          ParamType.double,
          true,
        ),
        configlabel: deserializeParam<String>(
          data['configlabel'],
          ParamType.String,
          true,
        ),
        isConfigLabel: deserializeParam(
          data['isConfigLabel'],
          ParamType.bool,
          false,
        ),
        isValueLabels: deserializeParam(
          data['isValueLabels'],
          ParamType.bool,
          false,
        ),
      );

  static ConfigStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ConfigStruct(
        configtype: convertAlgoliaParam(
          data['configtype'],
          ParamType.String,
          false,
        ),
        isSingleValue: convertAlgoliaParam(
          data['isSingleValue'],
          ParamType.bool,
          false,
        ),
        configKey: convertAlgoliaParam(
          data['configKey'],
          ParamType.String,
          false,
        ),
        configInt: convertAlgoliaParam<int>(
          data['configInt'],
          ParamType.int,
          true,
        ),
        configString: convertAlgoliaParam(
          data['configString'],
          ParamType.String,
          false,
        ),
        valueInt: convertAlgoliaParam<int>(
          data['valueInt'],
          ParamType.int,
          true,
        ),
        valueString: convertAlgoliaParam<String>(
          data['valueString'],
          ParamType.String,
          true,
        ),
        valueBool: convertAlgoliaParam(
          data['valueBool'],
          ParamType.bool,
          false,
        ),
        valueColour: convertAlgoliaParam(
          data['valueColour'],
          ParamType.Color,
          false,
        ),
        valueImage: convertAlgoliaParam<String>(
          data['valueImage'],
          ParamType.String,
          true,
        ),
        valueVideo: convertAlgoliaParam<String>(
          data['valueVideo'],
          ParamType.String,
          true,
        ),
        valueAudio: convertAlgoliaParam(
          data['valueAudio'],
          ParamType.String,
          false,
        ),
        valueDateTime: convertAlgoliaParam<DateTime>(
          data['valueDateTime'],
          ParamType.DateTime,
          true,
        ),
        valueLatLng: convertAlgoliaParam<LatLng>(
          data,
          ParamType.LatLng,
          true,
        ),
        valueDouble: convertAlgoliaParam<double>(
          data['valueDouble'],
          ParamType.double,
          true,
        ),
        configlabel: convertAlgoliaParam<String>(
          data['configlabel'],
          ParamType.String,
          true,
        ),
        isConfigLabel: convertAlgoliaParam(
          data['isConfigLabel'],
          ParamType.bool,
          false,
        ),
        isValueLabels: convertAlgoliaParam(
          data['isValueLabels'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigStruct &&
        configtype == other.configtype &&
        isSingleValue == other.isSingleValue &&
        configKey == other.configKey &&
        listEquality.equals(configInt, other.configInt) &&
        configString == other.configString &&
        listEquality.equals(valueInt, other.valueInt) &&
        listEquality.equals(valueString, other.valueString) &&
        valueBool == other.valueBool &&
        valueColour == other.valueColour &&
        listEquality.equals(valueImage, other.valueImage) &&
        listEquality.equals(valueVideo, other.valueVideo) &&
        valueAudio == other.valueAudio &&
        listEquality.equals(valueDateTime, other.valueDateTime) &&
        listEquality.equals(valueLatLng, other.valueLatLng) &&
        listEquality.equals(valueDouble, other.valueDouble) &&
        listEquality.equals(configlabel, other.configlabel) &&
        isConfigLabel == other.isConfigLabel &&
        isValueLabels == other.isValueLabels;
  }

  @override
  int get hashCode => const ListEquality().hash([
        configtype,
        isSingleValue,
        configKey,
        configInt,
        configString,
        valueInt,
        valueString,
        valueBool,
        valueColour,
        valueImage,
        valueVideo,
        valueAudio,
        valueDateTime,
        valueLatLng,
        valueDouble,
        configlabel,
        isConfigLabel,
        isValueLabels
      ]);
}

ConfigStruct createConfigStruct({
  String? configtype,
  bool? isSingleValue,
  String? configKey,
  String? configString,
  bool? valueBool,
  Color? valueColour,
  String? valueAudio,
  bool? isConfigLabel,
  bool? isValueLabels,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigStruct(
      configtype: configtype,
      isSingleValue: isSingleValue,
      configKey: configKey,
      configString: configString,
      valueBool: valueBool,
      valueColour: valueColour,
      valueAudio: valueAudio,
      isConfigLabel: isConfigLabel,
      isValueLabels: isValueLabels,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigStruct? updateConfigStruct(
  ConfigStruct? config, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    config
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigStructData(
  Map<String, dynamic> firestoreData,
  ConfigStruct? config,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (config == null) {
    return;
  }
  if (config.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && config.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configData = getConfigFirestoreData(config, forFieldValue);
  final nestedData = configData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = config.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigFirestoreData(
  ConfigStruct? config, [
  bool forFieldValue = false,
]) {
  if (config == null) {
    return {};
  }
  final firestoreData = mapToFirestore(config.toMap());

  // Add any Firestore field values
  config.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigListFirestoreData(
  List<ConfigStruct>? configs,
) =>
    configs?.map((e) => getConfigFirestoreData(e, true)).toList() ?? [];
