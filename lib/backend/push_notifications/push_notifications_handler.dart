import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'signup': (data) async => ParameterData(
        allParams: {
          'sessionsDoc': await getDocumentParameter<SessionsRecord>(
              data, 'sessionsDoc', SessionsRecord.fromSnapshot),
        },
      ),
  'CreateProfile': ParameterData.none(),
  'EditProfile': (data) async => ParameterData(
        allParams: {
          'broadcastsdoc': await getDocumentParameter<BroadcastsRecord>(
              data, 'broadcastsdoc', BroadcastsRecord.fromSnapshot),
        },
      ),
  'BroadcastListing': ParameterData.none(),
  'ViewBroadcast': (data) async => ParameterData(
        allParams: {
          'url': getParameter<String>(data, 'url'),
          'broadcastdocument': await getDocumentParameter<BroadcastsRecord>(
              data, 'broadcastdocument', BroadcastsRecord.fromSnapshot),
          'broadcastcomment':
              await getDocumentParameter<BroadcastcommentsRecord>(data,
                  'broadcastcomment', BroadcastcommentsRecord.fromSnapshot),
          'broadcastdocref':
              getParameter<DocumentReference>(data, 'broadcastdocref'),
          'users': await getDocumentParameter<UsersRecord>(
              data, 'users', UsersRecord.fromSnapshot),
          'whosonlinelive': await getDocumentParameter<UsersonlineliveRecord>(
              data, 'whosonlinelive', UsersonlineliveRecord.fromSnapshot),
        },
      ),
  'StartBroadcast': (data) async => ParameterData(
        allParams: {
          'broadcastName': getParameter<String>(data, 'broadcastName'),
          'broadcastref': getParameter<DocumentReference>(data, 'broadcastref'),
          'broadcastelements': await getDocumentParameter<BroadcastsRecord>(
              data, 'broadcastelements', BroadcastsRecord.fromSnapshot),
          'userref': getParameter<DocumentReference>(data, 'userref'),
          'usersdocs': await getDocumentParameter<UsersRecord>(
              data, 'usersdocs', UsersRecord.fromSnapshot),
          'pushref': getParameter<DocumentReference>(data, 'pushref'),
          'pushdoc': await getDocumentParameter<PushnotificationRecord>(
              data, 'pushdoc', PushnotificationRecord.fromSnapshot),
          'broadcastLocation': getParameter<String>(data, 'broadcastLocation'),
          'categorydoc': await getDocumentParameter<CategoriesRecord>(
              data, 'categorydoc', CategoriesRecord.fromSnapshot),
        },
      ),
  'podcasts': ParameterData.none(),
  'insideFeatured': (data) async => ParameterData(
        allParams: {
          'featuredpages': await getDocumentParameter<FeaturedpagesRecord>(
              data, 'featuredpages', FeaturedpagesRecord.fromSnapshot),
          'memberlevels': await getDocumentParameter<UsersRecord>(
              data, 'memberlevels', UsersRecord.fromSnapshot),
        },
      ),
  'notifications': ParameterData.none(),
  'forgotpassword': ParameterData.none(),
  'leads': ParameterData.none(),
  'searchVideos': (data) async => ParameterData(
        allParams: {
          'tilesref': getParameter<DocumentReference>(data, 'tilesref'),
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
        },
      ),
  'searchTiles': (data) async => ParameterData(
        allParams: {
          'tilesref': getParameter<DocumentReference>(data, 'tilesref'),
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
        },
      ),
  'searchDocuments': (data) async => ParameterData(
        allParams: {
          'tilesref': getParameter<DocumentReference>(data, 'tilesref'),
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
        },
      ),
  'AdminTiles': (data) async => ParameterData(
        allParams: {
          'tilesref': getParameter<DocumentReference>(data, 'tilesref'),
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
        },
      ),
  'settings': ParameterData.none(),
  'ManageMemberLevels': (data) async => ParameterData(
        allParams: {
          'memberlevel': await getDocumentParameter<CategoriesRecord>(
              data, 'memberlevel', CategoriesRecord.fromSnapshot),
        },
      ),
  'onboardingForms': ParameterData.none(),
  'customForm': ParameterData.none(),
  'insideForm': (data) async => ParameterData(
        allParams: {
          'formref': getParameter<DocumentReference>(data, 'formref'),
          'formdoc': await getDocumentParameter<OnboardingformsRecord>(
              data, 'formdoc', OnboardingformsRecord.fromSnapshot),
        },
      ),
  'BugReporting': ParameterData.none(),
  'SocialFeedCopy': (data) async => ParameterData(
        allParams: {
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
          'tilesdocref': getParameter<DocumentReference>(data, 'tilesdocref'),
          'categorydoc': await getDocumentParameter<DocumentsRecord>(
              data, 'categorydoc', DocumentsRecord.fromSnapshot),
          'categoryref': getParameter<DocumentReference>(data, 'categoryref'),
          'templatelist': await getDocumentParameter<TemplatesRecord>(
              data, 'templatelist', TemplatesRecord.fromSnapshot),
          'featuredtiem': await getDocumentParameter<FeaturedpagesRecord>(
              data, 'featuredtiem', FeaturedpagesRecord.fromSnapshot),
          'url': getParameter<String>(data, 'url'),
          'broadcastdocuments': await getDocumentParameter<BroadcastsRecord>(
              data, 'broadcastdocuments', BroadcastsRecord.fromSnapshot),
          'broadcastcomment':
              await getDocumentParameter<BroadcastcommentsRecord>(data,
                  'broadcastcomment', BroadcastcommentsRecord.fromSnapshot),
          'broadcastdocref':
              getParameter<DocumentReference>(data, 'broadcastdocref'),
          'users': await getDocumentParameter<UsersRecord>(
              data, 'users', UsersRecord.fromSnapshot),
          'whosonlinelive': await getDocumentParameter<UsersonlineliveRecord>(
              data, 'whosonlinelive', UsersonlineliveRecord.fromSnapshot),
          'userref': getParameter<DocumentReference>(data, 'userref'),
          'usersdoc': await getDocumentParameter<UsersRecord>(
              data, 'usersdoc', UsersRecord.fromSnapshot),
          'broadcastname': getParameter<String>(data, 'broadcastname'),
          'broadcastref': getParameter<DocumentReference>(data, 'broadcastref'),
          'pushref': getParameter<DocumentReference>(data, 'pushref'),
          'pushdoc': await getDocumentParameter<PushnotificationRecord>(
              data, 'pushdoc', PushnotificationRecord.fromSnapshot),
          'broadcastlocation': getParameter<String>(data, 'broadcastlocation'),
          'urlstring': getParameter<String>(data, 'urlstring'),
        },
      ),
  'LiveVideos': (data) async => ParameterData(
        allParams: {
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
          'tilesdocref': getParameter<DocumentReference>(data, 'tilesdocref'),
          'categorydoc': await getDocumentParameter<DocumentsRecord>(
              data, 'categorydoc', DocumentsRecord.fromSnapshot),
          'categoryref': getParameter<DocumentReference>(data, 'categoryref'),
          'templatelist': await getDocumentParameter<TemplatesRecord>(
              data, 'templatelist', TemplatesRecord.fromSnapshot),
          'featuredtiem': await getDocumentParameter<FeaturedpagesRecord>(
              data, 'featuredtiem', FeaturedpagesRecord.fromSnapshot),
          'url': getParameter<String>(data, 'url'),
          'userref': getParameter<DocumentReference>(data, 'userref'),
          'usersdocs': await getDocumentParameter<UsersRecord>(
              data, 'usersdocs', UsersRecord.fromSnapshot),
          'broadcastname': getParameter<String>(data, 'broadcastname'),
          'broadcastref': getParameter<DocumentReference>(data, 'broadcastref'),
          'pushref': getParameter<DocumentReference>(data, 'pushref'),
          'pushdoc': await getDocumentParameter<PushnotificationRecord>(
              data, 'pushdoc', PushnotificationRecord.fromSnapshot),
          'broadcastlocation': getParameter<String>(data, 'broadcastlocation'),
          'urlstring': getParameter<String>(data, 'urlstring'),
        },
      ),
  'support': (data) async => ParameterData(
        allParams: {
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
          'tilesdocref': getParameter<DocumentReference>(data, 'tilesdocref'),
          'categorydoc': await getDocumentParameter<DocumentsRecord>(
              data, 'categorydoc', DocumentsRecord.fromSnapshot),
          'categoryref': getParameter<DocumentReference>(data, 'categoryref'),
          'templatelist': await getDocumentParameter<TemplatesRecord>(
              data, 'templatelist', TemplatesRecord.fromSnapshot),
          'featuredtiem': await getDocumentParameter<FeaturedpagesRecord>(
              data, 'featuredtiem', FeaturedpagesRecord.fromSnapshot),
        },
      ),
  'aifeed': (data) async => ParameterData(
        allParams: {
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
          'tilesdocref': getParameter<DocumentReference>(data, 'tilesdocref'),
          'categorydoc': await getDocumentParameter<DocumentsRecord>(
              data, 'categorydoc', DocumentsRecord.fromSnapshot),
          'categoryref': getParameter<DocumentReference>(data, 'categoryref'),
          'templatelist': await getDocumentParameter<TemplatesRecord>(
              data, 'templatelist', TemplatesRecord.fromSnapshot),
          'featuredtiem': await getDocumentParameter<FeaturedpagesRecord>(
              data, 'featuredtiem', FeaturedpagesRecord.fromSnapshot),
        },
      ),
  'VideoPage': (data) async => ParameterData(
        allParams: {
          'broadcastdocref':
              getParameter<DocumentReference>(data, 'broadcastdocref'),
          'url': await getDocumentParameter<BroadcastsRecord>(
              data, 'url', BroadcastsRecord.fromSnapshot),
        },
      ),
  'QUESTIONS': ParameterData.none(),
  'SocialFeedInside': (data) async => ParameterData(
        allParams: {
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
          'tilesdocref': getParameter<DocumentReference>(data, 'tilesdocref'),
          'categorydoc': await getDocumentParameter<DocumentsRecord>(
              data, 'categorydoc', DocumentsRecord.fromSnapshot),
          'categoryref': getParameter<DocumentReference>(data, 'categoryref'),
          'templatelist': await getDocumentParameter<TemplatesRecord>(
              data, 'templatelist', TemplatesRecord.fromSnapshot),
          'featuredtiem': await getDocumentParameter<FeaturedpagesRecord>(
              data, 'featuredtiem', FeaturedpagesRecord.fromSnapshot),
          'socialfeedref':
              getParameter<DocumentReference>(data, 'socialfeedref'),
          'socialfeeddoc': await getDocumentParameter<SocialfeedRecord>(
              data, 'socialfeeddoc', SocialfeedRecord.fromSnapshot),
        },
      ),
  'socialfeedslist': (data) async => ParameterData(
        allParams: {
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
          'tilesdocref': getParameter<DocumentReference>(data, 'tilesdocref'),
          'categorydoc': await getDocumentParameter<CategoriesRecord>(
              data, 'categorydoc', CategoriesRecord.fromSnapshot),
          'categoryref': getParameter<DocumentReference>(data, 'categoryref'),
          'templatelist': await getDocumentParameter<TemplatesRecord>(
              data, 'templatelist', TemplatesRecord.fromSnapshot),
          'featuredtiem': await getDocumentParameter<FeaturedpagesRecord>(
              data, 'featuredtiem', FeaturedpagesRecord.fromSnapshot),
          'tileref': getParameter<DocumentReference>(data, 'tileref'),
          'tiledoc': await getDocumentParameter<TilesRecord>(
              data, 'tiledoc', TilesRecord.fromSnapshot),
          'historyref': getParameter<DocumentReference>(data, 'historyref'),
          'historydoc': await getDocumentParameter<HistoryRecord>(
              data, 'historydoc', HistoryRecord.fromSnapshot),
          'socialfeedref':
              getParameter<DocumentReference>(data, 'socialfeedref'),
          'socialfeeddoc': await getDocumentParameter<SocialfeedRecord>(
              data, 'socialfeeddoc', SocialfeedRecord.fromSnapshot),
        },
      ),
  'AppEntries': ParameterData.none(),
  'APP_Setup': ParameterData.none(),
  'reels': ParameterData.none(),
  'profile': ParameterData.none(),
  'CreateREEL': ParameterData.none(),
  'ViewBroadcastCompon': (data) async => ParameterData(
        allParams: {
          'url': getParameter<String>(data, 'url'),
          'broadcastdocument': await getDocumentParameter<BroadcastsRecord>(
              data, 'broadcastdocument', BroadcastsRecord.fromSnapshot),
          'broadcastcomment':
              await getDocumentParameter<BroadcastcommentsRecord>(data,
                  'broadcastcomment', BroadcastcommentsRecord.fromSnapshot),
          'broadcastdocref':
              getParameter<DocumentReference>(data, 'broadcastdocref'),
          'users': await getDocumentParameter<UsersRecord>(
              data, 'users', UsersRecord.fromSnapshot),
          'whosonlinelive': await getDocumentParameter<UsersonlineliveRecord>(
              data, 'whosonlinelive', UsersonlineliveRecord.fromSnapshot),
        },
      ),
  'AppSettings': ParameterData.none(),
  'tilesCopy': (data) async => ParameterData(
        allParams: {
          'tilesdoc': await getDocumentParameter<TilesRecord>(
              data, 'tilesdoc', TilesRecord.fromSnapshot),
          'tilesdocref': getParameter<DocumentReference>(data, 'tilesdocref'),
          'categorydoc': await getDocumentParameter<DocumentsRecord>(
              data, 'categorydoc', DocumentsRecord.fromSnapshot),
          'categoryref': getParameter<DocumentReference>(data, 'categoryref'),
          'templatelist': await getDocumentParameter<TemplatesRecord>(
              data, 'templatelist', TemplatesRecord.fromSnapshot),
          'featuredtiem': await getDocumentParameter<FeaturedpagesRecord>(
              data, 'featuredtiem', FeaturedpagesRecord.fromSnapshot),
          'tileref': getParameter<DocumentReference>(data, 'tileref'),
          'tilesref': getParameter<DocumentReference>(data, 'tilesref'),
          'tiledoc': await getDocumentParameter<DocumentsRecord>(
              data, 'tiledoc', DocumentsRecord.fromSnapshot),
          'historydoc': await getDocumentParameter<HistoryRecord>(
              data, 'historydoc', HistoryRecord.fromSnapshot),
          'historyref': getParameter<DocumentReference>(data, 'historyref'),
          'tile': await getDocumentParameter<TilesRecord>(
              data, 'tile', TilesRecord.fromSnapshot),
          'createdTextBlockT':
              getParameter<DocumentReference>(data, 'createdTextBlockT'),
          'companies': getParameter<DocumentReference>(data, 'companies'),
        },
      ),
  'VIDEO': ParameterData.none(),
  'thumbnailpicker': ParameterData.none(),
  'dashNews': ParameterData.none(),
  'featuredPage': ParameterData.none(),
  'alitest': ParameterData.none(),
  'cloudinaryUploadTest': (data) async => ParameterData(
        allParams: {
          'presetId': getParameter<String>(data, 'presetId'),
        },
      ),
  'landing': ParameterData.none(),
  'landingCopy': ParameterData.none(),
  'flowiseTest': ParameterData.none(),
  'apiStream': ParameterData.none(),
  'apiStreamChats': ParameterData.none(),
  'Responsive': ParameterData.none(),
  'demo': ParameterData.none(),
  'socialFeed': (data) async => ParameterData(
        allParams: {
          'associatedTileBlock':
              getParameter<String>(data, 'associatedTileBlock'),
        },
      ),
  'Library-fixed': (data) async => ParameterData(
        allParams: {
          'associatedTileBlock':
              getParameter<String>(data, 'associatedTileBlock'),
          'companiesDoc': await getDocumentParameter<CompaniesRecord>(
              data, 'companiesDoc', CompaniesRecord.fromSnapshot),
          'landing': getParameter<String>(data, 'landing'),
        },
      ),
  'dash': (data) async => ParameterData(
        allParams: {
          'companyDoc': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDoc', CompaniesRecord.fromSnapshot),
        },
      ),
  'sessions': (data) async => ParameterData(
        allParams: {
          'companyId': getParameter<String>(data, 'companyId'),
          'companyDoc': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDoc', CompaniesRecord.fromSnapshot),
        },
      ),
  'chatPage': (data) async => ParameterData(
        allParams: {
          'companiesDoc': await getDocumentParameter<CompaniesRecord>(
              data, 'companiesDoc', CompaniesRecord.fromSnapshot),
          'sessionsDoc': await getDocumentParameter<SessionsRecord>(
              data, 'sessionsDoc', SessionsRecord.fromSnapshot),
          'sessionDoc': await getDocumentParameter<SessionsRecord>(
              data, 'sessionDoc', SessionsRecord.fromSnapshot),
        },
      ),
  'login': (data) async => ParameterData(
        allParams: {
          'companyDoc': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDoc', CompaniesRecord.fromSnapshot),
          'email': getParameter<String>(data, 'email'),
          'password': getParameter<String>(data, 'password'),
        },
      ),
  'subjectsCovered': ParameterData.none(),
  'createcompany': ParameterData.none(),
  'setupCompany': (data) async => ParameterData(
        allParams: {
          'companyDoc': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDoc', CompaniesRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
