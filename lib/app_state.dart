import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
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
    _safeInit(() {
      _companyDocId = prefs.getString('ff_companyDocId') ?? _companyDocId;
    });
    _safeInit(() {
      _learnCardDescription =
          prefs.getString('ff_learnCardDescription') ?? _learnCardDescription;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _viewTileContentId = 'id';
  String get viewTileContentId => _viewTileContentId;
  set viewTileContentId(String _value) {
    _viewTileContentId = _value;
  }

  String _selectedcategory = '';
  String get selectedcategory => _selectedcategory;
  set selectedcategory(String _value) {
    _selectedcategory = _value;
    prefs.setString('ff_selectedcategory', _value);
  }

  String _selectedtrainingtype = '';
  String get selectedtrainingtype => _selectedtrainingtype;
  set selectedtrainingtype(String _value) {
    _selectedtrainingtype = _value;
  }

  String _selectedTile = '';
  String get selectedTile => _selectedTile;
  set selectedTile(String _value) {
    _selectedTile = _value;
  }

  String _trainingresources = '';
  String get trainingresources => _trainingresources;
  set trainingresources(String _value) {
    _trainingresources = _value;
  }

  bool _tabready = false;
  bool get tabready => _tabready;
  set tabready(bool _value) {
    _tabready = _value;
  }

  String _selectedtab = '';
  String get selectedtab => _selectedtab;
  set selectedtab(String _value) {
    _selectedtab = _value;
  }

  bool _commentson = false;
  bool get commentson => _commentson;
  set commentson(bool _value) {
    _commentson = _value;
  }

  bool _islive = false;
  bool get islive => _islive;
  set islive(bool _value) {
    _islive = _value;
  }

  List<DocumentReference> _usersonlinelive = [];
  List<DocumentReference> get usersonlinelive => _usersonlinelive;
  set usersonlinelive(List<DocumentReference> _value) {
    _usersonlinelive = _value;
  }

  void addToUsersonlinelive(DocumentReference _value) {
    _usersonlinelive.add(_value);
  }

  void removeFromUsersonlinelive(DocumentReference _value) {
    _usersonlinelive.remove(_value);
  }

  void removeAtIndexFromUsersonlinelive(int _index) {
    _usersonlinelive.removeAt(_index);
  }

  void updateUsersonlineliveAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _usersonlinelive[_index] = updateFn(_usersonlinelive[_index]);
  }

  void insertAtIndexInUsersonlinelive(int _index, DocumentReference _value) {
    _usersonlinelive.insert(_index, _value);
  }

  bool _hasaccessto50k = false;
  bool get hasaccessto50k => _hasaccessto50k;
  set hasaccessto50k(bool _value) {
    _hasaccessto50k = _value;
  }

  bool _hasaccessto100k = false;
  bool get hasaccessto100k => _hasaccessto100k;
  set hasaccessto100k(bool _value) {
    _hasaccessto100k = _value;
  }

  bool _hasaccessto250k = false;
  bool get hasaccessto250k => _hasaccessto250k;
  set hasaccessto250k(bool _value) {
    _hasaccessto250k = _value;
    prefs.setBool('ff_hasaccessto250k', _value);
  }

  bool _showdata = false;
  bool get showdata => _showdata;
  set showdata(bool _value) {
    _showdata = _value;
  }

  bool _showpendingmembers = false;
  bool get showpendingmembers => _showpendingmembers;
  set showpendingmembers(bool _value) {
    _showpendingmembers = _value;
  }

  bool _showactivemembers = false;
  bool get showactivemembers => _showactivemembers;
  set showactivemembers(bool _value) {
    _showactivemembers = _value;
  }

  int _creatingTileTier = 0;
  int get creatingTileTier => _creatingTileTier;
  set creatingTileTier(int _value) {
    _creatingTileTier = _value;
  }

  int _currentTileTier = 0;
  int get currentTileTier => _currentTileTier;
  set currentTileTier(int _value) {
    _currentTileTier = _value;
    prefs.setInt('ff_currentTileTier', _value);
  }

  DocumentReference? _SelectedTileRef;
  DocumentReference? get SelectedTileRef => _SelectedTileRef;
  set SelectedTileRef(DocumentReference? _value) {
    _SelectedTileRef = _value;
  }

  List<DocumentReference> _backbutton = [];
  List<DocumentReference> get backbutton => _backbutton;
  set backbutton(List<DocumentReference> _value) {
    _backbutton = _value;
    prefs.setStringList('ff_backbutton', _value.map((x) => x.path).toList());
  }

  void addToBackbutton(DocumentReference _value) {
    _backbutton.add(_value);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  void removeFromBackbutton(DocumentReference _value) {
    _backbutton.remove(_value);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  void removeAtIndexFromBackbutton(int _index) {
    _backbutton.removeAt(_index);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  void updateBackbuttonAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _backbutton[_index] = updateFn(_backbutton[_index]);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  void insertAtIndexInBackbutton(int _index, DocumentReference _value) {
    _backbutton.insert(_index, _value);
    prefs.setStringList(
        'ff_backbutton', _backbutton.map((x) => x.path).toList());
  }

  bool _readytopost = false;
  bool get readytopost => _readytopost;
  set readytopost(bool _value) {
    _readytopost = _value;
  }

  int _dismisscount = 0;
  int get dismisscount => _dismisscount;
  set dismisscount(int _value) {
    _dismisscount = _value;
    prefs.setInt('ff_dismisscount', _value);
  }

  bool _isadminswitch = false;
  bool get isadminswitch => _isadminswitch;
  set isadminswitch(bool _value) {
    _isadminswitch = _value;
    prefs.setBool('ff_isadminswitch', _value);
  }

  bool _showtellmemore = false;
  bool get showtellmemore => _showtellmemore;
  set showtellmemore(bool _value) {
    _showtellmemore = _value;
  }

  bool _novideostoshow = false;
  bool get novideostoshow => _novideostoshow;
  set novideostoshow(bool _value) {
    _novideostoshow = _value;
    prefs.setBool('ff_novideostoshow', _value);
  }

  String _currentpagelink = '';
  String get currentpagelink => _currentpagelink;
  set currentpagelink(String _value) {
    _currentpagelink = _value;
  }

  String _searchterm = '';
  String get searchterm => _searchterm;
  set searchterm(String _value) {
    _searchterm = _value;
  }

  String _selectedsearch = '';
  String get selectedsearch => _selectedsearch;
  set selectedsearch(String _value) {
    _selectedsearch = _value;
  }

  bool _tilessearch = false;
  bool get tilessearch => _tilessearch;
  set tilessearch(bool _value) {
    _tilessearch = _value;
  }

  bool _videosearch = false;
  bool get videosearch => _videosearch;
  set videosearch(bool _value) {
    _videosearch = _value;
  }

  String _tempsearch = '';
  String get tempsearch => _tempsearch;
  set tempsearch(String _value) {
    _tempsearch = _value;
  }

  String _RefAsString = '';
  String get RefAsString => _RefAsString;
  set RefAsString(String _value) {
    _RefAsString = _value;
  }

  bool _slideronpage = false;
  bool get slideronpage => _slideronpage;
  set slideronpage(bool _value) {
    _slideronpage = _value;
  }

  bool _textblockonpage = false;
  bool get textblockonpage => _textblockonpage;
  set textblockonpage(bool _value) {
    _textblockonpage = _value;
  }

  bool _linksonpage = false;
  bool get linksonpage => _linksonpage;
  set linksonpage(bool _value) {
    _linksonpage = _value;
  }

  bool _docsonpage = false;
  bool get docsonpage => _docsonpage;
  set docsonpage(bool _value) {
    _docsonpage = _value;
  }

  bool _subtilesonpage = false;
  bool get subtilesonpage => _subtilesonpage;
  set subtilesonpage(bool _value) {
    _subtilesonpage = _value;
  }

  bool _historyActive = false;
  bool get historyActive => _historyActive;
  set historyActive(bool _value) {
    _historyActive = _value;
  }

  String _baseurl = 'https://';
  String get baseurl => _baseurl;
  set baseurl(String _value) {
    _baseurl = _value;
    prefs.setString('ff_baseurl', _value);
  }

  bool _buttonsonpage = false;
  bool get buttonsonpage => _buttonsonpage;
  set buttonsonpage(bool _value) {
    _buttonsonpage = _value;
  }

  bool _tilesontilesonpage = false;
  bool get tilesontilesonpage => _tilesontilesonpage;
  set tilesontilesonpage(bool _value) {
    _tilesontilesonpage = _value;
  }

  bool _showDotMenu = false;
  bool get showDotMenu => _showDotMenu;
  set showDotMenu(bool _value) {
    _showDotMenu = _value;
  }

  bool _drawerMenu = false;
  bool get drawerMenu => _drawerMenu;
  set drawerMenu(bool _value) {
    _drawerMenu = _value;
  }

  bool _showresponse = false;
  bool get showresponse => _showresponse;
  set showresponse(bool _value) {
    _showresponse = _value;
  }

  DocumentReference? _selectedtilechangecolor;
  DocumentReference? get selectedtilechangecolor => _selectedtilechangecolor;
  set selectedtilechangecolor(DocumentReference? _value) {
    _selectedtilechangecolor = _value;
    _value != null
        ? prefs.setString('ff_selectedtilechangecolor', _value.path)
        : prefs.remove('ff_selectedtilechangecolor');
  }

  bool _listFull = false;
  bool get listFull => _listFull;
  set listFull(bool _value) {
    _listFull = _value;
  }

  DocumentReference? _lasttiletouched;
  DocumentReference? get lasttiletouched => _lasttiletouched;
  set lasttiletouched(DocumentReference? _value) {
    _lasttiletouched = _value;
  }

  DocumentReference? _selectedHistoryRef;
  DocumentReference? get selectedHistoryRef => _selectedHistoryRef;
  set selectedHistoryRef(DocumentReference? _value) {
    _selectedHistoryRef = _value;
  }

  bool _childrenfound = false;
  bool get childrenfound => _childrenfound;
  set childrenfound(bool _value) {
    _childrenfound = _value;
  }

  bool _showmenuopen = false;
  bool get showmenuopen => _showmenuopen;
  set showmenuopen(bool _value) {
    _showmenuopen = _value;
  }

  List<String> _selectedForLive = [];
  List<String> get selectedForLive => _selectedForLive;
  set selectedForLive(List<String> _value) {
    _selectedForLive = _value;
    prefs.setStringList('ff_selectedForLive', _value);
  }

  void addToSelectedForLive(String _value) {
    _selectedForLive.add(_value);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  void removeFromSelectedForLive(String _value) {
    _selectedForLive.remove(_value);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  void removeAtIndexFromSelectedForLive(int _index) {
    _selectedForLive.removeAt(_index);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  void updateSelectedForLiveAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _selectedForLive[_index] = updateFn(_selectedForLive[_index]);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  void insertAtIndexInSelectedForLive(int _index, String _value) {
    _selectedForLive.insert(_index, _value);
    prefs.setStringList('ff_selectedForLive', _selectedForLive);
  }

  bool _menuopen = false;
  bool get menuopen => _menuopen;
  set menuopen(bool _value) {
    _menuopen = _value;
  }

  String _liveurl = '';
  String get liveurl => _liveurl;
  set liveurl(String _value) {
    _liveurl = _value;
  }

  bool _notifications = false;
  bool get notifications => _notifications;
  set notifications(bool _value) {
    _notifications = _value;
    prefs.setBool('ff_notifications', _value);
  }

  DocumentReference? _selectedSubTilesRef;
  DocumentReference? get selectedSubTilesRef => _selectedSubTilesRef;
  set selectedSubTilesRef(DocumentReference? _value) {
    _selectedSubTilesRef = _value;
    _value != null
        ? prefs.setString('ff_selectedSubTilesRef', _value.path)
        : prefs.remove('ff_selectedSubTilesRef');
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool _value) {
    _isPlaying = _value;
  }

  bool _isComplete = false;
  bool get isComplete => _isComplete;
  set isComplete(bool _value) {
    _isComplete = _value;
  }

  bool _isSubTile = false;
  bool get isSubTile => _isSubTile;
  set isSubTile(bool _value) {
    _isSubTile = _value;
  }

  String _aiResponse = '';
  String get aiResponse => _aiResponse;
  set aiResponse(String _value) {
    _aiResponse = _value;
  }

  List<DocumentReference> _tilesSelected = [];
  List<DocumentReference> get tilesSelected => _tilesSelected;
  set tilesSelected(List<DocumentReference> _value) {
    _tilesSelected = _value;
  }

  void addToTilesSelected(DocumentReference _value) {
    _tilesSelected.add(_value);
  }

  void removeFromTilesSelected(DocumentReference _value) {
    _tilesSelected.remove(_value);
  }

  void removeAtIndexFromTilesSelected(int _index) {
    _tilesSelected.removeAt(_index);
  }

  void updateTilesSelectedAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _tilesSelected[_index] = updateFn(_tilesSelected[_index]);
  }

  void insertAtIndexInTilesSelected(int _index, DocumentReference _value) {
    _tilesSelected.insert(_index, _value);
  }

  bool _videoIsPlaying = false;
  bool get videoIsPlaying => _videoIsPlaying;
  set videoIsPlaying(bool _value) {
    _videoIsPlaying = _value;
  }

  String _recordedmp3 = '';
  String get recordedmp3 => _recordedmp3;
  set recordedmp3(String _value) {
    _recordedmp3 = _value;
  }

  DocumentReference? _selectedParentRef;
  DocumentReference? get selectedParentRef => _selectedParentRef;
  set selectedParentRef(DocumentReference? _value) {
    _selectedParentRef = _value;
  }

  DocumentReference? _mainTileRefSelected;
  DocumentReference? get mainTileRefSelected => _mainTileRefSelected;
  set mainTileRefSelected(DocumentReference? _value) {
    _mainTileRefSelected = _value;
  }

  DocumentReference? _grandParentTileRefSelected;
  DocumentReference? get grandParentTileRefSelected =>
      _grandParentTileRefSelected;
  set grandParentTileRefSelected(DocumentReference? _value) {
    _grandParentTileRefSelected = _value;
  }

  DocumentReference? _selectedsocialfeedref;
  DocumentReference? get selectedsocialfeedref => _selectedsocialfeedref;
  set selectedsocialfeedref(DocumentReference? _value) {
    _selectedsocialfeedref = _value;
  }

  DocumentReference? _selectedTileBlockRef;
  DocumentReference? get selectedTileBlockRef => _selectedTileBlockRef;
  set selectedTileBlockRef(DocumentReference? _value) {
    _selectedTileBlockRef = _value;
  }

  bool _ISAI = false;
  bool get ISAI => _ISAI;
  set ISAI(bool _value) {
    _ISAI = _value;
  }

  int _currentAIiD = 0;
  int get currentAIiD => _currentAIiD;
  set currentAIiD(int _value) {
    _currentAIiD = _value;
    prefs.setInt('ff_currentAIiD', _value);
  }

  String _response = '';
  String get response => _response;
  set response(String _value) {
    _response = _value;
  }

  DocumentReference? _socialfeedRef;
  DocumentReference? get socialfeedRef => _socialfeedRef;
  set socialfeedRef(DocumentReference? _value) {
    _socialfeedRef = _value;
  }

  bool _isfeaturedpost = false;
  bool get isfeaturedpost => _isfeaturedpost;
  set isfeaturedpost(bool _value) {
    _isfeaturedpost = _value;
  }

  List<DocumentReference> _pushtopeople = [];
  List<DocumentReference> get pushtopeople => _pushtopeople;
  set pushtopeople(List<DocumentReference> _value) {
    _pushtopeople = _value;
  }

  void addToPushtopeople(DocumentReference _value) {
    _pushtopeople.add(_value);
  }

  void removeFromPushtopeople(DocumentReference _value) {
    _pushtopeople.remove(_value);
  }

  void removeAtIndexFromPushtopeople(int _index) {
    _pushtopeople.removeAt(_index);
  }

  void updatePushtopeopleAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _pushtopeople[_index] = updateFn(_pushtopeople[_index]);
  }

  void insertAtIndexInPushtopeople(int _index, DocumentReference _value) {
    _pushtopeople.insert(_index, _value);
  }

  List<DocumentReference> _selectedToShowMembers = [];
  List<DocumentReference> get selectedToShowMembers => _selectedToShowMembers;
  set selectedToShowMembers(List<DocumentReference> _value) {
    _selectedToShowMembers = _value;
  }

  void addToSelectedToShowMembers(DocumentReference _value) {
    _selectedToShowMembers.add(_value);
  }

  void removeFromSelectedToShowMembers(DocumentReference _value) {
    _selectedToShowMembers.remove(_value);
  }

  void removeAtIndexFromSelectedToShowMembers(int _index) {
    _selectedToShowMembers.removeAt(_index);
  }

  void updateSelectedToShowMembersAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _selectedToShowMembers[_index] = updateFn(_selectedToShowMembers[_index]);
  }

  void insertAtIndexInSelectedToShowMembers(
      int _index, DocumentReference _value) {
    _selectedToShowMembers.insert(_index, _value);
  }

  List<DocumentReference> _categoriesSelected = [];
  List<DocumentReference> get categoriesSelected => _categoriesSelected;
  set categoriesSelected(List<DocumentReference> _value) {
    _categoriesSelected = _value;
  }

  void addToCategoriesSelected(DocumentReference _value) {
    _categoriesSelected.add(_value);
  }

  void removeFromCategoriesSelected(DocumentReference _value) {
    _categoriesSelected.remove(_value);
  }

  void removeAtIndexFromCategoriesSelected(int _index) {
    _categoriesSelected.removeAt(_index);
  }

  void updateCategoriesSelectedAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _categoriesSelected[_index] = updateFn(_categoriesSelected[_index]);
  }

  void insertAtIndexInCategoriesSelected(int _index, DocumentReference _value) {
    _categoriesSelected.insert(_index, _value);
  }

  String _selectedType = '';
  String get selectedType => _selectedType;
  set selectedType(String _value) {
    _selectedType = _value;
  }

  bool _isIspMember = false;
  bool get isIspMember => _isIspMember;
  set isIspMember(bool _value) {
    _isIspMember = _value;
    prefs.setBool('ff_isIspMember', _value);
  }

  String _username = '';
  String get username => _username;
  set username(String _value) {
    _username = _value;
    prefs.setString('ff_username', _value);
  }

  String _password = '';
  String get password => _password;
  set password(String _value) {
    _password = _value;
    prefs.setString('ff_password', _value);
  }

  String _memberid = '';
  String get memberid => _memberid;
  set memberid(String _value) {
    _memberid = _value;
    prefs.setString('ff_memberid', _value);
  }

  String _cpdscore = '';
  String get cpdscore => _cpdscore;
  set cpdscore(String _value) {
    _cpdscore = _value;
    prefs.setString('ff_cpdscore', _value);
  }

  String _profilepic = '';
  String get profilepic => _profilepic;
  set profilepic(String _value) {
    _profilepic = _value;
    prefs.setString('ff_profilepic', _value);
  }

  bool _isasubtile = false;
  bool get isasubtile => _isasubtile;
  set isasubtile(bool _value) {
    _isasubtile = _value;
  }

  List<String> _audienceforlives = [];
  List<String> get audienceforlives => _audienceforlives;
  set audienceforlives(List<String> _value) {
    _audienceforlives = _value;
  }

  void addToAudienceforlives(String _value) {
    _audienceforlives.add(_value);
  }

  void removeFromAudienceforlives(String _value) {
    _audienceforlives.remove(_value);
  }

  void removeAtIndexFromAudienceforlives(int _index) {
    _audienceforlives.removeAt(_index);
  }

  void updateAudienceforlivesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _audienceforlives[_index] = updateFn(_audienceforlives[_index]);
  }

  void insertAtIndexInAudienceforlives(int _index, String _value) {
    _audienceforlives.insert(_index, _value);
  }

  DocumentReference? _notificationsRef;
  DocumentReference? get notificationsRef => _notificationsRef;
  set notificationsRef(DocumentReference? _value) {
    _notificationsRef = _value;
  }

  bool _catnotifications = false;
  bool get catnotifications => _catnotifications;
  set catnotifications(bool _value) {
    _catnotifications = _value;
    prefs.setBool('ff_catnotifications', _value);
  }

  TileNavStruct _tileNav = TileNavStruct.fromSerializableMap(jsonDecode(
      '{\"tier0_id\":\"0\",\"tier1_id\":\"0\",\"tier2_id\":\"0\",\"tier3_id\":\"0\",\"tier4_id\":\"0\"}'));
  TileNavStruct get tileNav => _tileNav;
  set tileNav(TileNavStruct _value) {
    _tileNav = _value;
    prefs.setString('ff_tileNav', _value.serialize());
  }

  void updateTileNavStruct(Function(TileNavStruct) updateFn) {
    updateFn(_tileNav);
    prefs.setString('ff_tileNav', _tileNav.serialize());
  }

  String _viewTileCondtentId = 'id';
  String get viewTileCondtentId => _viewTileCondtentId;
  set viewTileCondtentId(String _value) {
    _viewTileCondtentId = _value;
  }

  String _callbackAction = 'GetStarted';
  String get callbackAction => _callbackAction;
  set callbackAction(String _value) {
    _callbackAction = _value;
  }

  List<String> _navPath = ['', ''];
  List<String> get navPath => _navPath;
  set navPath(List<String> _value) {
    _navPath = _value;
    prefs.setStringList('ff_navPath', _value);
  }

  void addToNavPath(String _value) {
    _navPath.add(_value);
    prefs.setStringList('ff_navPath', _navPath);
  }

  void removeFromNavPath(String _value) {
    _navPath.remove(_value);
    prefs.setStringList('ff_navPath', _navPath);
  }

  void removeAtIndexFromNavPath(int _index) {
    _navPath.removeAt(_index);
    prefs.setStringList('ff_navPath', _navPath);
  }

  void updateNavPathAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _navPath[_index] = updateFn(_navPath[_index]);
    prefs.setStringList('ff_navPath', _navPath);
  }

  void insertAtIndexInNavPath(int _index, String _value) {
    _navPath.insert(_index, _value);
    prefs.setStringList('ff_navPath', _navPath);
  }

  String _drawerState = 'Tile';
  String get drawerState => _drawerState;
  set drawerState(String _value) {
    _drawerState = _value;
    prefs.setString('ff_drawerState', _value);
  }

  String _drawerView = 'Tile';
  String get drawerView => _drawerView;
  set drawerView(String _value) {
    _drawerView = _value;
    prefs.setString('ff_drawerView', _value);
  }

  String _drawerMode = 'New';
  String get drawerMode => _drawerMode;
  set drawerMode(String _value) {
    _drawerMode = _value;
    prefs.setString('ff_drawerMode', _value);
  }

  String _drawerCurrentId = '';
  String get drawerCurrentId => _drawerCurrentId;
  set drawerCurrentId(String _value) {
    _drawerCurrentId = _value;
    prefs.setString('ff_drawerCurrentId', _value);
  }

  bool _tempBoolean = false;
  bool get tempBoolean => _tempBoolean;
  set tempBoolean(bool _value) {
    _tempBoolean = _value;
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
  set blockTypes(List<BlockTypeStruct> _value) {
    _blockTypes = _value;
    prefs.setStringList(
        'ff_blockTypes', _value.map((x) => x.serialize()).toList());
  }

  void addToBlockTypes(BlockTypeStruct _value) {
    _blockTypes.add(_value);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  void removeFromBlockTypes(BlockTypeStruct _value) {
    _blockTypes.remove(_value);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBlockTypes(int _index) {
    _blockTypes.removeAt(_index);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  void updateBlockTypesAtIndex(
    int _index,
    BlockTypeStruct Function(BlockTypeStruct) updateFn,
  ) {
    _blockTypes[_index] = updateFn(_blockTypes[_index]);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBlockTypes(int _index, BlockTypeStruct _value) {
    _blockTypes.insert(_index, _value);
    prefs.setStringList(
        'ff_blockTypes', _blockTypes.map((x) => x.serialize()).toList());
  }

  int _drawerStartTab = 0;
  int get drawerStartTab => _drawerStartTab;
  set drawerStartTab(int _value) {
    _drawerStartTab = _value;
  }

  String _drawerBlockId = '';
  String get drawerBlockId => _drawerBlockId;
  set drawerBlockId(String _value) {
    _drawerBlockId = _value;
  }

  String _selectedBlockID = '';
  String get selectedBlockID => _selectedBlockID;
  set selectedBlockID(String _value) {
    _selectedBlockID = _value;
  }

  bool _isEdit = false;
  bool get isEdit => _isEdit;
  set isEdit(bool _value) {
    _isEdit = _value;
  }

  bool _readyToCreateTile = false;
  bool get readyToCreateTile => _readyToCreateTile;
  set readyToCreateTile(bool _value) {
    _readyToCreateTile = _value;
  }

  bool _createTilePressed = false;
  bool get createTilePressed => _createTilePressed;
  set createTilePressed(bool _value) {
    _createTilePressed = _value;
  }

  bool _showEdit = false;
  bool get showEdit => _showEdit;
  set showEdit(bool _value) {
    _showEdit = _value;
  }

  String _contentTypeChosen = '';
  String get contentTypeChosen => _contentTypeChosen;
  set contentTypeChosen(String _value) {
    _contentTypeChosen = _value;
  }

  bool _editMode = false;
  bool get editMode => _editMode;
  set editMode(bool _value) {
    _editMode = _value;
  }

  String _selectedEditItem = '';
  String get selectedEditItem => _selectedEditItem;
  set selectedEditItem(String _value) {
    _selectedEditItem = _value;
  }

  bool _blockCreateMode = false;
  bool get blockCreateMode => _blockCreateMode;
  set blockCreateMode(bool _value) {
    _blockCreateMode = _value;
  }

  FontSettingsStruct _fontSettingsLocal = FontSettingsStruct();
  FontSettingsStruct get fontSettingsLocal => _fontSettingsLocal;
  set fontSettingsLocal(FontSettingsStruct _value) {
    _fontSettingsLocal = _value;
  }

  void updateFontSettingsLocalStruct(Function(FontSettingsStruct) updateFn) {
    updateFn(_fontSettingsLocal);
  }

  bool _fontChangeInProgress = false;
  bool get fontChangeInProgress => _fontChangeInProgress;
  set fontChangeInProgress(bool _value) {
    _fontChangeInProgress = _value;
  }

  bool _showChangedType = false;
  bool get showChangedType => _showChangedType;
  set showChangedType(bool _value) {
    _showChangedType = _value;
  }

  bool _NewTileJustCreated = false;
  bool get NewTileJustCreated => _NewTileJustCreated;
  set NewTileJustCreated(bool _value) {
    _NewTileJustCreated = _value;
  }

  DocumentReference? _selectedTileRefV2;
  DocumentReference? get selectedTileRefV2 => _selectedTileRefV2;
  set selectedTileRefV2(DocumentReference? _value) {
    _selectedTileRefV2 = _value;
    _value != null
        ? prefs.setString('ff_selectedTileRefV2', _value.path)
        : prefs.remove('ff_selectedTileRefV2');
  }

  bool _showEditOverlays = false;
  bool get showEditOverlays => _showEditOverlays;
  set showEditOverlays(bool _value) {
    _showEditOverlays = _value;
  }

  List<String> _listOfQuestions = [
    'Question One',
    'Question Two',
    'Question Three\n'
  ];
  List<String> get listOfQuestions => _listOfQuestions;
  set listOfQuestions(List<String> _value) {
    _listOfQuestions = _value;
  }

  void addToListOfQuestions(String _value) {
    _listOfQuestions.add(_value);
  }

  void removeFromListOfQuestions(String _value) {
    _listOfQuestions.remove(_value);
  }

  void removeAtIndexFromListOfQuestions(int _index) {
    _listOfQuestions.removeAt(_index);
  }

  void updateListOfQuestionsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listOfQuestions[_index] = updateFn(_listOfQuestions[_index]);
  }

  void insertAtIndexInListOfQuestions(int _index, String _value) {
    _listOfQuestions.insert(_index, _value);
  }

  bool _showTileTierZero = false;
  bool get showTileTierZero => _showTileTierZero;
  set showTileTierZero(bool _value) {
    _showTileTierZero = _value;
    prefs.setBool('ff_showTileTierZero', _value);
  }

  int _currentIndexId = 0;
  int get currentIndexId => _currentIndexId;
  set currentIndexId(int _value) {
    _currentIndexId = _value;
  }

  String _videoControlType = '';
  String get videoControlType => _videoControlType;
  set videoControlType(String _value) {
    _videoControlType = _value;
  }

  AnalyticsDataStruct _analyticsLocal = AnalyticsDataStruct();
  AnalyticsDataStruct get analyticsLocal => _analyticsLocal;
  set analyticsLocal(AnalyticsDataStruct _value) {
    _analyticsLocal = _value;
  }

  void updateAnalyticsLocalStruct(Function(AnalyticsDataStruct) updateFn) {
    updateFn(_analyticsLocal);
  }

  bool _showQuizBuilder = false;
  bool get showQuizBuilder => _showQuizBuilder;
  set showQuizBuilder(bool _value) {
    _showQuizBuilder = _value;
  }

  String _convertedVideoUrl = 'ok';
  String get convertedVideoUrl => _convertedVideoUrl;
  set convertedVideoUrl(String _value) {
    _convertedVideoUrl = _value;
  }

  String _convertedVideoUrlnot = '';
  String get convertedVideoUrlnot => _convertedVideoUrlnot;
  set convertedVideoUrlnot(String _value) {
    _convertedVideoUrlnot = _value;
  }

  double _countDownTime = 30.0;
  double get countDownTime => _countDownTime;
  set countDownTime(double _value) {
    _countDownTime = _value;
  }

  bool _QuizReadyToMoveOn = false;
  bool get QuizReadyToMoveOn => _QuizReadyToMoveOn;
  set QuizReadyToMoveOn(bool _value) {
    _QuizReadyToMoveOn = _value;
  }

  bool _stopQuiz = false;
  bool get stopQuiz => _stopQuiz;
  set stopQuiz(bool _value) {
    _stopQuiz = _value;
  }

  double _currentTimer = 0.0;
  double get currentTimer => _currentTimer;
  set currentTimer(double _value) {
    _currentTimer = _value;
    prefs.setDouble('ff_currentTimer', _value);
  }

  String _correctAnswerAS = '';
  String get correctAnswerAS => _correctAnswerAS;
  set correctAnswerAS(String _value) {
    _correctAnswerAS = _value;
  }

  String _answerGiven = '';
  String get answerGiven => _answerGiven;
  set answerGiven(String _value) {
    _answerGiven = _value;
  }

  int _localQuizId = 0;
  int get localQuizId => _localQuizId;
  set localQuizId(int _value) {
    _localQuizId = _value;
    prefs.setInt('ff_localQuizId', _value);
  }

  List<UserChatsStruct> _userChats = [
    UserChatsStruct.fromSerializableMap(jsonDecode(
        '{\"message\":\"Hello World\",\"role\":\"Hello World\",\"timestamp\":\"1700391138346\"}'))
  ];
  List<UserChatsStruct> get userChats => _userChats;
  set userChats(List<UserChatsStruct> _value) {
    _userChats = _value;
    prefs.setStringList(
        'ff_userChats', _value.map((x) => x.serialize()).toList());
  }

  void addToUserChats(UserChatsStruct _value) {
    _userChats.add(_value);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  void removeFromUserChats(UserChatsStruct _value) {
    _userChats.remove(_value);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUserChats(int _index) {
    _userChats.removeAt(_index);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  void updateUserChatsAtIndex(
    int _index,
    UserChatsStruct Function(UserChatsStruct) updateFn,
  ) {
    _userChats[_index] = updateFn(_userChats[_index]);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUserChats(int _index, UserChatsStruct _value) {
    _userChats.insert(_index, _value);
    prefs.setStringList(
        'ff_userChats', _userChats.map((x) => x.serialize()).toList());
  }

  bool _processingFlowise = false;
  bool get processingFlowise => _processingFlowise;
  set processingFlowise(bool _value) {
    _processingFlowise = _value;
  }

  String _sessionid = '';
  String get sessionid => _sessionid;
  set sessionid(String _value) {
    _sessionid = _value;
  }

  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String _value) {
    _sessionId = _value;
    prefs.setString('ff_sessionId', _value);
  }

  String _learningData = '';
  String get learningData => _learningData;
  set learningData(String _value) {
    _learningData = _value;
  }

  bool _endDrawerOpen = false;
  bool get endDrawerOpen => _endDrawerOpen;
  set endDrawerOpen(bool _value) {
    _endDrawerOpen = _value;
    prefs.setBool('ff_endDrawerOpen', _value);
  }

  String _nonLoggedInSessionId = '';
  String get nonLoggedInSessionId => _nonLoggedInSessionId;
  set nonLoggedInSessionId(String _value) {
    _nonLoggedInSessionId = _value;
    prefs.setString('ff_nonLoggedInSessionId', _value);
  }

  String _flowiseStreamingText = '';
  String get flowiseStreamingText => _flowiseStreamingText;
  set flowiseStreamingText(String _value) {
    _flowiseStreamingText = _value;
  }

  List<String> _openAiData = [];
  List<String> get openAiData => _openAiData;
  set openAiData(List<String> _value) {
    _openAiData = _value;
    prefs.setStringList('ff_openAiData', _value);
  }

  void addToOpenAiData(String _value) {
    _openAiData.add(_value);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  void removeFromOpenAiData(String _value) {
    _openAiData.remove(_value);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  void removeAtIndexFromOpenAiData(int _index) {
    _openAiData.removeAt(_index);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  void updateOpenAiDataAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _openAiData[_index] = updateFn(_openAiData[_index]);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  void insertAtIndexInOpenAiData(int _index, String _value) {
    _openAiData.insert(_index, _value);
    prefs.setStringList('ff_openAiData', _openAiData);
  }

  bool _readyToImage = false;
  bool get readyToImage => _readyToImage;
  set readyToImage(bool _value) {
    _readyToImage = _value;
    prefs.setBool('ff_readyToImage', _value);
  }

  String _backgroundImage = '';
  String get backgroundImage => _backgroundImage;
  set backgroundImage(String _value) {
    _backgroundImage = _value;
    prefs.setString('ff_backgroundImage', _value);
  }

  String _backgroundImageUrl = '';
  String get backgroundImageUrl => _backgroundImageUrl;
  set backgroundImageUrl(String _value) {
    _backgroundImageUrl = _value;
    prefs.setString('ff_backgroundImageUrl', _value);
  }

  bool _dalle3Used = false;
  bool get dalle3Used => _dalle3Used;
  set dalle3Used(bool _value) {
    _dalle3Used = _value;
    prefs.setBool('ff_dalle3Used', _value);
  }

  bool _apiActive = false;
  bool get apiActive => _apiActive;
  set apiActive(bool _value) {
    _apiActive = _value;
  }

  List<FlowiseMessagesStruct> _flowiseMessages = [];
  List<FlowiseMessagesStruct> get flowiseMessages => _flowiseMessages;
  set flowiseMessages(List<FlowiseMessagesStruct> _value) {
    _flowiseMessages = _value;
    prefs.setStringList(
        'ff_flowiseMessages', _value.map((x) => x.serialize()).toList());
  }

  void addToFlowiseMessages(FlowiseMessagesStruct _value) {
    _flowiseMessages.add(_value);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  void removeFromFlowiseMessages(FlowiseMessagesStruct _value) {
    _flowiseMessages.remove(_value);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFlowiseMessages(int _index) {
    _flowiseMessages.removeAt(_index);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  void updateFlowiseMessagesAtIndex(
    int _index,
    FlowiseMessagesStruct Function(FlowiseMessagesStruct) updateFn,
  ) {
    _flowiseMessages[_index] = updateFn(_flowiseMessages[_index]);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFlowiseMessages(
      int _index, FlowiseMessagesStruct _value) {
    _flowiseMessages.insert(_index, _value);
    prefs.setStringList('ff_flowiseMessages',
        _flowiseMessages.map((x) => x.serialize()).toList());
  }

  String _activeThread = '';
  String get activeThread => _activeThread;
  set activeThread(String _value) {
    _activeThread = _value;
    prefs.setString('ff_activeThread', _value);
  }

  String _tempStreamingMessage = '';
  String get tempStreamingMessage => _tempStreamingMessage;
  set tempStreamingMessage(String _value) {
    _tempStreamingMessage = _value;
  }

  String _learningTypeSelected = '';
  String get learningTypeSelected => _learningTypeSelected;
  set learningTypeSelected(String _value) {
    _learningTypeSelected = _value;
  }

  String _companyAiData = '';
  String get companyAiData => _companyAiData;
  set companyAiData(String _value) {
    _companyAiData = _value;
  }

  String _selectedTopic = '';
  String get selectedTopic => _selectedTopic;
  set selectedTopic(String _value) {
    _selectedTopic = _value;
  }

  String _selectedReadingItem = '';
  String get selectedReadingItem => _selectedReadingItem;
  set selectedReadingItem(String _value) {
    _selectedReadingItem = _value;
  }

  int _loopCounter = 0;
  int get loopCounter => _loopCounter;
  set loopCounter(int _value) {
    _loopCounter = _value;
  }

  String _selectedLearnCardId = '';
  String get selectedLearnCardId => _selectedLearnCardId;
  set selectedLearnCardId(String _value) {
    _selectedLearnCardId = _value;
    prefs.setString('ff_selectedLearnCardId', _value);
  }

  bool _learnTopicProvided = false;
  bool get learnTopicProvided => _learnTopicProvided;
  set learnTopicProvided(bool _value) {
    _learnTopicProvided = _value;
    prefs.setBool('ff_learnTopicProvided', _value);
  }

  bool _showReadingList = false;
  bool get showReadingList => _showReadingList;
  set showReadingList(bool _value) {
    _showReadingList = _value;
    prefs.setBool('ff_showReadingList', _value);
  }

  bool _showChat = false;
  bool get showChat => _showChat;
  set showChat(bool _value) {
    _showChat = _value;
    prefs.setBool('ff_showChat', _value);
  }

  bool _showMiddleContent = false;
  bool get showMiddleContent => _showMiddleContent;
  set showMiddleContent(bool _value) {
    _showMiddleContent = _value;
    prefs.setBool('ff_showMiddleContent', _value);
  }

  bool _showLearnJourneys = false;
  bool get showLearnJourneys => _showLearnJourneys;
  set showLearnJourneys(bool _value) {
    _showLearnJourneys = _value;
  }

  String _welcomeIntro = '';
  String get welcomeIntro => _welcomeIntro;
  set welcomeIntro(String _value) {
    _welcomeIntro = _value;
    prefs.setString('ff_welcomeIntro', _value);
  }

  String _companySecretCode = '';
  String get companySecretCode => _companySecretCode;
  set companySecretCode(String _value) {
    _companySecretCode = _value;
    prefs.setString('ff_companySecretCode', _value);
  }

  bool _welcomeChatReady = false;
  bool get welcomeChatReady => _welcomeChatReady;
  set welcomeChatReady(bool _value) {
    _welcomeChatReady = _value;
    prefs.setBool('ff_welcomeChatReady', _value);
  }

  bool _questionReady = false;
  bool get questionReady => _questionReady;
  set questionReady(bool _value) {
    _questionReady = _value;
    prefs.setBool('ff_questionReady', _value);
  }

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
    prefs.setString('ff_apiKey', _value);
  }

  List<ChatResponseStruct> _chatHistory = [];
  List<ChatResponseStruct> get chatHistory => _chatHistory;
  set chatHistory(List<ChatResponseStruct> _value) {
    _chatHistory = _value;
  }

  void addToChatHistory(ChatResponseStruct _value) {
    _chatHistory.add(_value);
  }

  void removeFromChatHistory(ChatResponseStruct _value) {
    _chatHistory.remove(_value);
  }

  void removeAtIndexFromChatHistory(int _index) {
    _chatHistory.removeAt(_index);
  }

  void updateChatHistoryAtIndex(
    int _index,
    ChatResponseStruct Function(ChatResponseStruct) updateFn,
  ) {
    _chatHistory[_index] = updateFn(_chatHistory[_index]);
  }

  void insertAtIndexInChatHistory(int _index, ChatResponseStruct _value) {
    _chatHistory.insert(_index, _value);
  }

  List<HintPromptListStruct> _hintPromptList = [
    HintPromptListStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Suggest a recipie\",\"description\":\"That contains tomatoes and onions\"}'))
  ];
  List<HintPromptListStruct> get hintPromptList => _hintPromptList;
  set hintPromptList(List<HintPromptListStruct> _value) {
    _hintPromptList = _value;
  }

  void addToHintPromptList(HintPromptListStruct _value) {
    _hintPromptList.add(_value);
  }

  void removeFromHintPromptList(HintPromptListStruct _value) {
    _hintPromptList.remove(_value);
  }

  void removeAtIndexFromHintPromptList(int _index) {
    _hintPromptList.removeAt(_index);
  }

  void updateHintPromptListAtIndex(
    int _index,
    HintPromptListStruct Function(HintPromptListStruct) updateFn,
  ) {
    _hintPromptList[_index] = updateFn(_hintPromptList[_index]);
  }

  void insertAtIndexInHintPromptList(int _index, HintPromptListStruct _value) {
    _hintPromptList.insert(_index, _value);
  }

  List<String> _chatMessageStringsTest = [];
  List<String> get chatMessageStringsTest => _chatMessageStringsTest;
  set chatMessageStringsTest(List<String> _value) {
    _chatMessageStringsTest = _value;
  }

  void addToChatMessageStringsTest(String _value) {
    _chatMessageStringsTest.add(_value);
  }

  void removeFromChatMessageStringsTest(String _value) {
    _chatMessageStringsTest.remove(_value);
  }

  void removeAtIndexFromChatMessageStringsTest(int _index) {
    _chatMessageStringsTest.removeAt(_index);
  }

  void updateChatMessageStringsTestAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _chatMessageStringsTest[_index] = updateFn(_chatMessageStringsTest[_index]);
  }

  void insertAtIndexInChatMessageStringsTest(int _index, String _value) {
    _chatMessageStringsTest.insert(_index, _value);
  }

  String _aTestString = '';
  String get aTestString => _aTestString;
  set aTestString(String _value) {
    _aTestString = _value;
    prefs.setString('ff_aTestString', _value);
  }

  String _aggregatedResponse = '';
  String get aggregatedResponse => _aggregatedResponse;
  set aggregatedResponse(String _value) {
    _aggregatedResponse = _value;
  }

  List<ChatResponseStruct> _firebaseStoreChatResponse = [];
  List<ChatResponseStruct> get firebaseStoreChatResponse =>
      _firebaseStoreChatResponse;
  set firebaseStoreChatResponse(List<ChatResponseStruct> _value) {
    _firebaseStoreChatResponse = _value;
  }

  void addToFirebaseStoreChatResponse(ChatResponseStruct _value) {
    _firebaseStoreChatResponse.add(_value);
  }

  void removeFromFirebaseStoreChatResponse(ChatResponseStruct _value) {
    _firebaseStoreChatResponse.remove(_value);
  }

  void removeAtIndexFromFirebaseStoreChatResponse(int _index) {
    _firebaseStoreChatResponse.removeAt(_index);
  }

  void updateFirebaseStoreChatResponseAtIndex(
    int _index,
    ChatResponseStruct Function(ChatResponseStruct) updateFn,
  ) {
    _firebaseStoreChatResponse[_index] =
        updateFn(_firebaseStoreChatResponse[_index]);
  }

  void insertAtIndexInFirebaseStoreChatResponse(
      int _index, ChatResponseStruct _value) {
    _firebaseStoreChatResponse.insert(_index, _value);
  }

  String _tempOpenAIText = '';
  String get tempOpenAIText => _tempOpenAIText;
  set tempOpenAIText(String _value) {
    _tempOpenAIText = _value;
  }

  int _debugCount = 0;
  int get debugCount => _debugCount;
  set debugCount(int _value) {
    _debugCount = _value;
    prefs.setInt('ff_debugCount', _value);
  }

  String _selectedThreadId = '';
  String get selectedThreadId => _selectedThreadId;
  set selectedThreadId(String _value) {
    _selectedThreadId = _value;
    prefs.setString('ff_selectedThreadId', _value);
  }

  String _showPane = 'menu';
  String get showPane => _showPane;
  set showPane(String _value) {
    _showPane = _value;
    prefs.setString('ff_showPane', _value);
  }

  String _selectedChatName = '';
  String get selectedChatName => _selectedChatName;
  set selectedChatName(String _value) {
    _selectedChatName = _value;
    prefs.setString('ff_selectedChatName', _value);
  }

  String _leftPane = '';
  String get leftPane => _leftPane;
  set leftPane(String _value) {
    _leftPane = _value;
    prefs.setString('ff_leftPane', _value);
  }

  String _middlePane = '';
  String get middlePane => _middlePane;
  set middlePane(String _value) {
    _middlePane = _value;
    prefs.setString('ff_middlePane', _value);
  }

  String _rightPane = '';
  String get rightPane => _rightPane;
  set rightPane(String _value) {
    _rightPane = _value;
    prefs.setString('ff_rightPane', _value);
  }

  bool _leftColumnShow = false;
  bool get leftColumnShow => _leftColumnShow;
  set leftColumnShow(bool _value) {
    _leftColumnShow = _value;
    prefs.setBool('ff_leftColumnShow', _value);
  }

  bool _middleColumnShow = false;
  bool get middleColumnShow => _middleColumnShow;
  set middleColumnShow(bool _value) {
    _middleColumnShow = _value;
    prefs.setBool('ff_middleColumnShow', _value);
  }

  bool _rightColumnShow = false;
  bool get rightColumnShow => _rightColumnShow;
  set rightColumnShow(bool _value) {
    _rightColumnShow = _value;
    prefs.setBool('ff_rightColumnShow', _value);
  }

  bool _showLeftDrawer = false;
  bool get showLeftDrawer => _showLeftDrawer;
  set showLeftDrawer(bool _value) {
    _showLeftDrawer = _value;
    prefs.setBool('ff_showLeftDrawer', _value);
  }

  bool _showRightDrawer = false;
  bool get showRightDrawer => _showRightDrawer;
  set showRightDrawer(bool _value) {
    _showRightDrawer = _value;
    prefs.setBool('ff_showRightDrawer', _value);
  }

  bool _hideColumn = false;
  bool get hideColumn => _hideColumn;
  set hideColumn(bool _value) {
    _hideColumn = _value;
    prefs.setBool('ff_hideColumn', _value);
  }

  String _viewTileContentIdAI = '';
  String get viewTileContentIdAI => _viewTileContentIdAI;
  set viewTileContentIdAI(String _value) {
    _viewTileContentIdAI = _value;
    prefs.setString('ff_viewTileContentIdAI', _value);
  }

  String _debugMessage = '';
  String get debugMessage => _debugMessage;
  set debugMessage(String _value) {
    _debugMessage = _value;
  }

  String _selectedCategoryName = '';
  String get selectedCategoryName => _selectedCategoryName;
  set selectedCategoryName(String _value) {
    _selectedCategoryName = _value;
    prefs.setString('ff_selectedCategoryName', _value);
  }

  bool _IsLearnCard = false;
  bool get IsLearnCard => _IsLearnCard;
  set IsLearnCard(bool _value) {
    _IsLearnCard = _value;
    prefs.setBool('ff_IsLearnCard', _value);
  }

  String _selectedCompanyUrl = '';
  String get selectedCompanyUrl => _selectedCompanyUrl;
  set selectedCompanyUrl(String _value) {
    _selectedCompanyUrl = _value;
    prefs.setString('ff_selectedCompanyUrl', _value);
  }

  String _companyBackgroundImage = '';
  String get companyBackgroundImage => _companyBackgroundImage;
  set companyBackgroundImage(String _value) {
    _companyBackgroundImage = _value;
    prefs.setString('ff_companyBackgroundImage', _value);
  }

  String _selectedCompanyUrl2 = '';
  String get selectedCompanyUrl2 => _selectedCompanyUrl2;
  set selectedCompanyUrl2(String _value) {
    _selectedCompanyUrl2 = _value;
    prefs.setString('ff_selectedCompanyUrl2', _value);
  }

  String _tempCoachMeThreadId = '';
  String get tempCoachMeThreadId => _tempCoachMeThreadId;
  set tempCoachMeThreadId(String _value) {
    _tempCoachMeThreadId = _value;
    prefs.setString('ff_tempCoachMeThreadId', _value);
  }

  bool _isAParent = false;
  bool get isAParent => _isAParent;
  set isAParent(bool _value) {
    _isAParent = _value;
    prefs.setBool('ff_isAParent', _value);
  }

  String _chatType = '';
  String get chatType => _chatType;
  set chatType(String _value) {
    _chatType = _value;
  }

  String _selectedMemberLevel = '';
  String get selectedMemberLevel => _selectedMemberLevel;
  set selectedMemberLevel(String _value) {
    _selectedMemberLevel = _value;
    prefs.setString('ff_selectedMemberLevel', _value);
  }

  String _selectedTeam = '';
  String get selectedTeam => _selectedTeam;
  set selectedTeam(String _value) {
    _selectedTeam = _value;
    prefs.setString('ff_selectedTeam', _value);
  }

  String _selectedSessionId = '';
  String get selectedSessionId => _selectedSessionId;
  set selectedSessionId(String _value) {
    _selectedSessionId = _value;
  }

  bool _showLearnCard = false;
  bool get showLearnCard => _showLearnCard;
  set showLearnCard(bool _value) {
    _showLearnCard = _value;
  }

  String _selectedCompanyId = '';
  String get selectedCompanyId => _selectedCompanyId;
  set selectedCompanyId(String _value) {
    _selectedCompanyId = _value;
    prefs.setString('ff_selectedCompanyId', _value);
  }

  String _selectedMemberLevelName = '';
  String get selectedMemberLevelName => _selectedMemberLevelName;
  set selectedMemberLevelName(String _value) {
    _selectedMemberLevelName = _value;
    prefs.setString('ff_selectedMemberLevelName', _value);
  }

  String _selectedParentId = '';
  String get selectedParentId => _selectedParentId;
  set selectedParentId(String _value) {
    _selectedParentId = _value;
    prefs.setString('ff_selectedParentId', _value);
  }

  String _selectedParentName = '';
  String get selectedParentName => _selectedParentName;
  set selectedParentName(String _value) {
    _selectedParentName = _value;
    prefs.setString('ff_selectedParentName', _value);
  }

  bool _bottomSheetOpen = false;
  bool get bottomSheetOpen => _bottomSheetOpen;
  set bottomSheetOpen(bool _value) {
    _bottomSheetOpen = _value;
  }

  bool _debugMode = false;
  bool get debugMode => _debugMode;
  set debugMode(bool _value) {
    _debugMode = _value;
  }

  String _companyDocId = '';
  String get companyDocId => _companyDocId;
  set companyDocId(String _value) {
    _companyDocId = _value;
    prefs.setString('ff_companyDocId', _value);
  }

  bool _showPassword = false;
  bool get showPassword => _showPassword;
  set showPassword(bool _value) {
    _showPassword = _value;
  }

  String _learnCardDescription = '';
  String get learnCardDescription => _learnCardDescription;
  set learnCardDescription(String _value) {
    _learnCardDescription = _value;
    prefs.setString('ff_learnCardDescription', _value);
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
