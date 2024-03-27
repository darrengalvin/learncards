// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageContentStruct extends FFFirebaseStruct {
  ImageContentStruct({
    String? name,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _image = image,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static ImageContentStruct fromMap(Map<String, dynamic> data) =>
      ImageContentStruct(
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  static ImageContentStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageContentStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  static ImageContentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ImageContentStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ImageContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageContentStruct &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([name, image]);
}

ImageContentStruct createImageContentStruct({
  String? name,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageContentStruct(
      name: name,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageContentStruct? updateImageContentStruct(
  ImageContentStruct? imageContent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageContent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageContentStructData(
  Map<String, dynamic> firestoreData,
  ImageContentStruct? imageContent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageContent == null) {
    return;
  }
  if (imageContent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageContent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageContentData =
      getImageContentFirestoreData(imageContent, forFieldValue);
  final nestedData =
      imageContentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageContent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageContentFirestoreData(
  ImageContentStruct? imageContent, [
  bool forFieldValue = false,
]) {
  if (imageContent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageContent.toMap());

  // Add any Firestore field values
  imageContent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageContentListFirestoreData(
  List<ImageContentStruct>? imageContents,
) =>
    imageContents?.map((e) => getImageContentFirestoreData(e, true)).toList() ??
    [];
