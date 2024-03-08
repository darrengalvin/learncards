// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoSettingsStruct extends FFFirebaseStruct {
  VideoSettingsStruct({
    String? theVideo,
    int? height,
    int? width,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _theVideo = theVideo,
        _height = height,
        _width = width,
        super(firestoreUtilData);

  // "theVideo" field.
  String? _theVideo;
  String get theVideo => _theVideo ?? '';
  set theVideo(String? val) => _theVideo = val;
  bool hasTheVideo() => _theVideo != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;
  void incrementHeight(int amount) => _height = height + amount;
  bool hasHeight() => _height != null;

  // "width" field.
  int? _width;
  int get width => _width ?? 0;
  set width(int? val) => _width = val;
  void incrementWidth(int amount) => _width = width + amount;
  bool hasWidth() => _width != null;

  static VideoSettingsStruct fromMap(Map<String, dynamic> data) =>
      VideoSettingsStruct(
        theVideo: data['theVideo'] as String?,
        height: castToType<int>(data['height']),
        width: castToType<int>(data['width']),
      );

  static VideoSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'theVideo': _theVideo,
        'height': _height,
        'width': _width,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'theVideo': serializeParam(
          _theVideo,
          ParamType.String,
        ),
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
        'width': serializeParam(
          _width,
          ParamType.int,
        ),
      }.withoutNulls;

  static VideoSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoSettingsStruct(
        theVideo: deserializeParam(
          data['theVideo'],
          ParamType.String,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.int,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.int,
          false,
        ),
      );

  static VideoSettingsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      VideoSettingsStruct(
        theVideo: convertAlgoliaParam(
          data['theVideo'],
          ParamType.String,
          false,
        ),
        height: convertAlgoliaParam(
          data['height'],
          ParamType.int,
          false,
        ),
        width: convertAlgoliaParam(
          data['width'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'VideoSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoSettingsStruct &&
        theVideo == other.theVideo &&
        height == other.height &&
        width == other.width;
  }

  @override
  int get hashCode => const ListEquality().hash([theVideo, height, width]);
}

VideoSettingsStruct createVideoSettingsStruct({
  String? theVideo,
  int? height,
  int? width,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideoSettingsStruct(
      theVideo: theVideo,
      height: height,
      width: width,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideoSettingsStruct? updateVideoSettingsStruct(
  VideoSettingsStruct? videoSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    videoSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideoSettingsStructData(
  Map<String, dynamic> firestoreData,
  VideoSettingsStruct? videoSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (videoSettings == null) {
    return;
  }
  if (videoSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && videoSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videoSettingsData =
      getVideoSettingsFirestoreData(videoSettings, forFieldValue);
  final nestedData =
      videoSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = videoSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideoSettingsFirestoreData(
  VideoSettingsStruct? videoSettings, [
  bool forFieldValue = false,
]) {
  if (videoSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(videoSettings.toMap());

  // Add any Firestore field values
  videoSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideoSettingsListFirestoreData(
  List<VideoSettingsStruct>? videoSettingss,
) =>
    videoSettingss
        ?.map((e) => getVideoSettingsFirestoreData(e, true))
        .toList() ??
    [];
