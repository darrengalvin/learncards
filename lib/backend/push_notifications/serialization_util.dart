import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '../../flutter_flow/lat_lng.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String dateTimeRangeToString(DateTimeRange dateTimeRange) {
  final startStr = dateTimeRange.start.millisecondsSinceEpoch.toString();
  final endStr = dateTimeRange.end.millisecondsSinceEpoch.toString();
  return '$startStr|$endStr';
}

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

/// Converts the input value into a value that can be JSON encoded.
dynamic serializeParameter(dynamic value) {
  switch (value.runtimeType) {
    case DateTime:
      return (value as DateTime).millisecondsSinceEpoch;
    case DateTimeRange:
      return dateTimeRangeToString(value as DateTimeRange);
    case LatLng:
      return (value as LatLng).serialize();
    case Color:
      return (value as Color).toCssString();
    case FFPlace:
      return placeToString(value as FFPlace);
    case FFUploadedFile:
      return uploadedFileToString(value as FFUploadedFile);
    case SupabaseDataRow:
      return json.encode((value as SupabaseDataRow).data);
  }

  if (value is DocumentReference) {
    return value.path;
  }

  if (value is FirestoreRecord) {
    return (value as dynamic).reference.path;
  }

  return value;
}

String serializeParameterData(Map<String, dynamic> parameterData) => jsonEncode(
      parameterData.map(
        (key, value) => MapEntry(
          key,
          serializeParameter(value),
        ),
      )..removeWhere((k, v) => k == null || v == null),
    );

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
  final pieces = dateTimeRangeStr.split('|');
  if (pieces.length != 2) {
    return null;
  }
  return DateTimeRange(
    start: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.first)),
    end: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.last)),
  );
}

LatLng? latLngFromString(String? latLngStr) {
  final pieces = latLngStr?.split(',');
  if (pieces == null || pieces.length != 2) {
    return null;
  }
  return LatLng(
    double.parse(pieces.first.trim()),
    double.parse(pieces.last.trim()),
  );
}

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  final data = {
    'latLng': serializedData.containsKey('latLng')
        ? latLngFromString(serializedData['latLng'] as String)
        : const LatLng(0.0, 0.0),
    'name': serializedData['name'] ?? '',
    'address': serializedData['address'] ?? '',
    'city': serializedData['city'] ?? '',
    'state': serializedData['state'] ?? '',
    'country': serializedData['country'] ?? '',
    'zipCode': serializedData['zipCode'] ?? '',
  };
  return FFPlace(
    latLng: data['latLng'] as LatLng,
    name: data['name'] as String,
    address: data['address'] as String,
    city: data['city'] as String,
    state: data['state'] as String,
    country: data['country'] as String,
    zipCode: data['zipCode'] as String,
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

T? getParameter<T>(Map<String, dynamic> data, String paramName) {
  try {
    if (!data.containsKey(paramName)) {
      return null;
    }
    final param = data[paramName];
    switch (T) {
      case String:
        return param;
      case double:
        return param.toDouble();
      case DateTime:
        return DateTime.fromMillisecondsSinceEpoch(param) as T;
      case DateTimeRange:
        return dateTimeRangeFromString(param) as T;
      case LatLng:
        return latLngFromString(param) as T;
      case Color:
        return fromCssColor(param) as T;
      case FFPlace:
        return placeFromString(param) as T;
      case FFUploadedFile:
        return uploadedFileFromString(param) as T;
      case SessionRow:
        return SessionRow(json.decode(param) as Map<String, dynamic>) as T;
      case WatermillOffsetsMessageTokenCountRow:
        return WatermillOffsetsMessageTokenCountRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillPoisonQueueRow:
        return WatermillPoisonQueueRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillMessageNerRow:
        return WatermillMessageNerRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillMessageTokenCountRow:
        return WatermillMessageTokenCountRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillOffsetsMessageSummarizerRow:
        return WatermillOffsetsMessageSummarizerRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillOffsetsMessageSummaryEmbedderRow:
        return WatermillOffsetsMessageSummaryEmbedderRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillMessageIntentRow:
        return WatermillMessageIntentRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillMessageEmbedderRow:
        return WatermillMessageEmbedderRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillMessageSummaryNerRow:
        return WatermillMessageSummaryNerRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillMessageSummaryEmbedderRow:
        return WatermillMessageSummaryEmbedderRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillOffsetsMessageIntentRow:
        return WatermillOffsetsMessageIntentRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillMessageSummarizerRow:
        return WatermillMessageSummarizerRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case WatermillOffsetsMessageEmbedderRow:
        return WatermillOffsetsMessageEmbedderRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case MessageEmbeddingRow:
        return MessageEmbeddingRow(json.decode(param) as Map<String, dynamic>)
            as T;
      case BunMigrationsRow:
        return BunMigrationsRow(json.decode(param) as Map<String, dynamic>)
            as T;
      case WatermillOffsetsMessageSummaryNerRow:
        return WatermillOffsetsMessageSummaryNerRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case SummaryRow:
        return SummaryRow(json.decode(param) as Map<String, dynamic>) as T;
      case WatermillDocumentEmbedderRow:
        return WatermillDocumentEmbedderRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case DocumentCollectionRow:
        return DocumentCollectionRow(json.decode(param) as Map<String, dynamic>)
            as T;
      case UsersRow:
        return UsersRow(json.decode(param) as Map<String, dynamic>) as T;
      case MessageRow:
        return MessageRow(json.decode(param) as Map<String, dynamic>) as T;
      case WatermillOffsetsDocumentEmbedderRow:
        return WatermillOffsetsDocumentEmbedderRow(
            json.decode(param) as Map<String, dynamic>) as T;
      case BunMigrationLocksRow:
        return BunMigrationLocksRow(json.decode(param) as Map<String, dynamic>)
            as T;
      case SummaryEmbeddingRow:
        return SummaryEmbeddingRow(json.decode(param) as Map<String, dynamic>)
            as T;
      case WatermillOffsetsMessageNerRow:
        return WatermillOffsetsMessageNerRow(
            json.decode(param) as Map<String, dynamic>) as T;
    }
    if (param is String) {
      return FirebaseFirestore.instance.doc(param) as T;
    }
    return param;
  } catch (e) {
    print('Error parsing parameter "$paramName": $e');
    return null;
  }
}

Future<T?> getDocumentParameter<T>(
  Map<String, dynamic> data,
  String paramName,
  RecordBuilder<T> recordBuilder,
) {
  if (!data.containsKey(paramName)) {
    return Future.value(null);
  }
  return FirebaseFirestore.instance
      .doc(data[paramName])
      .get()
      .then((s) => recordBuilder(s));
}

/// END DESERIALIZATION HELPERS
