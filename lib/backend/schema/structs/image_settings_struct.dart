// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageSettingsStruct extends FFFirebaseStruct {
  ImageSettingsStruct({
    String? image,
    int? border,
    int? width,
    String? height,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _border = border,
        _width = width,
        _height = height,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "border" field.
  int? _border;
  int get border => _border ?? 0;
  set border(int? val) => _border = val;
  void incrementBorder(int amount) => _border = border + amount;
  bool hasBorder() => _border != null;

  // "width" field.
  int? _width;
  int get width => _width ?? 0;
  set width(int? val) => _width = val;
  void incrementWidth(int amount) => _width = width + amount;
  bool hasWidth() => _width != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  set height(String? val) => _height = val;
  bool hasHeight() => _height != null;

  static ImageSettingsStruct fromMap(Map<String, dynamic> data) =>
      ImageSettingsStruct(
        image: data['image'] as String?,
        border: castToType<int>(data['border']),
        width: castToType<int>(data['width']),
        height: data['height'] as String?,
      );

  static ImageSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'border': _border,
        'width': _width,
        'height': _height,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'border': serializeParam(
          _border,
          ParamType.int,
        ),
        'width': serializeParam(
          _width,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageSettingsStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        border: deserializeParam(
          data['border'],
          ParamType.int,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.String,
          false,
        ),
      );

  static ImageSettingsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ImageSettingsStruct(
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        border: convertAlgoliaParam(
          data['border'],
          ParamType.int,
          false,
        ),
        width: convertAlgoliaParam(
          data['width'],
          ParamType.int,
          false,
        ),
        height: convertAlgoliaParam(
          data['height'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ImageSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageSettingsStruct &&
        image == other.image &&
        border == other.border &&
        width == other.width &&
        height == other.height;
  }

  @override
  int get hashCode => const ListEquality().hash([image, border, width, height]);
}

ImageSettingsStruct createImageSettingsStruct({
  String? image,
  int? border,
  int? width,
  String? height,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageSettingsStruct(
      image: image,
      border: border,
      width: width,
      height: height,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageSettingsStruct? updateImageSettingsStruct(
  ImageSettingsStruct? imageSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageSettingsStructData(
  Map<String, dynamic> firestoreData,
  ImageSettingsStruct? imageSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageSettings == null) {
    return;
  }
  if (imageSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageSettingsData =
      getImageSettingsFirestoreData(imageSettings, forFieldValue);
  final nestedData =
      imageSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageSettingsFirestoreData(
  ImageSettingsStruct? imageSettings, [
  bool forFieldValue = false,
]) {
  if (imageSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageSettings.toMap());

  // Add any Firestore field values
  imageSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageSettingsListFirestoreData(
  List<ImageSettingsStruct>? imageSettingss,
) =>
    imageSettingss
        ?.map((e) => getImageSettingsFirestoreData(e, true))
        .toList() ??
    [];
