import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "companylogo" field.
  String? _companylogo;
  String get companylogo => _companylogo ?? '';
  bool hasCompanylogo() => _companylogo != null;

  // "companyname" field.
  String? _companyname;
  String get companyname => _companyname ?? '';
  bool hasCompanyname() => _companyname != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "isowner" field.
  bool? _isowner;
  bool get isowner => _isowner ?? false;
  bool hasIsowner() => _isowner != null;

  // "livelicence" field.
  bool? _livelicence;
  bool get livelicence => _livelicence ?? false;
  bool hasLivelicence() => _livelicence != null;

  // "AILicence" field.
  bool? _aILicence;
  bool get aILicence => _aILicence ?? false;
  bool hasAILicence() => _aILicence != null;

  // "navtype" field.
  String? _navtype;
  String get navtype => _navtype ?? '';
  bool hasNavtype() => _navtype != null;

  // "aiimage" field.
  String? _aiimage;
  String get aiimage => _aiimage ?? '';
  bool hasAiimage() => _aiimage != null;

  // "featureimage" field.
  String? _featureimage;
  String get featureimage => _featureimage ?? '';
  bool hasFeatureimage() => _featureimage != null;

  // "fullfeature" field.
  String? _fullfeature;
  String get fullfeature => _fullfeature ?? '';
  bool hasFullfeature() => _fullfeature != null;

  // "welcometitle" field.
  String? _welcometitle;
  String get welcometitle => _welcometitle ?? '';
  bool hasWelcometitle() => _welcometitle != null;

  // "welcomedescription" field.
  String? _welcomedescription;
  String get welcomedescription => _welcomedescription ?? '';
  bool hasWelcomedescription() => _welcomedescription != null;

  // "companylogoSquare" field.
  String? _companylogoSquare;
  String get companylogoSquare => _companylogoSquare ?? '';
  bool hasCompanylogoSquare() => _companylogoSquare != null;

  // "companylogosquaredark" field.
  String? _companylogosquaredark;
  String get companylogosquaredark => _companylogosquaredark ?? '';
  bool hasCompanylogosquaredark() => _companylogosquaredark != null;

  // "haslivevideo" field.
  bool? _haslivevideo;
  bool get haslivevideo => _haslivevideo ?? false;
  bool hasHaslivevideo() => _haslivevideo != null;

  // "hasai" field.
  bool? _hasai;
  bool get hasai => _hasai ?? false;
  bool hasHasai() => _hasai != null;

  // "hassocialfeed" field.
  bool? _hassocialfeed;
  bool get hassocialfeed => _hassocialfeed ?? false;
  bool hasHassocialfeed() => _hassocialfeed != null;

  // "aiSystemPrompt" field.
  String? _aiSystemPrompt;
  String get aiSystemPrompt => _aiSystemPrompt ?? '';
  bool hasAiSystemPrompt() => _aiSystemPrompt != null;

  // "initialLearnCards" field.
  int? _initialLearnCards;
  int get initialLearnCards => _initialLearnCards ?? 0;
  bool hasInitialLearnCards() => _initialLearnCards != null;

  // "aiLearnCardsPrompt" field.
  String? _aiLearnCardsPrompt;
  String get aiLearnCardsPrompt => _aiLearnCardsPrompt ?? '';
  bool hasAiLearnCardsPrompt() => _aiLearnCardsPrompt != null;

  // "companyDetails" field.
  String? _companyDetails;
  String get companyDetails => _companyDetails ?? '';
  bool hasCompanyDetails() => _companyDetails != null;

  // "backgroundImage" field.
  String? _backgroundImage;
  String get backgroundImage => _backgroundImage ?? '';
  bool hasBackgroundImage() => _backgroundImage != null;

  // "companyAiData" field.
  CompanyDataForAiStruct? _companyAiData;
  CompanyDataForAiStruct get companyAiData =>
      _companyAiData ?? CompanyDataForAiStruct();
  bool hasCompanyAiData() => _companyAiData != null;

  // "whatTheyDo" field.
  String? _whatTheyDo;
  String get whatTheyDo => _whatTheyDo ?? '';
  bool hasWhatTheyDo() => _whatTheyDo != null;

  // "userGatherDataPrompt" field.
  String? _userGatherDataPrompt;
  String get userGatherDataPrompt => _userGatherDataPrompt ?? '';
  bool hasUserGatherDataPrompt() => _userGatherDataPrompt != null;

  // "companyCode" field.
  String? _companyCode;
  String get companyCode => _companyCode ?? '';
  bool hasCompanyCode() => _companyCode != null;

  // "welcomeIntroPrompt" field.
  String? _welcomeIntroPrompt;
  String get welcomeIntroPrompt => _welcomeIntroPrompt ?? '';
  bool hasWelcomeIntroPrompt() => _welcomeIntroPrompt != null;

  // "welcomeMessage" field.
  String? _welcomeMessage;
  String get welcomeMessage => _welcomeMessage ?? '';
  bool hasWelcomeMessage() => _welcomeMessage != null;

  // "primaryTile" field.
  String? _primaryTile;
  String get primaryTile => _primaryTile ?? '';
  bool hasPrimaryTile() => _primaryTile != null;

  // "getTilesPrompt" field.
  String? _getTilesPrompt;
  String get getTilesPrompt => _getTilesPrompt ?? '';
  bool hasGetTilesPrompt() => _getTilesPrompt != null;

  // "getTileContentPromptPrt1" field.
  String? _getTileContentPromptPrt1;
  String get getTileContentPromptPrt1 => _getTileContentPromptPrt1 ?? '';
  bool hasGetTileContentPromptPrt1() => _getTileContentPromptPrt1 != null;

  // "getTileContentPromptPr2" field.
  String? _getTileContentPromptPr2;
  String get getTileContentPromptPr2 => _getTileContentPromptPr2 ?? '';
  bool hasGetTileContentPromptPr2() => _getTileContentPromptPr2 != null;

  // "userGatherDataQuestionPrompt" field.
  String? _userGatherDataQuestionPrompt;
  String get userGatherDataQuestionPrompt =>
      _userGatherDataQuestionPrompt ?? '';
  bool hasUserGatherDataQuestionPrompt() =>
      _userGatherDataQuestionPrompt != null;

  // "getTilesPromptUserMessage" field.
  String? _getTilesPromptUserMessage;
  String get getTilesPromptUserMessage => _getTilesPromptUserMessage ?? '';
  bool hasGetTilesPromptUserMessage() => _getTilesPromptUserMessage != null;

  // "startLearnCardPrompt" field.
  String? _startLearnCardPrompt;
  String get startLearnCardPrompt => _startLearnCardPrompt ?? '';
  bool hasStartLearnCardPrompt() => _startLearnCardPrompt != null;

  // "colors" field.
  ColorsStruct? _colors;
  ColorsStruct get colors => _colors ?? ColorsStruct();
  bool hasColors() => _colors != null;

  // "continueLearnCardPrompt" field.
  String? _continueLearnCardPrompt;
  String get continueLearnCardPrompt => _continueLearnCardPrompt ?? '';
  bool hasContinueLearnCardPrompt() => _continueLearnCardPrompt != null;

  // "supabaseApiKey" field.
  String? _supabaseApiKey;
  String get supabaseApiKey => _supabaseApiKey ?? '';
  bool hasSupabaseApiKey() => _supabaseApiKey != null;

  // "supabaseProjUrl" field.
  String? _supabaseProjUrl;
  String get supabaseProjUrl => _supabaseProjUrl ?? '';
  bool hasSupabaseProjUrl() => _supabaseProjUrl != null;

  // "tableName" field.
  String? _tableName;
  String get tableName => _tableName ?? '';
  bool hasTableName() => _tableName != null;

  // "queryName" field.
  String? _queryName;
  String get queryName => _queryName ?? '';
  bool hasQueryName() => _queryName != null;

  // "isLearnCards" field.
  bool? _isLearnCards;
  bool get isLearnCards => _isLearnCards ?? false;
  bool hasIsLearnCards() => _isLearnCards != null;

  // "flowiseUrl" field.
  String? _flowiseUrl;
  String get flowiseUrl => _flowiseUrl ?? '';
  bool hasFlowiseUrl() => _flowiseUrl != null;

  // "youAreMyCoachPrompt" field.
  String? _youAreMyCoachPrompt;
  String get youAreMyCoachPrompt => _youAreMyCoachPrompt ?? '';
  bool hasYouAreMyCoachPrompt() => _youAreMyCoachPrompt != null;

  // "youAreMyCoachMessage" field.
  String? _youAreMyCoachMessage;
  String get youAreMyCoachMessage => _youAreMyCoachMessage ?? '';
  bool hasYouAreMyCoachMessage() => _youAreMyCoachMessage != null;

  // "welcomeLetterPrompt" field.
  String? _welcomeLetterPrompt;
  String get welcomeLetterPrompt => _welcomeLetterPrompt ?? '';
  bool hasWelcomeLetterPrompt() => _welcomeLetterPrompt != null;

  // "landingUrls" field.
  List<String>? _landingUrls;
  List<String> get landingUrls => _landingUrls ?? const [];
  bool hasLandingUrls() => _landingUrls != null;

  // "startingCategory" field.
  String? _startingCategory;
  String get startingCategory => _startingCategory ?? '';
  bool hasStartingCategory() => _startingCategory != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updatedTime" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "companyDocId" field.
  String? _companyDocId;
  String get companyDocId => _companyDocId ?? '';
  bool hasCompanyDocId() => _companyDocId != null;

  // "startingMemberLevel" field.
  String? _startingMemberLevel;
  String get startingMemberLevel => _startingMemberLevel ?? '';
  bool hasStartingMemberLevel() => _startingMemberLevel != null;

  // "startingMemberLevelName" field.
  String? _startingMemberLevelName;
  String get startingMemberLevelName => _startingMemberLevelName ?? '';
  bool hasStartingMemberLevelName() => _startingMemberLevelName != null;

  // "backgroundImageFilter" field.
  double? _backgroundImageFilter;
  double get backgroundImageFilter => _backgroundImageFilter ?? 0.0;
  bool hasBackgroundImageFilter() => _backgroundImageFilter != null;

  void _initializeFields() {
    _companylogo = snapshotData['companylogo'] as String?;
    _companyname = snapshotData['companyname'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _isowner = snapshotData['isowner'] as bool?;
    _livelicence = snapshotData['livelicence'] as bool?;
    _aILicence = snapshotData['AILicence'] as bool?;
    _navtype = snapshotData['navtype'] as String?;
    _aiimage = snapshotData['aiimage'] as String?;
    _featureimage = snapshotData['featureimage'] as String?;
    _fullfeature = snapshotData['fullfeature'] as String?;
    _welcometitle = snapshotData['welcometitle'] as String?;
    _welcomedescription = snapshotData['welcomedescription'] as String?;
    _companylogoSquare = snapshotData['companylogoSquare'] as String?;
    _companylogosquaredark = snapshotData['companylogosquaredark'] as String?;
    _haslivevideo = snapshotData['haslivevideo'] as bool?;
    _hasai = snapshotData['hasai'] as bool?;
    _hassocialfeed = snapshotData['hassocialfeed'] as bool?;
    _aiSystemPrompt = snapshotData['aiSystemPrompt'] as String?;
    _initialLearnCards = castToType<int>(snapshotData['initialLearnCards']);
    _aiLearnCardsPrompt = snapshotData['aiLearnCardsPrompt'] as String?;
    _companyDetails = snapshotData['companyDetails'] as String?;
    _backgroundImage = snapshotData['backgroundImage'] as String?;
    _companyAiData =
        CompanyDataForAiStruct.maybeFromMap(snapshotData['companyAiData']);
    _whatTheyDo = snapshotData['whatTheyDo'] as String?;
    _userGatherDataPrompt = snapshotData['userGatherDataPrompt'] as String?;
    _companyCode = snapshotData['companyCode'] as String?;
    _welcomeIntroPrompt = snapshotData['welcomeIntroPrompt'] as String?;
    _welcomeMessage = snapshotData['welcomeMessage'] as String?;
    _primaryTile = snapshotData['primaryTile'] as String?;
    _getTilesPrompt = snapshotData['getTilesPrompt'] as String?;
    _getTileContentPromptPrt1 =
        snapshotData['getTileContentPromptPrt1'] as String?;
    _getTileContentPromptPr2 =
        snapshotData['getTileContentPromptPr2'] as String?;
    _userGatherDataQuestionPrompt =
        snapshotData['userGatherDataQuestionPrompt'] as String?;
    _getTilesPromptUserMessage =
        snapshotData['getTilesPromptUserMessage'] as String?;
    _startLearnCardPrompt = snapshotData['startLearnCardPrompt'] as String?;
    _colors = ColorsStruct.maybeFromMap(snapshotData['colors']);
    _continueLearnCardPrompt =
        snapshotData['continueLearnCardPrompt'] as String?;
    _supabaseApiKey = snapshotData['supabaseApiKey'] as String?;
    _supabaseProjUrl = snapshotData['supabaseProjUrl'] as String?;
    _tableName = snapshotData['tableName'] as String?;
    _queryName = snapshotData['queryName'] as String?;
    _isLearnCards = snapshotData['isLearnCards'] as bool?;
    _flowiseUrl = snapshotData['flowiseUrl'] as String?;
    _youAreMyCoachPrompt = snapshotData['youAreMyCoachPrompt'] as String?;
    _youAreMyCoachMessage = snapshotData['youAreMyCoachMessage'] as String?;
    _welcomeLetterPrompt = snapshotData['welcomeLetterPrompt'] as String?;
    _landingUrls = getDataList(snapshotData['landingUrls']);
    _startingCategory = snapshotData['startingCategory'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _updatedTime = snapshotData['updatedTime'] as DateTime?;
    _companyDocId = snapshotData['companyDocId'] as String?;
    _startingMemberLevel = snapshotData['startingMemberLevel'] as String?;
    _startingMemberLevelName =
        snapshotData['startingMemberLevelName'] as String?;
    _backgroundImageFilter =
        castToType<double>(snapshotData['backgroundImageFilter']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesRecordData({
  String? companylogo,
  String? companyname,
  int? id,
  bool? isowner,
  bool? livelicence,
  bool? aILicence,
  String? navtype,
  String? aiimage,
  String? featureimage,
  String? fullfeature,
  String? welcometitle,
  String? welcomedescription,
  String? companylogoSquare,
  String? companylogosquaredark,
  bool? haslivevideo,
  bool? hasai,
  bool? hassocialfeed,
  String? aiSystemPrompt,
  int? initialLearnCards,
  String? aiLearnCardsPrompt,
  String? companyDetails,
  String? backgroundImage,
  CompanyDataForAiStruct? companyAiData,
  String? whatTheyDo,
  String? userGatherDataPrompt,
  String? companyCode,
  String? welcomeIntroPrompt,
  String? welcomeMessage,
  String? primaryTile,
  String? getTilesPrompt,
  String? getTileContentPromptPrt1,
  String? getTileContentPromptPr2,
  String? userGatherDataQuestionPrompt,
  String? getTilesPromptUserMessage,
  String? startLearnCardPrompt,
  ColorsStruct? colors,
  String? continueLearnCardPrompt,
  String? supabaseApiKey,
  String? supabaseProjUrl,
  String? tableName,
  String? queryName,
  bool? isLearnCards,
  String? flowiseUrl,
  String? youAreMyCoachPrompt,
  String? youAreMyCoachMessage,
  String? welcomeLetterPrompt,
  String? startingCategory,
  DateTime? createdTime,
  DateTime? updatedTime,
  String? companyDocId,
  String? startingMemberLevel,
  String? startingMemberLevelName,
  double? backgroundImageFilter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'companylogo': companylogo,
      'companyname': companyname,
      'id': id,
      'isowner': isowner,
      'livelicence': livelicence,
      'AILicence': aILicence,
      'navtype': navtype,
      'aiimage': aiimage,
      'featureimage': featureimage,
      'fullfeature': fullfeature,
      'welcometitle': welcometitle,
      'welcomedescription': welcomedescription,
      'companylogoSquare': companylogoSquare,
      'companylogosquaredark': companylogosquaredark,
      'haslivevideo': haslivevideo,
      'hasai': hasai,
      'hassocialfeed': hassocialfeed,
      'aiSystemPrompt': aiSystemPrompt,
      'initialLearnCards': initialLearnCards,
      'aiLearnCardsPrompt': aiLearnCardsPrompt,
      'companyDetails': companyDetails,
      'backgroundImage': backgroundImage,
      'companyAiData': CompanyDataForAiStruct().toMap(),
      'whatTheyDo': whatTheyDo,
      'userGatherDataPrompt': userGatherDataPrompt,
      'companyCode': companyCode,
      'welcomeIntroPrompt': welcomeIntroPrompt,
      'welcomeMessage': welcomeMessage,
      'primaryTile': primaryTile,
      'getTilesPrompt': getTilesPrompt,
      'getTileContentPromptPrt1': getTileContentPromptPrt1,
      'getTileContentPromptPr2': getTileContentPromptPr2,
      'userGatherDataQuestionPrompt': userGatherDataQuestionPrompt,
      'getTilesPromptUserMessage': getTilesPromptUserMessage,
      'startLearnCardPrompt': startLearnCardPrompt,
      'colors': ColorsStruct().toMap(),
      'continueLearnCardPrompt': continueLearnCardPrompt,
      'supabaseApiKey': supabaseApiKey,
      'supabaseProjUrl': supabaseProjUrl,
      'tableName': tableName,
      'queryName': queryName,
      'isLearnCards': isLearnCards,
      'flowiseUrl': flowiseUrl,
      'youAreMyCoachPrompt': youAreMyCoachPrompt,
      'youAreMyCoachMessage': youAreMyCoachMessage,
      'welcomeLetterPrompt': welcomeLetterPrompt,
      'startingCategory': startingCategory,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'companyDocId': companyDocId,
      'startingMemberLevel': startingMemberLevel,
      'startingMemberLevelName': startingMemberLevelName,
      'backgroundImageFilter': backgroundImageFilter,
    }.withoutNulls,
  );

  // Handle nested data for "companyAiData" field.
  addCompanyDataForAiStructData(firestoreData, companyAiData, 'companyAiData');

  // Handle nested data for "colors" field.
  addColorsStructData(firestoreData, colors, 'colors');

  return firestoreData;
}

class CompaniesRecordDocumentEquality implements Equality<CompaniesRecord> {
  const CompaniesRecordDocumentEquality();

  @override
  bool equals(CompaniesRecord? e1, CompaniesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.companylogo == e2?.companylogo &&
        e1?.companyname == e2?.companyname &&
        e1?.id == e2?.id &&
        e1?.isowner == e2?.isowner &&
        e1?.livelicence == e2?.livelicence &&
        e1?.aILicence == e2?.aILicence &&
        e1?.navtype == e2?.navtype &&
        e1?.aiimage == e2?.aiimage &&
        e1?.featureimage == e2?.featureimage &&
        e1?.fullfeature == e2?.fullfeature &&
        e1?.welcometitle == e2?.welcometitle &&
        e1?.welcomedescription == e2?.welcomedescription &&
        e1?.companylogoSquare == e2?.companylogoSquare &&
        e1?.companylogosquaredark == e2?.companylogosquaredark &&
        e1?.haslivevideo == e2?.haslivevideo &&
        e1?.hasai == e2?.hasai &&
        e1?.hassocialfeed == e2?.hassocialfeed &&
        e1?.aiSystemPrompt == e2?.aiSystemPrompt &&
        e1?.initialLearnCards == e2?.initialLearnCards &&
        e1?.aiLearnCardsPrompt == e2?.aiLearnCardsPrompt &&
        e1?.companyDetails == e2?.companyDetails &&
        e1?.backgroundImage == e2?.backgroundImage &&
        e1?.companyAiData == e2?.companyAiData &&
        e1?.whatTheyDo == e2?.whatTheyDo &&
        e1?.userGatherDataPrompt == e2?.userGatherDataPrompt &&
        e1?.companyCode == e2?.companyCode &&
        e1?.welcomeIntroPrompt == e2?.welcomeIntroPrompt &&
        e1?.welcomeMessage == e2?.welcomeMessage &&
        e1?.primaryTile == e2?.primaryTile &&
        e1?.getTilesPrompt == e2?.getTilesPrompt &&
        e1?.getTileContentPromptPrt1 == e2?.getTileContentPromptPrt1 &&
        e1?.getTileContentPromptPr2 == e2?.getTileContentPromptPr2 &&
        e1?.userGatherDataQuestionPrompt == e2?.userGatherDataQuestionPrompt &&
        e1?.getTilesPromptUserMessage == e2?.getTilesPromptUserMessage &&
        e1?.startLearnCardPrompt == e2?.startLearnCardPrompt &&
        e1?.colors == e2?.colors &&
        e1?.continueLearnCardPrompt == e2?.continueLearnCardPrompt &&
        e1?.supabaseApiKey == e2?.supabaseApiKey &&
        e1?.supabaseProjUrl == e2?.supabaseProjUrl &&
        e1?.tableName == e2?.tableName &&
        e1?.queryName == e2?.queryName &&
        e1?.isLearnCards == e2?.isLearnCards &&
        e1?.flowiseUrl == e2?.flowiseUrl &&
        e1?.youAreMyCoachPrompt == e2?.youAreMyCoachPrompt &&
        e1?.youAreMyCoachMessage == e2?.youAreMyCoachMessage &&
        e1?.welcomeLetterPrompt == e2?.welcomeLetterPrompt &&
        listEquality.equals(e1?.landingUrls, e2?.landingUrls) &&
        e1?.startingCategory == e2?.startingCategory &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.companyDocId == e2?.companyDocId &&
        e1?.startingMemberLevel == e2?.startingMemberLevel &&
        e1?.startingMemberLevelName == e2?.startingMemberLevelName &&
        e1?.backgroundImageFilter == e2?.backgroundImageFilter;
  }

  @override
  int hash(CompaniesRecord? e) => const ListEquality().hash([
        e?.companylogo,
        e?.companyname,
        e?.id,
        e?.isowner,
        e?.livelicence,
        e?.aILicence,
        e?.navtype,
        e?.aiimage,
        e?.featureimage,
        e?.fullfeature,
        e?.welcometitle,
        e?.welcomedescription,
        e?.companylogoSquare,
        e?.companylogosquaredark,
        e?.haslivevideo,
        e?.hasai,
        e?.hassocialfeed,
        e?.aiSystemPrompt,
        e?.initialLearnCards,
        e?.aiLearnCardsPrompt,
        e?.companyDetails,
        e?.backgroundImage,
        e?.companyAiData,
        e?.whatTheyDo,
        e?.userGatherDataPrompt,
        e?.companyCode,
        e?.welcomeIntroPrompt,
        e?.welcomeMessage,
        e?.primaryTile,
        e?.getTilesPrompt,
        e?.getTileContentPromptPrt1,
        e?.getTileContentPromptPr2,
        e?.userGatherDataQuestionPrompt,
        e?.getTilesPromptUserMessage,
        e?.startLearnCardPrompt,
        e?.colors,
        e?.continueLearnCardPrompt,
        e?.supabaseApiKey,
        e?.supabaseProjUrl,
        e?.tableName,
        e?.queryName,
        e?.isLearnCards,
        e?.flowiseUrl,
        e?.youAreMyCoachPrompt,
        e?.youAreMyCoachMessage,
        e?.welcomeLetterPrompt,
        e?.landingUrls,
        e?.startingCategory,
        e?.createdTime,
        e?.updatedTime,
        e?.companyDocId,
        e?.startingMemberLevel,
        e?.startingMemberLevelName,
        e?.backgroundImageFilter
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesRecord;
}
