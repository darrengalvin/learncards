import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: RootPageContext.wrap(
          appStateNotifier.loggedIn ? const LibraryFixedWidget() : const DemoWidget(),
          errorRoute: state.location,
        ),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? const LibraryFixedWidget() : const DemoWidget(),
          ),
          routes: [
            FFRoute(
              name: 'signup',
              path: 'signup',
              builder: (context, params) => const SignupWidget(),
            ),
            FFRoute(
              name: 'CreateProfile',
              path: 'createProfile',
              builder: (context, params) => const CreateProfileWidget(),
            ),
            FFRoute(
              name: 'EditProfile',
              path: 'editProfile',
              asyncParams: {
                'broadcastsdoc':
                    getDoc(['broadcasts'], BroadcastsRecord.fromSnapshot),
              },
              builder: (context, params) => EditProfileWidget(
                broadcastsdoc:
                    params.getParam('broadcastsdoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'BroadcastListing',
              path: 'BroadcastListing',
              builder: (context, params) => const BroadcastListingWidget(),
            ),
            FFRoute(
              name: 'ViewBroadcast',
              path: 'viewBroadcast',
              asyncParams: {
                'broadcastdocument':
                    getDoc(['broadcasts'], BroadcastsRecord.fromSnapshot),
                'broadcastcomment': getDoc(['broadcasts', 'broadcastcomments'],
                    BroadcastcommentsRecord.fromSnapshot),
                'users': getDoc(['users'], UsersRecord.fromSnapshot),
                'whosonlinelive': getDoc(['broadcasts', 'usersonlinelive'],
                    UsersonlineliveRecord.fromSnapshot),
              },
              builder: (context, params) => ViewBroadcastWidget(
                url: params.getParam('url', ParamType.String),
                broadcastdocument:
                    params.getParam('broadcastdocument', ParamType.Document),
                broadcastcomment:
                    params.getParam('broadcastcomment', ParamType.Document),
                broadcastdocref: params.getParam('broadcastdocref',
                    ParamType.DocumentReference, false, ['broadcasts']),
                users: params.getParam('users', ParamType.Document),
                whosonlinelive:
                    params.getParam('whosonlinelive', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'StartBroadcast',
              path: 'startBroadcast',
              asyncParams: {
                'broadcastelements':
                    getDoc(['broadcasts'], BroadcastsRecord.fromSnapshot),
                'usersdocs': getDoc(['users'], UsersRecord.fromSnapshot),
                'pushdoc': getDoc(
                    ['pushnotification'], PushnotificationRecord.fromSnapshot),
                'categorydoc':
                    getDoc(['categories'], CategoriesRecord.fromSnapshot),
              },
              builder: (context, params) => StartBroadcastWidget(
                broadcastName:
                    params.getParam('broadcastName', ParamType.String),
                broadcastref: params.getParam('broadcastref',
                    ParamType.DocumentReference, false, ['broadcasts']),
                broadcastelements:
                    params.getParam('broadcastelements', ParamType.Document),
                userref: params.getParam(
                    'userref', ParamType.DocumentReference, false, ['users']),
                usersdocs: params.getParam('usersdocs', ParamType.Document),
                pushref: params.getParam('pushref', ParamType.DocumentReference,
                    false, ['pushnotification']),
                pushdoc: params.getParam('pushdoc', ParamType.Document),
                broadcastLocation:
                    params.getParam('broadcastLocation', ParamType.String),
                categorydoc: params.getParam('categorydoc', ParamType.Document),
                audience: params.getParam<DocumentReference>('audience',
                    ParamType.DocumentReference, true, ['categories']),
              ),
            ),
            FFRoute(
              name: 'podcasts',
              path: 'podcasts',
              builder: (context, params) => const PodcastsWidget(),
            ),
            FFRoute(
              name: 'insideFeatured',
              path: 'insideFeatured',
              asyncParams: {
                'featuredpages':
                    getDoc(['featuredpages'], FeaturedpagesRecord.fromSnapshot),
                'memberlevels': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => InsideFeaturedWidget(
                featuredpages:
                    params.getParam('featuredpages', ParamType.Document),
                memberlevels:
                    params.getParam('memberlevels', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'notifications',
              path: 'notifications',
              builder: (context, params) => const NotificationsWidget(),
            ),
            FFRoute(
              name: 'forgotpassword',
              path: 'forgotpassword',
              builder: (context, params) => const ForgotpasswordWidget(),
            ),
            FFRoute(
              name: 'leads',
              path: 'leads',
              builder: (context, params) => const LeadsWidget(),
            ),
            FFRoute(
              name: 'searchVideos',
              path: 'searchVideos',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
              },
              builder: (context, params) => SearchVideosWidget(
                tilesref: params.getParam(
                    'tilesref', ParamType.DocumentReference, false, ['tiles']),
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'searchTiles',
              path: 'searchTiles',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
              },
              builder: (context, params) => SearchTilesWidget(
                tilesref: params.getParam(
                    'tilesref', ParamType.DocumentReference, false, ['tiles']),
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'searchDocuments',
              path: 'searchDocuments',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
              },
              builder: (context, params) => SearchDocumentsWidget(
                tilesref: params.getParam(
                    'tilesref', ParamType.DocumentReference, false, ['tiles']),
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'AdminTiles',
              path: 'adminTiles',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
              },
              builder: (context, params) => AdminTilesWidget(
                tilesref: params.getParam(
                    'tilesref', ParamType.DocumentReference, false, ['tiles']),
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'settings',
              path: 'settings',
              builder: (context, params) => const SettingsWidget(),
            ),
            FFRoute(
              name: 'ManageMemberLevels',
              path: 'manageMemberLevels',
              asyncParams: {
                'memberlevel':
                    getDoc(['categories'], CategoriesRecord.fromSnapshot),
              },
              builder: (context, params) => ManageMemberLevelsWidget(
                memberlevel: params.getParam('memberlevel', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'onboardingForms',
              path: 'onboardingForms',
              builder: (context, params) => const OnboardingFormsWidget(),
            ),
            FFRoute(
              name: 'customForm',
              path: 'customForm',
              builder: (context, params) => const CustomFormWidget(),
            ),
            FFRoute(
              name: 'insideForm',
              path: 'insideForm',
              asyncParams: {
                'formdoc': getDoc(
                    ['onboardingforms'], OnboardingformsRecord.fromSnapshot),
              },
              builder: (context, params) => InsideFormWidget(
                formref: params.getParam('formref', ParamType.DocumentReference,
                    false, ['onboardingforms']),
                formdoc: params.getParam('formdoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'BugReporting',
              path: 'bugReporting',
              builder: (context, params) => const BugReportingWidget(),
            ),
            FFRoute(
              name: 'SocialFeedCopy',
              path: 'socialFeedCopy',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
                'categorydoc':
                    getDoc(['documents'], DocumentsRecord.fromSnapshot),
                'templatelist':
                    getDoc(['templates'], TemplatesRecord.fromSnapshot),
                'featuredtiem':
                    getDoc(['featuredpages'], FeaturedpagesRecord.fromSnapshot),
                'broadcastdocuments':
                    getDoc(['broadcasts'], BroadcastsRecord.fromSnapshot),
                'broadcastcomment': getDoc(['broadcasts', 'broadcastcomments'],
                    BroadcastcommentsRecord.fromSnapshot),
                'users': getDoc(['users'], UsersRecord.fromSnapshot),
                'whosonlinelive': getDoc(['broadcasts', 'usersonlinelive'],
                    UsersonlineliveRecord.fromSnapshot),
                'usersdoc': getDoc(['users'], UsersRecord.fromSnapshot),
                'pushdoc': getDoc(
                    ['pushnotification'], PushnotificationRecord.fromSnapshot),
              },
              builder: (context, params) => SocialFeedCopyWidget(
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
                tilesdocref: params.getParam('tilesdocref',
                    ParamType.DocumentReference, false, ['tiles']),
                categorydoc: params.getParam('categorydoc', ParamType.Document),
                categoryref: params.getParam('categoryref',
                    ParamType.DocumentReference, false, ['categories']),
                templatelist:
                    params.getParam('templatelist', ParamType.Document),
                featuredtiem:
                    params.getParam('featuredtiem', ParamType.Document),
                url: params.getParam('url', ParamType.String),
                broadcastdocuments:
                    params.getParam('broadcastdocuments', ParamType.Document),
                broadcastcomment:
                    params.getParam('broadcastcomment', ParamType.Document),
                broadcastdocref: params.getParam('broadcastdocref',
                    ParamType.DocumentReference, false, ['broadcasts']),
                users: params.getParam('users', ParamType.Document),
                whosonlinelive:
                    params.getParam('whosonlinelive', ParamType.Document),
                userref: params.getParam(
                    'userref', ParamType.DocumentReference, false, ['users']),
                usersdoc: params.getParam('usersdoc', ParamType.Document),
                broadcastname:
                    params.getParam('broadcastname', ParamType.String),
                broadcastref: params.getParam('broadcastref',
                    ParamType.DocumentReference, false, ['broadcasts']),
                pushref: params.getParam('pushref', ParamType.DocumentReference,
                    false, ['pushnotification']),
                pushdoc: params.getParam('pushdoc', ParamType.Document),
                broadcastlocation:
                    params.getParam('broadcastlocation', ParamType.String),
                urlstring: params.getParam('urlstring', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'LiveVideos',
              path: 'liveVideos',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
                'categorydoc':
                    getDoc(['documents'], DocumentsRecord.fromSnapshot),
                'templatelist':
                    getDoc(['templates'], TemplatesRecord.fromSnapshot),
                'featuredtiem':
                    getDoc(['featuredpages'], FeaturedpagesRecord.fromSnapshot),
                'usersdocs': getDoc(['users'], UsersRecord.fromSnapshot),
                'pushdoc': getDoc(
                    ['pushnotification'], PushnotificationRecord.fromSnapshot),
              },
              builder: (context, params) => LiveVideosWidget(
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
                tilesdocref: params.getParam('tilesdocref',
                    ParamType.DocumentReference, false, ['tiles']),
                categorydoc: params.getParam('categorydoc', ParamType.Document),
                categoryref: params.getParam('categoryref',
                    ParamType.DocumentReference, false, ['categories']),
                templatelist:
                    params.getParam('templatelist', ParamType.Document),
                featuredtiem:
                    params.getParam('featuredtiem', ParamType.Document),
                url: params.getParam('url', ParamType.String),
                userref: params.getParam(
                    'userref', ParamType.DocumentReference, false, ['users']),
                usersdocs: params.getParam('usersdocs', ParamType.Document),
                broadcastname:
                    params.getParam('broadcastname', ParamType.String),
                broadcastref: params.getParam('broadcastref',
                    ParamType.DocumentReference, false, ['broadcasts']),
                pushref: params.getParam('pushref', ParamType.DocumentReference,
                    false, ['pushnotification']),
                pushdoc: params.getParam('pushdoc', ParamType.Document),
                broadcastlocation:
                    params.getParam('broadcastlocation', ParamType.String),
                urlstring: params.getParam('urlstring', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'support',
              path: 'support',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
                'categorydoc':
                    getDoc(['documents'], DocumentsRecord.fromSnapshot),
                'templatelist':
                    getDoc(['templates'], TemplatesRecord.fromSnapshot),
                'featuredtiem':
                    getDoc(['featuredpages'], FeaturedpagesRecord.fromSnapshot),
              },
              builder: (context, params) => SupportWidget(
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
                tilesdocref: params.getParam('tilesdocref',
                    ParamType.DocumentReference, false, ['tiles']),
                categorydoc: params.getParam('categorydoc', ParamType.Document),
                categoryref: params.getParam('categoryref',
                    ParamType.DocumentReference, false, ['categories']),
                templatelist:
                    params.getParam('templatelist', ParamType.Document),
                featuredtiem:
                    params.getParam('featuredtiem', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'aifeed',
              path: 'aifeed',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
                'categorydoc':
                    getDoc(['documents'], DocumentsRecord.fromSnapshot),
                'templatelist':
                    getDoc(['templates'], TemplatesRecord.fromSnapshot),
                'featuredtiem':
                    getDoc(['featuredpages'], FeaturedpagesRecord.fromSnapshot),
              },
              builder: (context, params) => AifeedWidget(
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
                tilesdocref: params.getParam('tilesdocref',
                    ParamType.DocumentReference, false, ['tiles']),
                categorydoc: params.getParam('categorydoc', ParamType.Document),
                categoryref: params.getParam('categoryref',
                    ParamType.DocumentReference, false, ['categories']),
                templatelist:
                    params.getParam('templatelist', ParamType.Document),
                featuredtiem:
                    params.getParam('featuredtiem', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'VideoPage',
              path: 'videoPage',
              asyncParams: {
                'url': getDoc(['broadcasts'], BroadcastsRecord.fromSnapshot),
              },
              builder: (context, params) => VideoPageWidget(
                broadcastdocref: params.getParam('broadcastdocref',
                    ParamType.DocumentReference, false, ['broadcasts']),
                url: params.getParam('url', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'QUESTIONS',
              path: 'questions',
              builder: (context, params) => const QuestionsWidget(),
            ),
            FFRoute(
              name: 'SocialFeedInside',
              path: 'socialFeedInside',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
                'categorydoc':
                    getDoc(['documents'], DocumentsRecord.fromSnapshot),
                'templatelist':
                    getDoc(['templates'], TemplatesRecord.fromSnapshot),
                'featuredtiem':
                    getDoc(['featuredpages'], FeaturedpagesRecord.fromSnapshot),
                'socialfeeddoc':
                    getDoc(['socialfeed'], SocialfeedRecord.fromSnapshot),
              },
              builder: (context, params) => SocialFeedInsideWidget(
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
                tilesdocref: params.getParam('tilesdocref',
                    ParamType.DocumentReference, false, ['tiles']),
                categorydoc: params.getParam('categorydoc', ParamType.Document),
                categoryref: params.getParam('categoryref',
                    ParamType.DocumentReference, false, ['categories']),
                templatelist:
                    params.getParam('templatelist', ParamType.Document),
                featuredtiem:
                    params.getParam('featuredtiem', ParamType.Document),
                socialfeedref: params.getParam('socialfeedref',
                    ParamType.DocumentReference, false, ['socialfeed']),
                socialfeeddoc:
                    params.getParam('socialfeeddoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'socialfeedslist',
              path: 'socialfeedslist',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
                'categorydoc':
                    getDoc(['categories'], CategoriesRecord.fromSnapshot),
                'templatelist':
                    getDoc(['templates'], TemplatesRecord.fromSnapshot),
                'featuredtiem':
                    getDoc(['featuredpages'], FeaturedpagesRecord.fromSnapshot),
                'tiledoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
                'historydoc':
                    getDoc(['users', 'history'], HistoryRecord.fromSnapshot),
                'socialfeeddoc':
                    getDoc(['socialfeed'], SocialfeedRecord.fromSnapshot),
              },
              builder: (context, params) => SocialfeedslistWidget(
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
                tilesdocref: params.getParam('tilesdocref',
                    ParamType.DocumentReference, false, ['tiles']),
                categorydoc: params.getParam('categorydoc', ParamType.Document),
                categoryref: params.getParam('categoryref',
                    ParamType.DocumentReference, false, ['categories']),
                templatelist:
                    params.getParam('templatelist', ParamType.Document),
                featuredtiem:
                    params.getParam('featuredtiem', ParamType.Document),
                tileref: params.getParam(
                    'tileref', ParamType.DocumentReference, false, ['tiles']),
                tiledoc: params.getParam('tiledoc', ParamType.Document),
                historyref: params.getParam('historyref',
                    ParamType.DocumentReference, false, ['users', 'history']),
                historydoc: params.getParam('historydoc', ParamType.Document),
                socialfeedref: params.getParam('socialfeedref',
                    ParamType.DocumentReference, false, ['socialfeed']),
                socialfeeddoc:
                    params.getParam('socialfeeddoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'AppEntries',
              path: 'appEntries',
              builder: (context, params) => const AppEntriesWidget(),
            ),
            FFRoute(
              name: 'APP_Setup',
              path: 'aPPSetup',
              builder: (context, params) => const APPSetupWidget(),
            ),
            FFRoute(
              name: 'reels',
              path: 'reels',
              builder: (context, params) => const ReelsWidget(),
            ),
            FFRoute(
              name: 'profile',
              path: 'profile',
              builder: (context, params) => const ProfileWidget(),
            ),
            FFRoute(
              name: 'CreateREEL',
              path: 'createREEL',
              builder: (context, params) => const CreateREELWidget(),
            ),
            FFRoute(
              name: 'ViewBroadcastCompon',
              path: 'viewBroadcastCompon',
              asyncParams: {
                'broadcastdocument':
                    getDoc(['broadcasts'], BroadcastsRecord.fromSnapshot),
                'broadcastcomment': getDoc(['broadcasts', 'broadcastcomments'],
                    BroadcastcommentsRecord.fromSnapshot),
                'users': getDoc(['users'], UsersRecord.fromSnapshot),
                'whosonlinelive': getDoc(['broadcasts', 'usersonlinelive'],
                    UsersonlineliveRecord.fromSnapshot),
              },
              builder: (context, params) => ViewBroadcastComponWidget(
                url: params.getParam('url', ParamType.String),
                broadcastdocument:
                    params.getParam('broadcastdocument', ParamType.Document),
                broadcastcomment:
                    params.getParam('broadcastcomment', ParamType.Document),
                broadcastdocref: params.getParam('broadcastdocref',
                    ParamType.DocumentReference, false, ['broadcasts']),
                users: params.getParam('users', ParamType.Document),
                whosonlinelive:
                    params.getParam('whosonlinelive', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'AppSettings',
              path: 'appSettings',
              builder: (context, params) => const AppSettingsWidget(),
            ),
            FFRoute(
              name: 'tilesCopy',
              path: 'tilesCopy',
              asyncParams: {
                'tilesdoc': getDoc(['tiles'], TilesRecord.fromSnapshot),
                'categorydoc':
                    getDoc(['documents'], DocumentsRecord.fromSnapshot),
                'templatelist':
                    getDoc(['templates'], TemplatesRecord.fromSnapshot),
                'featuredtiem':
                    getDoc(['featuredpages'], FeaturedpagesRecord.fromSnapshot),
                'tiledoc': getDoc(['documents'], DocumentsRecord.fromSnapshot),
                'historydoc':
                    getDoc(['users', 'history'], HistoryRecord.fromSnapshot),
                'tile': getDoc(['tiles'], TilesRecord.fromSnapshot),
              },
              builder: (context, params) => TilesCopyWidget(
                tilesdoc: params.getParam('tilesdoc', ParamType.Document),
                tilesdocref: params.getParam('tilesdocref',
                    ParamType.DocumentReference, false, ['tiles']),
                categorydoc: params.getParam('categorydoc', ParamType.Document),
                categoryref: params.getParam('categoryref',
                    ParamType.DocumentReference, false, ['categories']),
                templatelist:
                    params.getParam('templatelist', ParamType.Document),
                featuredtiem:
                    params.getParam('featuredtiem', ParamType.Document),
                tileref: params.getParam(
                    'tileref', ParamType.DocumentReference, false, ['tiles']),
                tilesref: params.getParam(
                    'tilesref', ParamType.DocumentReference, false, ['tiles']),
                tiledoc: params.getParam('tiledoc', ParamType.Document),
                historydoc: params.getParam('historydoc', ParamType.Document),
                historyref: params.getParam('historyref',
                    ParamType.DocumentReference, false, ['users', 'history']),
                tile: params.getParam('tile', ParamType.Document),
                createdTextBlockT: params.getParam('createdTextBlockT',
                    ParamType.DocumentReference, false, ['textblock']),
                companies: params.getParam(
                    'companies', ParamType.DocumentReference, false, ['tiles']),
              ),
            ),
            FFRoute(
              name: 'VIDEO',
              path: 'video',
              builder: (context, params) => const VideoWidget(),
            ),
            FFRoute(
              name: 'thumbnailpicker',
              path: 'thumbnailpicker',
              builder: (context, params) => const ThumbnailpickerWidget(),
            ),
            FFRoute(
              name: 'dashNews',
              path: 'librarysc',
              builder: (context, params) => const DashNewsWidget(),
            ),
            FFRoute(
              name: 'featuredPage',
              path: 'libraryfeatured',
              builder: (context, params) => const FeaturedPageWidget(),
            ),
            FFRoute(
              name: 'alitest',
              path: 'alitest',
              builder: (context, params) => const AlitestWidget(),
            ),
            FFRoute(
              name: 'cloudinaryUploadTest',
              path: 'cloudinaryUploadTest',
              builder: (context, params) => CloudinaryUploadTestWidget(
                presetId: params.getParam('presetId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'landing',
              path: 'landing',
              builder: (context, params) => const LandingWidget(),
            ),
            FFRoute(
              name: 'landingCopy',
              path: 'landingCopy',
              builder: (context, params) => const LandingCopyWidget(),
            ),
            FFRoute(
              name: 'flowiseTest',
              path: 'flowiseTest',
              builder: (context, params) => const FlowiseTestWidget(),
            ),
            FFRoute(
              name: 'apiStream',
              path: 'apiStream',
              builder: (context, params) => const ApiStreamWidget(),
            ),
            FFRoute(
              name: 'apiStreamChats',
              path: 'apiStreamChats',
              builder: (context, params) => const ApiStreamChatsWidget(),
            ),
            FFRoute(
              name: 'Responsive',
              path: 'responsive',
              builder: (context, params) => const ResponsiveWidget(),
            ),
            FFRoute(
              name: 'demo',
              path: 'demo',
              builder: (context, params) => const DemoWidget(),
            ),
            FFRoute(
              name: 'socialFeed',
              path: 'social',
              builder: (context, params) => SocialFeedWidget(
                associatedTileBlock:
                    params.getParam('associatedTileBlock', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Library-fixed',
              path: 'library',
              asyncParams: {
                'companiesDoc':
                    getDoc(['companies'], CompaniesRecord.fromSnapshot),
              },
              builder: (context, params) => LibraryFixedWidget(
                associatedTileBlock:
                    params.getParam('associatedTileBlock', ParamType.String),
                companiesDoc:
                    params.getParam('companiesDoc', ParamType.Document),
                landing: params.getParam('landing', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'dash',
              path: 'dash',
              asyncParams: {
                'companyDoc':
                    getDoc(['companies'], CompaniesRecord.fromSnapshot),
              },
              builder: (context, params) => DashWidget(
                companyDoc: params.getParam('companyDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'sessions',
              path: 'sessions',
              asyncParams: {
                'companyDoc':
                    getDoc(['companies'], CompaniesRecord.fromSnapshot),
              },
              builder: (context, params) => SessionsWidget(
                companyId: params.getParam('companyId', ParamType.String),
                companyDoc: params.getParam('companyDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'chatPage',
              path: 'chatPage',
              asyncParams: {
                'companiesDoc':
                    getDoc(['companies'], CompaniesRecord.fromSnapshot),
                'sessionsDoc':
                    getDoc(['sessions'], SessionsRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                companiesDoc:
                    params.getParam('companiesDoc', ParamType.Document),
                sessionsDoc: params.getParam('sessionsDoc', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/demo';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link') &&
        widget.state.location.contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
