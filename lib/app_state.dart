import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectedcategory =
          prefs.getString('ff_selectedcategory') ?? _selectedcategory;
    });
    _safeInit(() {
      _hasaccessto250k =
          prefs.getBool('ff_hasaccessto250k') ?? _hasaccessto250k;
    });
    _safeInit(() {
      _currentTileTier = prefs.getInt('ff_currentTileTier') ?? _currentTileTier;
    });
    _safeInit(() {
      _backbutton = prefs
              .getStringList('ff_backbutton')
              ?.map((path) => path.ref)
              .toList() ??
          _backbutton;
    });
    _safeInit(() {
      _dismisscount = prefs.getInt('ff_dismisscount') ?? _dismisscount;
    });
    _safeInit(() {
      _isadminswitch = prefs.getBool('ff_isadminswitch') ?? _isadminswitch;
    });
    _safeInit(() {
      _novideostoshow = prefs.getBool('ff_novideostoshow') ?? _novideostoshow;
    });
    _safeInit(() {
      _baseurl = prefs.getString('ff_baseurl') ?? _baseurl;
    });
    _safeInit(() {
      _selectedtilechangecolor =
          prefs.getString('ff_selectedtilechangecolor')?.ref ??
              _selectedtilechangecolor;
    });
    _safeInit(() {
      _selectedForLive =
          prefs.getStringList('ff_selectedForLive') ?? _selectedForLive;
    });
    _safeInit(() {
      _notifications = prefs.getBool('ff_notifications') ?? _notifications;
    });
    _safeInit(() {
      _selectedSubTilesRef = prefs.getString('ff_selectedSubTilesRef')?.ref ??
          _selectedSubTilesRef;
    });
    _safeInit(() {
      _currentAIiD = prefs.getInt('ff_currentAIiD') ?? _currentAIiD;
    });
    _safeInit(() {
      _isIspMember = prefs.getBool('ff_isIspMember') ?? _isIspMember;
    });
    _safeInit(() {
      _username = prefs.getString('ff_username') ?? _username;
    });
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
    _safeInit(() {
      _memberid = prefs.getString('ff_memberid') ?? _memberid;
    });
    _safeInit(() {
      _cpdscore = prefs.getString('ff_cpdscore') ?? _cpdscore;
    });
    _safeInit(() {
      _profilepic = prefs.getString('ff_profilepic') ?? _profilepic;
    });
    _safeInit(() {
      _catnotifications =
          prefs.getBool('ff_catnotifications') ?? _catnotifications;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_tileNav')) {
        try {
          final serializedData = prefs.getString('ff_tileNav') ?? '{}';
          _tileNav =
              TileNavStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _navPath = prefs.getStringList('ff_navPath') ?? _navPath;
    });
    _safeInit(() {
      _drawerState = prefs.getString('ff_drawerState') ?? _drawerState;
    });
    _safeInit(() {
      _drawerView = prefs.getString('ff_drawerView') ?? _drawerView;
    });
    _safeInit(() {
      _drawerMode = prefs.getString('ff_drawerMode') ?? _drawerMode;
    });
    _safeInit(() {
      _drawerCurrentId =
          prefs.getString('ff_drawerCurrentId') ?? _drawerCurrentId;
    });
    _safeInit(() {
      _blockTypes = prefs
              .getStringList('ff_blockTypes')
              ?.map((x) {
                try {
                  return BlockTypeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _blockTypes;
    });
    _safeInit(() {
      _selectedTileRefV2 =
          prefs.getString('ff_selectedTileRefV2')?.ref ?? _selectedTileRefV2;
    });
    _safeInit(() {
      _showTileTierZero =
          prefs.getBool('ff_showTileTierZero') ?? _showTileTierZero;
    });
    _safeInit(() {
      _currentTimer = prefs.getDouble('ff_currentTimer') ?? _currentTimer;
    });
    _safeInit(() {
      _localQuizId = prefs.getInt('ff_localQuizId') ?? _localQuizId;
    });
    _safeInit(() {
      _userChats = prefs
              .getStringList('ff_userChats')
              ?.map((x) {
                try {
                  return UserChatsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _userChats;
    });
    _safeInit(() {
      _sessionId = prefs.getString('ff_sessionId') ?? _sessionId;
    });
    _safeInit(() {
      _endDrawerOpen = prefs.getBool('ff_endDrawerOpen') ?? _endDrawerOpen;
    });
    _safeInit(() {
      _nonLoggedInSessionId =
          prefs.getString('ff_nonLoggedInSessionId') ?? _nonLoggedInSessionId;
    });
    _safeInit(() {
      _openAiData = prefs.getStringList('ff_openAiData') ?? _openAiData;
    });
    _safeInit(() {
      _readyToImage = prefs.getBool('ff_readyToImage') ?? _readyToImage;
    });
    _safeInit(() {
      _backgroundImage =
          prefs.getString('ff_backgroundImage') ?? _backgroundImage;
    });
    _safeInit(() {
      _backgroundImageUrl =
          prefs.getString('ff_backgroundImageUrl') ?? _backgroundImageUrl;
    });
    _safeInit(() {
      _dalle3Used = prefs.getBool('ff_dalle3Used') ?? _dalle3Used;
    });
    _safeInit(() {
      _flowiseMessages = prefs
              .getStringList('ff_flowiseMessages')
              ?.map((x) {
                try {
                  return FlowiseMessagesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _flowiseMessages;
    });
    _safeInit(() {
      _activeThread = prefs.getString('ff_activeThread') ?? _activeThread;
    });
    _safeInit(() {
      _selectedLearnCardId =
          prefs.getString('ff_selectedLearnCardId') ?? _selectedLearnCardId;
    });
    _safeInit(() {
      _learnTopicProvided =
          prefs.getBool('ff_learnTopicProvided') ?? _learnTopicProvided;
    });
    _safeInit(() {
      _showReadingList =
          prefs.getBool('ff_showReadingList') ?? _showReadingList;
    });
    _safeInit(() {
      _showChat = prefs.getBool('ff_showChat') ?? _showChat;
    });
    _safeInit(() {
      _showMiddleContent =
          prefs.getBool('ff_showMiddleContent') ?? _showMiddleContent;
    });
    _safeInit(() {
      _welcomeIntro = prefs.getString('ff_welcomeIntro') ?? _welcomeIntro;
    });
    _safeInit(() {
      _companySecretCode =
          prefs.getString('ff_companySecretCode') ?? _companySecretCode;
    });
    _safeInit(() {
      _welcomeChatReady =
          prefs.getBool('ff_welcomeChatReady') ?? _welcomeChatReady;
    });
    _safeInit(() {
      _questionReady = prefs.getBool('ff_questionReady') ?? _questionReady;
    });
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
    _safeInit(() {
      _aTestString = prefs.getString('ff_aTestString') ?? _aTestString;
    });
    _safeInit(() {
      _debugCount = prefs.getInt('ff_debugCount') ?? _debugCount;
    });
    _safeInit(() {
      _selectedThreadId =
          prefs.getString('ff_selectedThreadId') ?? _selectedThreadId;
    });
    _safeInit(() {
      _showPane = prefs.getString('ff_showPane') ?? _showPane;
    });
    _safeInit(() {
      _selectedChatName =
          prefs.getString('ff_selectedChatName') ?? _selectedChatName;
    });
    _safeInit(() {
      _leftPane = prefs.getString('ff_leftPane') ?? _leftPane;
    });
    _safeInit(() {
      _middlePane = prefs.getString('ff_middlePane') ?? _middlePane;
    });
    _safeInit(() {
      _rightPane = prefs.getString('ff_rightPane') ?? _rightPane;
    });
    _safeInit(() {
      _leftColumnShow = prefs.getBool('ff_leftColumnShow') ?? _leftColumnShow;
    });
    _safeInit(() {
      _middleColumnShow =
          prefs.getBool('ff_middleColumnShow') ?? _middleColumnShow;
    });
    _safeInit(() {
      _rightColumnShow =
          prefs.getBool('ff_rightColumnShow') ?? _rightColumnShow;
    });
    _safeInit(() {
      _showLeftDrawer = prefs.getBool('ff_showLeftDrawer') ?? _showLeftDrawer;
    });
    _safeInit(() {
      _showRightDrawer =
          prefs.getBool('ff_showRightDrawer') ?? _showRightDrawer;
    });
    _safeInit(() {
      _hideColumn = prefs.getBool('ff_hideColumn') ?? _hideColumn;
    });
    _safeInit(() {
      _viewTileContentIdAI =
          prefs.getString('ff_viewTileContentIdAI') ?? _viewTileContentIdAI;
    });
    _safeInit(() {
      _selectedCategoryName =
          prefs.getString('ff_selectedCategoryName') ?? _selectedCategoryName;
    });
    _safeInit(() {
      _IsLearnCard = prefs.getBool('ff_IsLearnCard') ?? _IsLearnCard;
    });
    _safeInit(() {
      _selectedCompanyUrl =
          prefs.getString('ff_selectedCompanyUrl') ?? _selectedCompanyUrl;
    });
    _safeInit(() {
      _companyBackgroundImage = prefs.getString('ff_companyBackgroundImage') ??
          _companyBackgroundImage;
    });
    _safeInit(() {
      _selectedCompanyUrl2 =
          prefs.getString('ff_selectedCompanyUrl2') ?? _selectedCompanyUrl2;
    });
    _safeInit(() {
      _tempCoachMeThreadId =
          prefs.getString('ff_tempCoachMeThreadId') ?? _tempCoachMeThreadId;
    });
    _safeInit(() {
      _isAParent = prefs.getBool('ff_isAParent') ?? _isAParent;
    });
    _safeInit(() {
      _selectedMemberLevel =
          prefs.getString('ff_selectedMemberLevel') ?? _selectedMemberLevel;
    });
    _safeInit(() {
      _selectedTeam = prefs.getString('ff_selectedTeam') ?? _selectedTeam;
    });
    _safeInit(() {
      _selectedCompanyId =
          prefs.getString('ff_selectedCompanyId') ?? _selectedCompanyId;
    });
    _safeInit(() {
      _selectedMemberLevelName =
          prefs.getString('ff_selectedMemberLevelName') ??
              _selectedMemberLevelName;
    });
    _safeInit(() {
      _selectedParentId =
          prefs.getString('ff_selectedParentId') ?? _selectedParentId;
    });
    _safeInit(() {
      _selectedParentName =
          prefs.getString('ff_selectedParentName') ?? _selectedParentName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _viewTileContentId = 'id';
  String get viewTileContentId => _viewTileContentId;
  set viewTileContentId(String value) {
    _viewTileContentId = value;
  }

  String _selectedcategory = '';
  String get selectedcategory => _selectedcategory;
  set selectedcategory(String value) {
    _selectedcategory = value;
    prefs.setString('ff_selectedcategory', value);
  }

  String _selectedtrainingtype = '';
  String get selectedtrainingtype => _selectedtrainingtype;
  set selectedtrainingtype(String value) {
    _selectedtrainingtype = value;
  }

  String _selectedTile = '';
  String get selectedTile => _selectedTile;
  set selectedTile(String value) {
    _selectedTile = value;
  }

  String _trainingresources = '';
  String get trainingresources => _trainingresources;
  set trainingresources(String value) {
    _trainingresources = value;
  }

  bool _tabready = false;
  bool get tabready => _tabready;
  set tabready(bool value) {
    _tabready = value;
  }

  String _selectedtab = '';
  String get selectedtab => _selectedtab;
  set selectedtab(String value) {
    _selectedtab = value;
  }

  bool _commentson = false;
  bool get commentson => _commentson;
  set commentson(bool value) {
    _commentson = value;
  }

  bool _islive = false;
  bool get islive => _islive;
  set islive(bool value) {
    _islive = value;
  }

  List<DocumentReference> _usersonlinelive = [];
  List<DocumentReference> get usersonlinelive => _usersonlinelive;
  set usersonlinelive(List<DocumentReference> value) {
    _usersonlinelive = value;
  }

  void addToUsersonlinelive(DocumentReference value) {
    _usersonlinelive.add(value);
  }

  void removeFromUsersonlinelive(DocumentReference value) {
    _usersonlinelive.remove(value);
  }

  void removeAtIndexFromUsersonlinelive(int index) {
    _usersonlinelive.removeAt(index);
  }

  void updateUsersonlineliveAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _usersonlinelive[index] = updateFn(_usersonlinelive[index]);
  }

  void insertAtIndexInUsersonlinelive(int index, DocumentReference value) {
    _usersonlinelive.insert(index, value);
  }

  bool _hasaccessto50k = false;
  bool get hasaccessto50k => _hasaccessto50k;
  set hasaccessto50k(bool value) {
    _hasaccessto50k = value;
  }

  bool _hasaccessto100k = false;
  bool get hasaccessto100k => _hasaccessto100k;
  set hasaccessto100k(bool value) {
    _hasaccessto100k = value;
  }

  bool _hasaccessto250k = false;
  bool get hasaccessto250k => _hasaccessto250k;
  set hasaccessto250k(bool value) {
    _hasaccessto250k = value;
    prefs.setBool('ff_hasaccessto250k', value);
  }

  bool _showdata = false;
  bool get showdata => _showdata;
  set showdata(bool value) {
    _showdata = value;
  }

  bool _showpendingmembers = false;
  bool get showpendingmembers => _showpendingmembers;
  set showpendingmembers(bool value) {
    _showpendingmembers = value;
  }

  bool _showactivemembers = false;
  bool get showactivemembers => _showactivemembers;
  set showactivemembers(bool value) {
    _showactivemembers = value;
  }

  int _creatingTileTier = 0;
  int get creatingTileTier => _creatingTileTier;
  set creatingTileTier(int value) {
    _creatingTileTier = value;
  }

  int _currentTileTier = 0;
  int get currentTileTier => _currentTileTier;
  set currentTileTier(int value) {
    _currentTileTier = value;
    prefs.setInt('ff_currentTileTier', value);
  }

  DocumentReference? _SelectedTileRef;
  DocumentReference? get SelectedTileRef => _SelectedTileRef;
  set SelectedTileRef(DocumentReference? value) {
    _SelectedTileRef = value;
  }

  List<DocumentReference> _backbutton = [];
  List<DocumentReference> get backbutton => _backbutton;
  set backbutton(List<DocumentReference> value) {
    _backbutton = value;
    prefs.setStringList('ff_backbutton', value.map((x) => x.path).toList());
  }

  void addToBackbutton(DocumentReference value) {
    _backbutton.add(value);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  void removeFromBackbutton(DocumentReference value) {
    _backbutton.remove(value);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  void removeAtIndexFromBackbutton(int index) {
    _backbutton.removeAt(index);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  void updateBackbuttonAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _backbutton[index] = updateFn(_backbutton[index]);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  void insertAtIndexInBackbutton(int index, DocumentReference value) {
    _backbutton.insert(index, value);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  bool _readytopost = false;
  bool get readytopost => _readytopost;
  set readytopost(bool value) {
    _readytopost = value;
  }

  int _dismisscount = 0;
  int get dismisscount => _dismisscount;
  set dismisscount(int value) {
    _dismisscount = value;
    prefs.setInt('ff_dismisscount', value);
  }

  bool _isadminswitch = false;
  bool get isadminswitch => _isadminswitch;
  set isadminswitch(bool value) {
    _isadminswitch = value;
    prefs.setBool('ff_isadminswitch', value);
  }

  bool _showtellmemore = false;
  bool get showtellmemore => _showtellmemore;
  set showtellmemore(bool value) {
    _showtellmemore = value;
  }

  bool _novideostoshow = false;
  bool get novideostoshow => _novideostoshow;
  set novideostoshow(bool value) {
    _novideostoshow = value;
    prefs.setBool('ff_novideostoshow', value);
  }

  String _currentpagelink = '';
  String get currentpagelink => _currentpagelink;
  set currentpagelink(String value) {
    _currentpagelink = value;
  }

  String _searchterm = '';
  String get searchterm => _searchterm;
  set searchterm(String value) {
    _searchterm = value;
  }

  String _selectedsearch = '';
  String get selectedsearch => _selectedsearch;
  set selectedsearch(String value) {
    _selectedsearch = value;
  }

  bool _tilessearch = false;
  bool get tilessearch => _tilessearch;
  set tilessearch(bool value) {
    _tilessearch = value;
  }

  bool _videosearch = false;
  bool get videosearch => _videosearch;
  set videosearch(bool value) {
    _videosearch = value;
  }

  String _tempsearch = '';
  String get tempsearch => _tempsearch;
  set tempsearch(String value) {
    _tempsearch = value;
  }

  String _RefAsString = '';
  String get RefAsString => _RefAsString;
  set RefAsString(String value) {
    _RefAsString = value;
  }

  bool _slideronpage = false;
  bool get slideronpage => _slideronpage;
  set slideronpage(bool value) {
    _slideronpage = value;
  }

  bool _textblockonpage = false;
  bool get textblockonpage => _textblockonpage;
  set textblockonpage(bool value) {
    _textblockonpage = value;
  }

  bool _linksonpage = false;
  bool get linksonpage => _linksonpage;
  set linksonpage(bool value) {
    _linksonpage = value;
  }

  bool _docsonpage = false;
  bool get docsonpage => _docsonpage;
  set docsonpage(bool value) {
    _docsonpage = value;
  }

  bool _subtilesonpage = false;
  bool get subtilesonpage => _subtilesonpage;
  set subtilesonpage(bool value) {
    _subtilesonpage = value;
  }

  bool _historyActive = false;
  bool get historyActive => _historyActive;
  set historyActive(bool value) {
    _historyActive = value;
  }

  String _baseurl = 'https://';
  String get baseurl => _baseurl;
  set baseurl(String value) {
    _baseurl = value;
    prefs.setString('ff_baseurl', value);
  }

  bool _buttonsonpage = false;
  bool get buttonsonpage => _buttonsonpage;
  set buttonsonpage(bool value) {
    _buttonsonpage = value;
  }

  bool _tilesontilesonpage = false;
  bool get tilesontilesonpage => _tilesontilesonpage;
  set tilesontilesonpage(bool value) {
    _tilesontilesonpage = value;
  }

  bool _showDotMenu = false;
  bool get showDotMenu => _showDotMenu;
  set showDotMenu(bool value) {
    _showDotMenu = value;
  }

  bool _drawerMenu = false;
  bool get drawerMenu => _drawerMenu;
  set drawerMenu(bool value) {
    _drawerMenu = value;
  }

  bool _showresponse = false;
  bool get showresponse => _showresponse;
  set showresponse(bool value) {
    _showresponse = value;
  }

  DocumentReference? _selectedtilechangecolor;
  DocumentReference? get selectedtilechangecolor => _selectedtilechangecolor;
  set selectedtilechangecolor(DocumentReference? value) {
    _selectedtilechangecolor = value;
    value != null
        ? prefs.setString('ff_selectedtilechangecolor', value.path)
        : prefs.remove('ff_selectedtilechangecolor');
  }

  bool _listFull = false;
  bool get listFull => _listFull;
  set listFull(bool value) {
    _listFull = value;
  }

  DocumentReference? _lasttiletouched;
  DocumentReference? get lasttiletouched => _lasttiletouched;
  set lasttiletouched(DocumentReference? value) {
    _lasttiletouched = value;
  }

  DocumentReference? _selectedHistoryRef;
  DocumentReference? get selectedHistoryRef => _selectedHistoryRef;
  set selectedHistoryRef(DocumentReference? value) {
    _selectedHistoryRef = value;
  }

  bool _childrenfound = false;
  bool get childrenfound => _childrenfound;
  set childrenfound(bool value) {
    _childrenfound = value;
  }

  bool _showmenuopen = false;
  bool get showmenuopen => _showmenuopen;
  set showmenuopen(bool value) {
    _showmenuopen = value;
  }

  List<String> _selectedForLive = [];
  List<String> get selectedForLive => _selectedForLive;
  set selectedForLive(List<String> value) {
    _selectedForLive = value;
    prefs.setStringList('ff_selectedForLive', value);
  }

  void addToSelectedForLive(String value) {
    _selectedForLive.add(value);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  void removeFromSelectedForLive(String value) {
    _selectedForLive.remove(value);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  void removeAtIndexFromSelectedForLive(int index) {
    _selectedForLive.removeAt(index);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  void updateSelectedForLiveAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _selectedForLive[index] = updateFn(_selectedForLive[index]);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  void insertAtIndexInSelectedForLive(int index, String value) {
    _selectedForLive.insert(index, value);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  bool _menuopen = false;
  bool get menuopen => _menuopen;
  set menuopen(bool value) {
    _menuopen = value;
  }

  String _liveurl = '';
  String get liveurl => _liveurl;
  set liveurl(String value) {
    _liveurl = value;
  }

  bool _notifications = false;
  bool get notifications => _notifications;
  set notifications(bool value) {
    _notifications = value;
    prefs.setBool('ff_notifications', value);
  }

  DocumentReference? _selectedSubTilesRef;
  DocumentReference? get selectedSubTilesRef => _selectedSubTilesRef;
  set selectedSubTilesRef(DocumentReference? value) {
    _selectedSubTilesRef = value;
    value != null
        ? prefs.setString('ff_selectedSubTilesRef', value.path)
        : prefs.remove('ff_selectedSubTilesRef');
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
  }

  bool _isComplete = false;
  bool get isComplete => _isComplete;
  set isComplete(bool value) {
    _isComplete = value;
  }

  bool _isSubTile = false;
  bool get isSubTile => _isSubTile;
  set isSubTile(bool value) {
    _isSubTile = value;
  }

  String _aiResponse = '';
  String get aiResponse => _aiResponse;
  set aiResponse(String value) {
    _aiResponse = value;
  }

  List<DocumentReference> _tilesSelected = [];
  List<DocumentReference> get tilesSelected => _tilesSelected;
  set tilesSelected(List<DocumentReference> value) {
    _tilesSelected = value;
  }

  void addToTilesSelected(DocumentReference value) {
    _tilesSelected.add(value);
  }

  void removeFromTilesSelected(DocumentReference value) {
    _tilesSelected.remove(value);
  }

  void removeAtIndexFromTilesSelected(int index) {
    _tilesSelected.removeAt(index);
  }

  void updateTilesSelectedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _tilesSelected[index] = updateFn(_tilesSelected[index]);
  }

  void insertAtIndexInTilesSelected(int index, DocumentReference value) {
    _tilesSelected.insert(index, value);
  }

  bool _videoIsPlaying = false;
  bool get videoIsPlaying => _videoIsPlaying;
  set videoIsPlaying(bool value) {
    _videoIsPlaying = value;
  }

  String _recordedmp3 = '';
  String get recordedmp3 => _recordedmp3;
  set recordedmp3(String value) {
    _recordedmp3 = value;
  }

  DocumentReference? _selectedParentRef;
  DocumentReference? get selectedParentRef => _selectedParentRef;
  set selectedParentRef(DocumentReference? value) {
    _selectedParentRef = value;
  }

  DocumentReference? _mainTileRefSelected;
  DocumentReference? get mainTileRefSelected => _mainTileRefSelected;
  set mainTileRefSelected(DocumentReference? value) {
    _mainTileRefSelected = value;
  }

  DocumentReference? _grandParentTileRefSelected;
  DocumentReference? get grandParentTileRefSelected =>
      _grandParentTileRefSelected;
  set grandParentTileRefSelected(DocumentReference? value) {
    _grandParentTileRefSelected = value;
  }

  DocumentReference? _selectedsocialfeedref;
  DocumentReference? get selectedsocialfeedref => _selectedsocialfeedref;
  set selectedsocialfeedref(DocumentReference? value) {
    _selectedsocialfeedref = value;
  }

  DocumentReference? _selectedTileBlockRef;
  DocumentReference? get selectedTileBlockRef => _selectedTileBlockRef;
  set selectedTileBlockRef(DocumentReference? value) {
    _selectedTileBlockRef = value;
  }

  bool _ISAI = false;
  bool get ISAI => _ISAI;
  set ISAI(bool value) {
    _ISAI = value;
  }

  int _currentAIiD = 0;
  int get currentAIiD => _currentAIiD;
  set currentAIiD(int value) {
    _currentAIiD = value;
    prefs.setInt('ff_currentAIiD', value);
  }

  String _response = '';
  String get response => _response;
  set response(String value) {
    _response = value;
  }

  DocumentReference? _socialfeedRef;
  DocumentReference? get socialfeedRef => _socialfeedRef;
  set socialfeedRef(DocumentReference? value) {
    _socialfeedRef = value;
  }

  bool _isfeaturedpost = false;
  bool get isfeaturedpost => _isfeaturedpost;
  set isfeaturedpost(bool value) {
    _isfeaturedpost = value;
  }

  List<DocumentReference> _pushtopeople = [];
  List<DocumentReference> get pushtopeople => _pushtopeople;
  set pushtopeople(List<DocumentReference> value) {
    _pushtopeople = value;
  }

  void addToPushtopeople(DocumentReference value) {
    _pushtopeople.add(value);
  }

  void removeFromPushtopeople(DocumentReference value) {
    _pushtopeople.remove(value);
  }

  void removeAtIndexFromPushtopeople(int index) {
    _pushtopeople.removeAt(index);
  }

  void updatePushtopeopleAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _pushtopeople[index] = updateFn(_pushtopeople[index]);
  }

  void insertAtIndexInPushtopeople(int index, DocumentReference value) {
    _pushtopeople.insert(index, value);
  }

  List<DocumentReference> _selectedToShowMembers = [];
  List<DocumentReference> get selectedToShowMembers => _selectedToShowMembers;
  set selectedToShowMembers(List<DocumentReference> value) {
    _selectedToShowMembers = value;
  }

  void addToSelectedToShowMembers(DocumentReference value) {
    _selectedToShowMembers.add(value);
  }

  void removeFromSelectedToShowMembers(DocumentReference value) {
    _selectedToShowMembers.remove(value);
  }

  void removeAtIndexFromSelectedToShowMembers(int index) {
    _selectedToShowMembers.removeAt(index);
  }

  void updateSelectedToShowMembersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _selectedToShowMembers[index] = updateFn(_selectedToShowMembers[index]);
  }

  void insertAtIndexInSelectedToShowMembers(
      int index, DocumentReference value) {
    _selectedToShowMembers.insert(index, value);
  }

  List<DocumentReference> _categoriesSelected = [];
  List<DocumentReference> get categoriesSelected => _categoriesSelected;
  set categoriesSelected(List<DocumentReference> value) {
    _categoriesSelected = value;
  }

  void addToCategoriesSelected(DocumentReference value) {
    _categoriesSelected.add(value);
  }

  void removeFromCategoriesSelected(DocumentReference value) {
    _categoriesSelected.remove(value);
  }

  void removeAtIndexFromCategoriesSelected(int index) {
    _categoriesSelected.removeAt(index);
  }

  void updateCategoriesSelectedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _categoriesSelected[index] = updateFn(_categoriesSelected[index]);
  }

  void insertAtIndexInCategoriesSelected(int index, DocumentReference value) {
    _categoriesSelected.insert(index, value);
  }

  String _selectedType = '';
  String get selectedType => _selectedType;
  set selectedType(String value) {
    _selectedType = value;
  }

  bool _isIspMember = false;
  bool get isIspMember => _isIspMember;
  set isIspMember(bool value) {
    _isIspMember = value;
    prefs.setBool('ff_isIspMember', value);
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
    prefs.setString('ff_username', value);
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    prefs.setString('ff_password', value);
  }

  String _memberid = '';
  String get memberid => _memberid;
  set memberid(String value) {
    _memberid = value;
    prefs.setString('ff_memberid', value);
  }

  String _cpdscore = '';
  String get cpdscore => _cpdscore;
  set cpdscore(String value) {
    _cpdscore = value;
    prefs.setString('ff_cpdscore', value);
  }

  String _profilepic = '';
  String get profilepic => _profilepic;
  set profilepic(String value) {
    _profilepic = value;
    prefs.setString('ff_profilepic', value);
  }

  bool _isasubtile = false;
  bool get isasubtile => _isasubtile;
  set isasubtile(bool value) {
    _isasubtile = value;
  }

  List<String> _audienceforlives = [];
  List<String> get audienceforlives => _audienceforlives;
  set audienceforlives(List<String> value) {
    _audienceforlives = value;
  }

  void addToAudienceforlives(String value) {
    _audienceforlives.add(value);
  }

  void removeFromAudienceforlives(String value) {
    _audienceforlives.remove(value);
  }

  void removeAtIndexFromAudienceforlives(int index) {
    _audienceforlives.removeAt(index);
  }

  void updateAudienceforlivesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _audienceforlives[index] = updateFn(_audienceforlives[index]);
  }

  void insertAtIndexInAudienceforlives(int index, String value) {
    _audienceforlives.insert(index, value);
  }

  DocumentReference? _notificationsRef;
  DocumentReference? get notificationsRef => _notificationsRef;
  set notificationsRef(DocumentReference? value) {
    _notificationsRef = value;
  }

  bool _catnotifications = false;
  bool get catnotifications => _catnotifications;
  set catnotifications(bool value) {
    _catnotifications = value;
    prefs.setBool('ff_catnotifications', value);
  }

  TileNavStruct _tileNav = TileNavStruct.fromSerializableMap(jsonDecode(
      '{\"tier0_id\":\"0\",\"tier1_id\":\"0\",\"tier2_id\":\"0\",\"tier3_id\":\"0\",\"tier4_id\":\"0\"}'));
  TileNavStruct get tileNav => _tileNav;
  set tileNav(TileNavStruct value) {
    _tileNav = value;
    prefs.setString('ff_tileNav', value.serialize());
  }

  void updateTileNavStruct(Function(TileNavStruct) updateFn) {
    updateFn(_tileNav);
    prefs.setString('ff_tileNav', _tileNav.serialize());
  }

  String _viewTileCondtentId = 'id';
  String get viewTileCondtentId => _viewTileCondtentId;
  set viewTileCondtentId(String value) {
    _viewTileCondtentId = value;
  }

  String _callbackAction = 'GetStarted';
  String get callbackAction => _callbackAction;
  set callbackAction(String value) {
    _callbackAction = value;
  }

  List<String> _navPath = ['', ''];
  List<String> get navPath => _navPath;
  set navPath(List<String> value) {
    _navPath = value;
    prefs.setStringList('ff_navPath', value);
  }

  void addToNavPath(String value) {
    _navPath.add(value);
    prefs.setStringList('ff_navPath', _navPath);
  }

  void removeFromNavPath(String value) {
    _navPath.remove(value);
    prefs.setStringList('ff_navPath', _navPath);
  }

  void removeAtIndexFromNavPath(int index) {
    _navPath.removeAt(index);
    prefs.setStringList('ff_navPath', _navPath);
  }

  void updateNavPathAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _navPath[index] = updateFn(_navPath[index]);
    prefs.setStringList('ff_navPath', _navPath);
  }

  void insertAtIndexInNavPath(int index, String value) {
    _navPath.insert(index, value);
    prefs.setStringList('ff_navPath', _navPath);
  }

  String _drawerState = 'Tile';
  String get drawerState => _drawerState;
  set drawerState(String value) {
    _drawerState = value;
    prefs.setString('ff_drawerState', value);
  }

  String _drawerView = 'Tile';
  String get drawerView => _drawerView;
  set drawerView(String value) {
    _drawerView = value;
    prefs.setString('ff_drawerView', value);
  }

  String _drawerMode = 'New';
  String get drawerMode => _drawerMode;
  set drawerMode(String value) {
    _drawerMode = value;
    prefs.setString('ff_drawerMode', value);
  }

  String _drawerCurrentId = '';
  String get drawerCurrentId => _drawerCurrentId;
  set drawerCurrentId(String value) {
    _drawerCurrentId = value;
    prefs.setString('ff_drawerCurrentId', value);
  }

  bool _tempBoolean = false;
  bool get tempBoolean => _tempBoolean;
  set tempBoolean(bool value) {
    _tempBoolean = value;
  }

  List<BlockTypeStruct> _blockTypes = [
    BlockTypeStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"Text\",\"options\":\"[\\\"Heading\\\",\\\"Body\\\",\\\"List\\\"]\",\"data\":\"text\"}')),
    BlockTypeStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"Image\",\"options\":\"[\\\"Gallery\\\",\\\"Upload\\\",\\\"Link\\\"]\",\"data\":\"string\"}')),
    BlockTypeStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"video\",\"options\":\"[\\\"Upload\\\",\\\"Link\\\",\\\"Youtube\\\"]\",\"data\":\"string\"}')),
    BlockTypeStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"Document\",\"options\":\"[\\\"Upload\\\",\\\"Link\\\"]\",\"data\":\"Hello World\"}'))
  ];
  List<BlockTypeStruct> get blockTypes => _blockTypes;
  set blockTypes(List<BlockTypeStruct> value) {
    _blockTypes = value;
    prefs.setStringList(
        'ff_blockTypes', value.map((x) => x.serialize()).toList());
  }

  void addToBlockTypes(BlockTypeStruct value) {
    _blockTypes.add(value);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  void removeFromBlockTypes(BlockTypeStruct value) {
    _blockTypes.remove(value);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBlockTypes(int index) {
    _blockTypes.removeAt(index);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  void updateBlockTypesAtIndex(
    int index,
    BlockTypeStruct Function(BlockTypeStruct) updateFn,
  ) {
    _blockTypes[index] = updateFn(_blockTypes[index]);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBlockTypes(int index, BlockTypeStruct value) {
    _blockTypes.insert(index, value);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  int _drawerStartTab = 0;
  int get drawerStartTab => _drawerStartTab;
  set drawerStartTab(int value) {
    _drawerStartTab = value;
  }

  String _drawerBlockId = '';
  String get drawerBlockId => _drawerBlockId;
  set drawerBlockId(String value) {
    _drawerBlockId = value;
  }

  String _selectedBlockID = '';
  String get selectedBlockID => _selectedBlockID;
  set selectedBlockID(String value) {
    _selectedBlockID = value;
  }

  bool _isEdit = false;
  bool get isEdit => _isEdit;
  set isEdit(bool value) {
    _isEdit = value;
  }

  bool _readyToCreateTile = false;
  bool get readyToCreateTile => _readyToCreateTile;
  set readyToCreateTile(bool value) {
    _readyToCreateTile = value;
  }

  bool _createTilePressed = false;
  bool get createTilePressed => _createTilePressed;
  set createTilePressed(bool value) {
    _createTilePressed = value;
  }

  bool _showEdit = false;
  bool get showEdit => _showEdit;
  set showEdit(bool value) {
    _showEdit = value;
  }

  String _contentTypeChosen = '';
  String get contentTypeChosen => _contentTypeChosen;
  set contentTypeChosen(String value) {
    _contentTypeChosen = value;
  }

  bool _editMode = false;
  bool get editMode => _editMode;
  set editMode(bool value) {
    _editMode = value;
  }

  String _selectedEditItem = '';
  String get selectedEditItem => _selectedEditItem;
  set selectedEditItem(String value) {
    _selectedEditItem = value;
  }

  bool _blockCreateMode = false;
  bool get blockCreateMode => _blockCreateMode;
  set blockCreateMode(bool value) {
    _blockCreateMode = value;
  }

  FontSettingsStruct _fontSettingsLocal = FontSettingsStruct();
  FontSettingsStruct get fontSettingsLocal => _fontSettingsLocal;
  set fontSettingsLocal(FontSettingsStruct value) {
    _fontSettingsLocal = value;
  }

  void updateFontSettingsLocalStruct(Function(FontSettingsStruct) updateFn) {
    updateFn(_fontSettingsLocal);
  }

  bool _fontChangeInProgress = false;
  bool get fontChangeInProgress => _fontChangeInProgress;
  set fontChangeInProgress(bool value) {
    _fontChangeInProgress = value;
  }

  bool _showChangedType = false;
  bool get showChangedType => _showChangedType;
  set showChangedType(bool value) {
    _showChangedType = value;
  }

  bool _NewTileJustCreated = false;
  bool get NewTileJustCreated => _NewTileJustCreated;
  set NewTileJustCreated(bool value) {
    _NewTileJustCreated = value;
  }

  DocumentReference? _selectedTileRefV2;
  DocumentReference? get selectedTileRefV2 => _selectedTileRefV2;
  set selectedTileRefV2(DocumentReference? value) {
    _selectedTileRefV2 = value;
    value != null
        ? prefs.setString('ff_selectedTileRefV2', value.path)
        : prefs.remove('ff_selectedTileRefV2');
  }

  bool _showEditOverlays = false;
  bool get showEditOverlays => _showEditOverlays;
  set showEditOverlays(bool value) {
    _showEditOverlays = value;
  }

  List<String> _listOfQuestions = [
    'Question One',
    'Question Two',
    'Question Three\n'
  ];
  List<String> get listOfQuestions => _listOfQuestions;
  set listOfQuestions(List<String> value) {
    _listOfQuestions = value;
  }

  void addToListOfQuestions(String value) {
    _listOfQuestions.add(value);
  }

  void removeFromListOfQuestions(String value) {
    _listOfQuestions.remove(value);
  }

  void removeAtIndexFromListOfQuestions(int index) {
    _listOfQuestions.removeAt(index);
  }

  void updateListOfQuestionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _listOfQuestions[index] = updateFn(_listOfQuestions[index]);
  }

  void insertAtIndexInListOfQuestions(int index, String value) {
    _listOfQuestions.insert(index, value);
  }

  bool _showTileTierZero = false;
  bool get showTileTierZero => _showTileTierZero;
  set showTileTierZero(bool value) {
    _showTileTierZero = value;
    prefs.setBool('ff_showTileTierZero', value);
  }

  int _currentIndexId = 0;
  int get currentIndexId => _currentIndexId;
  set currentIndexId(int value) {
    _currentIndexId = value;
  }

  String _videoControlType = '';
  String get videoControlType => _videoControlType;
  set videoControlType(String value) {
    _videoControlType = value;
  }

  AnalyticsDataStruct _analyticsLocal = AnalyticsDataStruct();
  AnalyticsDataStruct get analyticsLocal => _analyticsLocal;
  set analyticsLocal(AnalyticsDataStruct value) {
    _analyticsLocal = value;
  }

  void updateAnalyticsLocalStruct(Function(AnalyticsDataStruct) updateFn) {
    updateFn(_analyticsLocal);
  }

  bool _showQuizBuilder = false;
  bool get showQuizBuilder => _showQuizBuilder;
  set showQuizBuilder(bool value) {
    _showQuizBuilder = value;
  }

  String _convertedVideoUrl = 'ok';
  String get convertedVideoUrl => _convertedVideoUrl;
  set convertedVideoUrl(String value) {
    _convertedVideoUrl = value;
  }

  String _convertedVideoUrlnot = '';
  String get convertedVideoUrlnot => _convertedVideoUrlnot;
  set convertedVideoUrlnot(String value) {
    _convertedVideoUrlnot = value;
  }

  double _countDownTime = 30.0;
  double get countDownTime => _countDownTime;
  set countDownTime(double value) {
    _countDownTime = value;
  }

  bool _QuizReadyToMoveOn = false;
  bool get QuizReadyToMoveOn => _QuizReadyToMoveOn;
  set QuizReadyToMoveOn(bool value) {
    _QuizReadyToMoveOn = value;
  }

  bool _stopQuiz = false;
  bool get stopQuiz => _stopQuiz;
  set stopQuiz(bool value) {
    _stopQuiz = value;
  }

  double _currentTimer = 0.0;
  double get currentTimer => _currentTimer;
  set currentTimer(double value) {
    _currentTimer = value;
    prefs.setDouble('ff_currentTimer', value);
  }

  String _correctAnswerAS = '';
  String get correctAnswerAS => _correctAnswerAS;
  set correctAnswerAS(String value) {
    _correctAnswerAS = value;
  }

  String _answerGiven = '';
  String get answerGiven => _answerGiven;
  set answerGiven(String value) {
    _answerGiven = value;
  }

  int _localQuizId = 0;
  int get localQuizId => _localQuizId;
  set localQuizId(int value) {
    _localQuizId = value;
    prefs.setInt('ff_localQuizId', value);
  }

  List<UserChatsStruct> _userChats = [
    UserChatsStruct.fromSerializableMap(jsonDecode(
        '{\"message\":\"Hello World\",\"role\":\"Hello World\",\"timestamp\":\"1700391138346\"}'))
  ];
  List<UserChatsStruct> get userChats => _userChats;
  set userChats(List<UserChatsStruct> value) {
    _userChats = value;
    prefs.setStringList(
        'ff_userChats', value.map((x) => x.serialize()).toList());
  }

  void addToUserChats(UserChatsStruct value) {
    _userChats.add(value);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  void removeFromUserChats(UserChatsStruct value) {
    _userChats.remove(value);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUserChats(int index) {
    _userChats.removeAt(index);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  void updateUserChatsAtIndex(
    int index,
    UserChatsStruct Function(UserChatsStruct) updateFn,
  ) {
    _userChats[index] = updateFn(_userChats[index]);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUserChats(int index, UserChatsStruct value) {
    _userChats.insert(index, value);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  bool _processingFlowise = false;
  bool get processingFlowise => _processingFlowise;
  set processingFlowise(bool value) {
    _processingFlowise = value;
  }

  String _sessionid = '';
  String get sessionid => _sessionid;
  set sessionid(String value) {
    _sessionid = value;
  }

  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String value) {
    _sessionId = value;
    prefs.setString('ff_sessionId', value);
  }

  String _learningData = '';
  String get learningData => _learningData;
  set learningData(String value) {
    _learningData = value;
  }

  bool _endDrawerOpen = false;
  bool get endDrawerOpen => _endDrawerOpen;
  set endDrawerOpen(bool value) {
    _endDrawerOpen = value;
    prefs.setBool('ff_endDrawerOpen', value);
  }

  String _nonLoggedInSessionId = '';
  String get nonLoggedInSessionId => _nonLoggedInSessionId;
  set nonLoggedInSessionId(String value) {
    _nonLoggedInSessionId = value;
    prefs.setString('ff_nonLoggedInSessionId', value);
  }

  String _flowiseStreamingText = '';
  String get flowiseStreamingText => _flowiseStreamingText;
  set flowiseStreamingText(String value) {
    _flowiseStreamingText = value;
  }

  List<String> _openAiData = [];
  List<String> get openAiData => _openAiData;
  set openAiData(List<String> value) {
    _openAiData = value;
    prefs.setStringList('ff_openAiData', value);
  }

  void addToOpenAiData(String value) {
    _openAiData.add(value);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  void removeFromOpenAiData(String value) {
    _openAiData.remove(value);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  void removeAtIndexFromOpenAiData(int index) {
    _openAiData.removeAt(index);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  void updateOpenAiDataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _openAiData[index] = updateFn(_openAiData[index]);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  void insertAtIndexInOpenAiData(int index, String value) {
    _openAiData.insert(index, value);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  bool _readyToImage = false;
  bool get readyToImage => _readyToImage;
  set readyToImage(bool value) {
    _readyToImage = value;
    prefs.setBool('ff_readyToImage', value);
  }

  String _backgroundImage = '';
  String get backgroundImage => _backgroundImage;
  set backgroundImage(String value) {
    _backgroundImage = value;
    prefs.setString('ff_backgroundImage', value);
  }

  String _backgroundImageUrl = '';
  String get backgroundImageUrl => _backgroundImageUrl;
  set backgroundImageUrl(String value) {
    _backgroundImageUrl = value;
    prefs.setString('ff_backgroundImageUrl', value);
  }

  bool _dalle3Used = false;
  bool get dalle3Used => _dalle3Used;
  set dalle3Used(bool value) {
    _dalle3Used = value;
    prefs.setBool('ff_dalle3Used', value);
  }

  bool _apiActive = false;
  bool get apiActive => _apiActive;
  set apiActive(bool value) {
    _apiActive = value;
  }

  List<FlowiseMessagesStruct> _flowiseMessages = [];
  List<FlowiseMessagesStruct> get flowiseMessages => _flowiseMessages;
  set flowiseMessages(List<FlowiseMessagesStruct> value) {
    _flowiseMessages = value;
    prefs.setStringList(
        'ff_flowiseMessages', value.map((x) => x.serialize()).toList());
  }

  void addToFlowiseMessages(FlowiseMessagesStruct value) {
    _flowiseMessages.add(value);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  void removeFromFlowiseMessages(FlowiseMessagesStruct value) {
    _flowiseMessages.remove(value);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFlowiseMessages(int index) {
    _flowiseMessages.removeAt(index);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  void updateFlowiseMessagesAtIndex(
    int index,
    FlowiseMessagesStruct Function(FlowiseMessagesStruct) updateFn,
  ) {
    _flowiseMessages[index] = updateFn(_flowiseMessages[index]);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFlowiseMessages(
      int index, FlowiseMessagesStruct value) {
    _flowiseMessages.insert(index, value);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  String _activeThread = '';
  String get activeThread => _activeThread;
  set activeThread(String value) {
    _activeThread = value;
    prefs.setString('ff_activeThread', value);
  }

  String _tempStreamingMessage = '';
  String get tempStreamingMessage => _tempStreamingMessage;
  set tempStreamingMessage(String value) {
    _tempStreamingMessage = value;
  }

  String _learningTypeSelected = '';
  String get learningTypeSelected => _learningTypeSelected;
  set learningTypeSelected(String value) {
    _learningTypeSelected = value;
  }

  String _companyAiData = '';
  String get companyAiData => _companyAiData;
  set companyAiData(String value) {
    _companyAiData = value;
  }

  String _selectedTopic = '';
  String get selectedTopic => _selectedTopic;
  set selectedTopic(String value) {
    _selectedTopic = value;
  }

  String _selectedReadingItem = '';
  String get selectedReadingItem => _selectedReadingItem;
  set selectedReadingItem(String value) {
    _selectedReadingItem = value;
  }

  int _loopCounter = 0;
  int get loopCounter => _loopCounter;
  set loopCounter(int value) {
    _loopCounter = value;
  }

  String _selectedLearnCardId = '';
  String get selectedLearnCardId => _selectedLearnCardId;
  set selectedLearnCardId(String value) {
    _selectedLearnCardId = value;
    prefs.setString('ff_selectedLearnCardId', value);
  }

  bool _learnTopicProvided = false;
  bool get learnTopicProvided => _learnTopicProvided;
  set learnTopicProvided(bool value) {
    _learnTopicProvided = value;
    prefs.setBool('ff_learnTopicProvided', value);
  }

  bool _showReadingList = false;
  bool get showReadingList => _showReadingList;
  set showReadingList(bool value) {
    _showReadingList = value;
    prefs.setBool('ff_showReadingList', value);
  }

  bool _showChat = false;
  bool get showChat => _showChat;
  set showChat(bool value) {
    _showChat = value;
    prefs.setBool('ff_showChat', value);
  }

  bool _showMiddleContent = false;
  bool get showMiddleContent => _showMiddleContent;
  set showMiddleContent(bool value) {
    _showMiddleContent = value;
    prefs.setBool('ff_showMiddleContent', value);
  }

  bool _showLearnJourneys = false;
  bool get showLearnJourneys => _showLearnJourneys;
  set showLearnJourneys(bool value) {
    _showLearnJourneys = value;
  }

  String _welcomeIntro = '';
  String get welcomeIntro => _welcomeIntro;
  set welcomeIntro(String value) {
    _welcomeIntro = value;
    prefs.setString('ff_welcomeIntro', value);
  }

  String _companySecretCode = '';
  String get companySecretCode => _companySecretCode;
  set companySecretCode(String value) {
    _companySecretCode = value;
    prefs.setString('ff_companySecretCode', value);
  }

  bool _welcomeChatReady = false;
  bool get welcomeChatReady => _welcomeChatReady;
  set welcomeChatReady(bool value) {
    _welcomeChatReady = value;
    prefs.setBool('ff_welcomeChatReady', value);
  }

  bool _questionReady = false;
  bool get questionReady => _questionReady;
  set questionReady(bool value) {
    _questionReady = value;
    prefs.setBool('ff_questionReady', value);
  }

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    prefs.setString('ff_apiKey', value);
  }

  List<ChatResponseStruct> _chatHistory = [];
  List<ChatResponseStruct> get chatHistory => _chatHistory;
  set chatHistory(List<ChatResponseStruct> value) {
    _chatHistory = value;
  }

  void addToChatHistory(ChatResponseStruct value) {
    _chatHistory.add(value);
  }

  void removeFromChatHistory(ChatResponseStruct value) {
    _chatHistory.remove(value);
  }

  void removeAtIndexFromChatHistory(int index) {
    _chatHistory.removeAt(index);
  }

  void updateChatHistoryAtIndex(
    int index,
    ChatResponseStruct Function(ChatResponseStruct) updateFn,
  ) {
    _chatHistory[index] = updateFn(_chatHistory[index]);
  }

  void insertAtIndexInChatHistory(int index, ChatResponseStruct value) {
    _chatHistory.insert(index, value);
  }

  List<HintPromptListStruct> _hintPromptList = [
    HintPromptListStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Suggest a recipie\",\"description\":\"That contains tomatoes and onions\"}'))
  ];
  List<HintPromptListStruct> get hintPromptList => _hintPromptList;
  set hintPromptList(List<HintPromptListStruct> value) {
    _hintPromptList = value;
  }

  void addToHintPromptList(HintPromptListStruct value) {
    _hintPromptList.add(value);
  }

  void removeFromHintPromptList(HintPromptListStruct value) {
    _hintPromptList.remove(value);
  }

  void removeAtIndexFromHintPromptList(int index) {
    _hintPromptList.removeAt(index);
  }

  void updateHintPromptListAtIndex(
    int index,
    HintPromptListStruct Function(HintPromptListStruct) updateFn,
  ) {
    _hintPromptList[index] = updateFn(_hintPromptList[index]);
  }

  void insertAtIndexInHintPromptList(int index, HintPromptListStruct value) {
    _hintPromptList.insert(index, value);
  }

  List<String> _chatMessageStringsTest = [];
  List<String> get chatMessageStringsTest => _chatMessageStringsTest;
  set chatMessageStringsTest(List<String> value) {
    _chatMessageStringsTest = value;
  }

  void addToChatMessageStringsTest(String value) {
    _chatMessageStringsTest.add(value);
  }

  void removeFromChatMessageStringsTest(String value) {
    _chatMessageStringsTest.remove(value);
  }

  void removeAtIndexFromChatMessageStringsTest(int index) {
    _chatMessageStringsTest.removeAt(index);
  }

  void updateChatMessageStringsTestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _chatMessageStringsTest[index] = updateFn(_chatMessageStringsTest[index]);
  }

  void insertAtIndexInChatMessageStringsTest(int index, String value) {
    _chatMessageStringsTest.insert(index, value);
  }

  String _aTestString = '';
  String get aTestString => _aTestString;
  set aTestString(String value) {
    _aTestString = value;
    prefs.setString('ff_aTestString', value);
  }

  String _aggregatedResponse = '';
  String get aggregatedResponse => _aggregatedResponse;
  set aggregatedResponse(String value) {
    _aggregatedResponse = value;
  }

  List<ChatResponseStruct> _firebaseStoreChatResponse = [];
  List<ChatResponseStruct> get firebaseStoreChatResponse =>
      _firebaseStoreChatResponse;
  set firebaseStoreChatResponse(List<ChatResponseStruct> value) {
    _firebaseStoreChatResponse = value;
  }

  void addToFirebaseStoreChatResponse(ChatResponseStruct value) {
    _firebaseStoreChatResponse.add(value);
  }

  void removeFromFirebaseStoreChatResponse(ChatResponseStruct value) {
    _firebaseStoreChatResponse.remove(value);
  }

  void removeAtIndexFromFirebaseStoreChatResponse(int index) {
    _firebaseStoreChatResponse.removeAt(index);
  }

  void updateFirebaseStoreChatResponseAtIndex(
    int index,
    ChatResponseStruct Function(ChatResponseStruct) updateFn,
  ) {
    _firebaseStoreChatResponse[index] =
        updateFn(_firebaseStoreChatResponse[index]);
  }

  void insertAtIndexInFirebaseStoreChatResponse(
      int index, ChatResponseStruct value) {
    _firebaseStoreChatResponse.insert(index, value);
  }

  String _tempOpenAIText = '';
  String get tempOpenAIText => _tempOpenAIText;
  set tempOpenAIText(String value) {
    _tempOpenAIText = value;
  }

  int _debugCount = 0;
  int get debugCount => _debugCount;
  set debugCount(int value) {
    _debugCount = value;
    prefs.setInt('ff_debugCount', value);
  }

  String _selectedThreadId = '';
  String get selectedThreadId => _selectedThreadId;
  set selectedThreadId(String value) {
    _selectedThreadId = value;
    prefs.setString('ff_selectedThreadId', value);
  }

  String _showPane = 'menu';
  String get showPane => _showPane;
  set showPane(String value) {
    _showPane = value;
    prefs.setString('ff_showPane', value);
  }

  String _selectedChatName = '';
  String get selectedChatName => _selectedChatName;
  set selectedChatName(String value) {
    _selectedChatName = value;
    prefs.setString('ff_selectedChatName', value);
  }

  String _leftPane = '';
  String get leftPane => _leftPane;
  set leftPane(String value) {
    _leftPane = value;
    prefs.setString('ff_leftPane', value);
  }

  String _middlePane = '';
  String get middlePane => _middlePane;
  set middlePane(String value) {
    _middlePane = value;
    prefs.setString('ff_middlePane', value);
  }

  String _rightPane = '';
  String get rightPane => _rightPane;
  set rightPane(String value) {
    _rightPane = value;
    prefs.setString('ff_rightPane', value);
  }

  bool _leftColumnShow = false;
  bool get leftColumnShow => _leftColumnShow;
  set leftColumnShow(bool value) {
    _leftColumnShow = value;
    prefs.setBool('ff_leftColumnShow', value);
  }

  bool _middleColumnShow = false;
  bool get middleColumnShow => _middleColumnShow;
  set middleColumnShow(bool value) {
    _middleColumnShow = value;
    prefs.setBool('ff_middleColumnShow', value);
  }

  bool _rightColumnShow = false;
  bool get rightColumnShow => _rightColumnShow;
  set rightColumnShow(bool value) {
    _rightColumnShow = value;
    prefs.setBool('ff_rightColumnShow', value);
  }

  bool _showLeftDrawer = false;
  bool get showLeftDrawer => _showLeftDrawer;
  set showLeftDrawer(bool value) {
    _showLeftDrawer = value;
    prefs.setBool('ff_showLeftDrawer', value);
  }

  bool _showRightDrawer = false;
  bool get showRightDrawer => _showRightDrawer;
  set showRightDrawer(bool value) {
    _showRightDrawer = value;
    prefs.setBool('ff_showRightDrawer', value);
  }

  bool _hideColumn = false;
  bool get hideColumn => _hideColumn;
  set hideColumn(bool value) {
    _hideColumn = value;
    prefs.setBool('ff_hideColumn', value);
  }

  String _viewTileContentIdAI = '';
  String get viewTileContentIdAI => _viewTileContentIdAI;
  set viewTileContentIdAI(String value) {
    _viewTileContentIdAI = value;
    prefs.setString('ff_viewTileContentIdAI', value);
  }

  String _debugMessage = '';
  String get debugMessage => _debugMessage;
  set debugMessage(String value) {
    _debugMessage = value;
  }

  String _selectedCategoryName = '';
  String get selectedCategoryName => _selectedCategoryName;
  set selectedCategoryName(String value) {
    _selectedCategoryName = value;
    prefs.setString('ff_selectedCategoryName', value);
  }

  bool _IsLearnCard = false;
  bool get IsLearnCard => _IsLearnCard;
  set IsLearnCard(bool value) {
    _IsLearnCard = value;
    prefs.setBool('ff_IsLearnCard', value);
  }

  String _selectedCompanyUrl = '';
  String get selectedCompanyUrl => _selectedCompanyUrl;
  set selectedCompanyUrl(String value) {
    _selectedCompanyUrl = value;
    prefs.setString('ff_selectedCompanyUrl', value);
  }

  String _companyBackgroundImage = '';
  String get companyBackgroundImage => _companyBackgroundImage;
  set companyBackgroundImage(String value) {
    _companyBackgroundImage = value;
    prefs.setString('ff_companyBackgroundImage', value);
  }

  String _selectedCompanyUrl2 = '';
  String get selectedCompanyUrl2 => _selectedCompanyUrl2;
  set selectedCompanyUrl2(String value) {
    _selectedCompanyUrl2 = value;
    prefs.setString('ff_selectedCompanyUrl2', value);
  }

  String _tempCoachMeThreadId = '';
  String get tempCoachMeThreadId => _tempCoachMeThreadId;
  set tempCoachMeThreadId(String value) {
    _tempCoachMeThreadId = value;
    prefs.setString('ff_tempCoachMeThreadId', value);
  }

  bool _isAParent = false;
  bool get isAParent => _isAParent;
  set isAParent(bool value) {
    _isAParent = value;
    prefs.setBool('ff_isAParent', value);
  }

  String _chatType = '';
  String get chatType => _chatType;
  set chatType(String value) {
    _chatType = value;
  }

  String _selectedMemberLevel = '';
  String get selectedMemberLevel => _selectedMemberLevel;
  set selectedMemberLevel(String value) {
    _selectedMemberLevel = value;
    prefs.setString('ff_selectedMemberLevel', value);
  }

  String _selectedTeam = '';
  String get selectedTeam => _selectedTeam;
  set selectedTeam(String value) {
    _selectedTeam = value;
    prefs.setString('ff_selectedTeam', value);
  }

  String _selectedSessionId = '';
  String get selectedSessionId => _selectedSessionId;
  set selectedSessionId(String value) {
    _selectedSessionId = value;
  }

  bool _showLearnCard = false;
  bool get showLearnCard => _showLearnCard;
  set showLearnCard(bool value) {
    _showLearnCard = value;
  }

  String _selectedCompanyId = '';
  String get selectedCompanyId => _selectedCompanyId;
  set selectedCompanyId(String value) {
    _selectedCompanyId = value;
    prefs.setString('ff_selectedCompanyId', value);
  }

  String _selectedMemberLevelName = '';
  String get selectedMemberLevelName => _selectedMemberLevelName;
  set selectedMemberLevelName(String value) {
    _selectedMemberLevelName = value;
    prefs.setString('ff_selectedMemberLevelName', value);
  }

  String _selectedParentId = '';
  String get selectedParentId => _selectedParentId;
  set selectedParentId(String value) {
    _selectedParentId = value;
    prefs.setString('ff_selectedParentId', value);
  }

  String _selectedParentName = '';
  String get selectedParentName => _selectedParentName;
  set selectedParentName(String value) {
    _selectedParentName = value;
    prefs.setString('ff_selectedParentName', value);
  }

  bool _bottomSheetOpen = false;
  bool get bottomSheetOpen => _bottomSheetOpen;
  set bottomSheetOpen(bool value) {
    _bottomSheetOpen = value;
  }

  bool _debugMode = false;
  bool get debugMode => _debugMode;
  set debugMode(bool value) {
    _debugMode = value;
  }

  final _querynameManager = StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> queryname({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _querynameManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQuerynameCache() => _querynameManager.clear();
  void clearQuerynameCacheKey(String? uniqueKey) =>
      _querynameManager.clearRequest(uniqueKey);

  final _queryname1Manager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> queryname1({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _queryname1Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryname1Cache() => _queryname1Manager.clear();
  void clearQueryname1CacheKey(String? uniqueKey) =>
      _queryname1Manager.clearRequest(uniqueKey);

  final _tilesv2ByIndexManager = StreamRequestManager<List<Tilesv2Record>>();
  Stream<List<Tilesv2Record>> tilesv2ByIndex({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<Tilesv2Record>> Function() requestFn,
  }) =>
      _tilesv2ByIndexManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTilesv2ByIndexCache() => _tilesv2ByIndexManager.clear();
  void clearTilesv2ByIndexCacheKey(String? uniqueKey) =>
      _tilesv2ByIndexManager.clearRequest(uniqueKey);

  final _sessionsBySessionidManager =
      StreamRequestManager<List<SessionsRecord>>();
  Stream<List<SessionsRecord>> sessionsBySessionid({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SessionsRecord>> Function() requestFn,
  }) =>
      _sessionsBySessionidManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSessionsBySessionidCache() => _sessionsBySessionidManager.clear();
  void clearSessionsBySessionidCacheKey(String? uniqueKey) =>
      _sessionsBySessionidManager.clearRequest(uniqueKey);

  final _companyCodeManager = StreamRequestManager<List<CompaniesRecord>>();
  Stream<List<CompaniesRecord>> companyCode({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CompaniesRecord>> Function() requestFn,
  }) =>
      _companyCodeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCompanyCodeCache() => _companyCodeManager.clear();
  void clearCompanyCodeCacheKey(String? uniqueKey) =>
      _companyCodeManager.clearRequest(uniqueKey);

  final _tileBlocksIndexManager =
      StreamRequestManager<List<TileBlocksRecord>>();
  Stream<List<TileBlocksRecord>> tileBlocksIndex({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TileBlocksRecord>> Function() requestFn,
  }) =>
      _tileBlocksIndexManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTileBlocksIndexCache() => _tileBlocksIndexManager.clear();
  void clearTileBlocksIndexCacheKey(String? uniqueKey) =>
      _tileBlocksIndexManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
