import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCal';

/// Start MUX VIDEO Group Code

class MuxVideoGroup {
  static String baseUrl = 'https://api.mux.com/video/';
  static Map<String, String> headers = {
    'Authorization':
        'Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==',
    'Content-Type': 'application/json',
  };
  static NewGetLiveStreamIDCall newGetLiveStreamIDCall =
      NewGetLiveStreamIDCall();
  static NewGetPastLiveStreamCall newGetPastLiveStreamCall =
      NewGetPastLiveStreamCall();
}

class NewGetLiveStreamIDCall {
  Future<ApiCallResponse> call({
    String? playbackIds = '',
    String? playbackPolicy = 'public',
    String? mp4Support = 'standard',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NewGetLiveStreamIDCall',
        'variables': {
          'playbackIds': playbackIds,
          'playbackPolicy': playbackPolicy,
          'mp4Support': mp4Support,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? streamid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.object.id''',
      ));
}

class NewGetPastLiveStreamCall {
  Future<ApiCallResponse> call({
    String? streamId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NewGetPastLiveStreamCall',
        'variables': {
          'streamId': streamId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic plaYbackID(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

/// End MUX VIDEO Group Code

/// Start WEBHOOKS Group Code

class WebhooksGroup {
  static String baseUrl = 'https://hook.eu1.make.com';
  static Map<String, String> headers = {};
  static MakeBugNotionCall makeBugNotionCall = MakeBugNotionCall();
  static NotionCall notionCall = NotionCall();
}

class MakeBugNotionCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? bugDescription = '',
    String? reportedBy = '',
    String? source = 'Martial Arts App',
  }) async {
    final ffApiRequestBody = '''
{
  "Title": "$title",
  "Bug Description": "$bugDescription",
  "Reported By": "$reportedBy",
  "Source": "$source"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'make bug Notion ',
      apiUrl: '${WebhooksGroup.baseUrl}/ww7esxiqedbmj62n3dp3ddkx1crn8vf9',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class NotionCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Notion ',
      apiUrl: '${WebhooksGroup.baseUrl}/ww7esxiqedbmj62n3dp3ddkx1crn8vf9',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End WEBHOOKS Group Code

/// Start airTable Group Code

class AirTableGroup {
  static String baseUrl = 'https://api.airtable.com/v0/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer patuLJcT0KaGXnR9f.58ea71267b98348f55ac6dea0013a234fa67249ac518f04fd6d68e39a29fb420',
  };
  static TestCall testCall = TestCall();
}

class TestCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'test',
      apiUrl: '${AirTableGroup.baseUrl}appn5SBQnZHRcYJ0R/Table%201',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer patuLJcT0KaGXnR9f.58ea71267b98348f55ac6dea0013a234fa67249ac518f04fd6d68e39a29fb420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? question(dynamic response) => getJsonField(
        response,
        r'''$.records[:].fields''',
        true,
      ) as List?;
}

/// End airTable Group Code

/// Start Your Membership Group Code

class YourMembershipGroup {
  static String baseUrl = 'https://ws.yourmembership.com/Ams';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static AuthenticateCall authenticateCall = AuthenticateCall();
  static YourMembershipGetDataCall yourMembershipGetDataCall =
      YourMembershipGetDataCall();
  static GroupDataCall groupDataCall = GroupDataCall();
  static EventsCall eventsCall = EventsCall();
}

class AuthenticateCall {
  Future<ApiCallResponse> call({
    String? clientID = '',
    String? userType = '',
    String? username = '',
    String? password = '',
    dynamic sessionIdJson,
  }) async {
    final sessionId = _serializeJson(sessionIdJson);
    final ffApiRequestBody = '''
{
  "ClientID": "$clientID",
  "UserType": "$userType",
  "Username": "$username",
  "Password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Authenticate',
      apiUrl: '${YourMembershipGroup.baseUrl}/Authenticate',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic memberid(dynamic response) => getJsonField(
        response,
        r'''$.MemberID''',
      );
  dynamic sessionid(dynamic response) => getJsonField(
        response,
        r'''$.SessionId''',
      );
}

class YourMembershipGetDataCall {
  Future<ApiCallResponse> call({
    String? memberid = '',
    String? sessionid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Your Membership Get Data',
      apiUrl:
          '${YourMembershipGroup.baseUrl}/107065/Member/$memberid/MemberProfile',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'x-ss-id': '$sessionid',
        'Access-Control-Allow-Methods': 'POST, GET, OPTIONS',
        'Access-Control-Allow-Credentials':
            'true, // Required for cookies, authorization headers with HTTPS',
        'Access-Control-Allow-Headers': '*',
      },
      params: {
        'memberid': memberid,
        'sessionid': sessionid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? ispmember(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.AccountInformation.Membership''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.PersonalInformation.FirstName''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.PersonalInformation.LastName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.PersonalInformation.Email''',
      ));
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.PersonalInformation.FullName''',
      ));
  String? employername(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ProfessionalInformation.EmployerName''',
      ));
  String? headshot(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.PersonalInformation.HeadshotImage''',
      ));
}

class GroupDataCall {
  Future<ApiCallResponse> call({
    String? memberid = '',
    String? sessionid = '',
    String? status = '',
    int? pageSize,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Group Data',
      apiUrl: '${YourMembershipGroup.baseUrl}/107065/Member/$memberid/Groups',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'x-ss-id': '$sessionid',
        'Access-Control-Allow-Headers': '*',
        'Cache-Control': 'no-cache',
        'Access-Control-Allow-Credentials':
            'true, // Required for cookies, authorization headers with HTTPS',
        'Access-Control-Allow-Methods': 'POST, GET, OPTIONS',
      },
      params: {
        'memberid': memberid,
        'sessionid': sessionid,
        'Status': status,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? grouplist1(dynamic response) => getJsonField(
        response,
        r'''$.GroupTypeList''',
        true,
      ) as List?;
  List? grouplist2(dynamic response) => getJsonField(
        response,
        r'''$.GroupTypeList[:].Groups''',
        true,
      ) as List?;
  List<String>? groupname(dynamic response) => (getJsonField(
        response,
        r'''$.GroupTypeList[:].Groups[:].Name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EventsCall {
  Future<ApiCallResponse> call({
    String? memberid = '',
    String? sessionid = '',
    int? pageSize,
    int? pageNumber,
    String? status = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Events',
      apiUrl: '${YourMembershipGroup.baseUrl}/107065/Events',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Access-Control-Allow-Credentials':
            'true, // Required for cookies, authorization headers with HTTPS',
        'Access-Control-Allow-Methods': 'POST, GET, OPTIONS',
        'Access-Control-Allow-Headers': '*',
        'Cache-Control': 'no-cache',
        'x-ss-id': '$sessionid',
      },
      params: {
        'memberid': memberid,
        'sessionid': sessionid,
        'PageSize': pageSize,
        'PageNumber': pageNumber,
        'Status': status,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Your Membership Group Code

/// Start OpenAI API Group Code

class OpenAIAPIGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Authorisation Bearer':
        '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',
  };
  static CreateChatCompletionCall createChatCompletionCall =
      CreateChatCompletionCall();
  static CreateChatCompletionCopyCall createChatCompletionCopyCall =
      CreateChatCompletionCopyCall();
  static CreateCompletionCall createCompletionCall = CreateCompletionCall();
  static CreateEditCall createEditCall = CreateEditCall();
  static CreateImageCall createImageCall = CreateImageCall();
  static CreateImageEditCall createImageEditCall = CreateImageEditCall();
  static CreateImageVariationCall createImageVariationCall =
      CreateImageVariationCall();
  static CreateEmbeddingCall createEmbeddingCall = CreateEmbeddingCall();
  static CreateSpeechCall createSpeechCall = CreateSpeechCall();
  static CreateTranscriptionCall createTranscriptionCall =
      CreateTranscriptionCall();
  static CreateTranslationCall createTranslationCall = CreateTranslationCall();
  static ListFilesCall listFilesCall = ListFilesCall();
  static CreateFileCall createFileCall = CreateFileCall();
  static DeleteFileCall deleteFileCall = DeleteFileCall();
  static RetrieveFileCall retrieveFileCall = RetrieveFileCall();
  static DownloadFileCall downloadFileCall = DownloadFileCall();
  static CreateFineTuningJobCall createFineTuningJobCall =
      CreateFineTuningJobCall();
  static ListPaginatedFineTuningJobsCall listPaginatedFineTuningJobsCall =
      ListPaginatedFineTuningJobsCall();
  static RetrieveFineTuningJobCall retrieveFineTuningJobCall =
      RetrieveFineTuningJobCall();
  static ListFineTuningEventsCall listFineTuningEventsCall =
      ListFineTuningEventsCall();
  static CancelFineTuningJobCall cancelFineTuningJobCall =
      CancelFineTuningJobCall();
  static CreateFineTuneCall createFineTuneCall = CreateFineTuneCall();
  static ListFineTunesCall listFineTunesCall = ListFineTunesCall();
  static RetrieveFineTuneCall retrieveFineTuneCall = RetrieveFineTuneCall();
  static CancelFineTuneCall cancelFineTuneCall = CancelFineTuneCall();
  static ListFineTuneEventsCall listFineTuneEventsCall =
      ListFineTuneEventsCall();
  static ListModelsCall listModelsCall = ListModelsCall();
  static RetrieveModelCall retrieveModelCall = RetrieveModelCall();
  static DeleteModelCall deleteModelCall = DeleteModelCall();
  static CreateModerationCall createModerationCall = CreateModerationCall();
  static ListAssistantsCall listAssistantsCall = ListAssistantsCall();
  static CreateAssistantCall createAssistantCall = CreateAssistantCall();
  static GetAssistantCall getAssistantCall = GetAssistantCall();
  static ModifyAssistantCall modifyAssistantCall = ModifyAssistantCall();
  static DeleteAssistantCall deleteAssistantCall = DeleteAssistantCall();
  static CreateThreadCall createThreadCall = CreateThreadCall();
  static GetThreadCall getThreadCall = GetThreadCall();
  static ModifyThreadCall modifyThreadCall = ModifyThreadCall();
  static DeleteThreadCall deleteThreadCall = DeleteThreadCall();
  static ListMessagesCall listMessagesCall = ListMessagesCall();
  static CreateMessageCall createMessageCall = CreateMessageCall();
  static GetMessageCall getMessageCall = GetMessageCall();
  static ModifyMessageCall modifyMessageCall = ModifyMessageCall();
  static CreateThreadAndRunCall createThreadAndRunCall =
      CreateThreadAndRunCall();
  static ListRunsCall listRunsCall = ListRunsCall();
  static CreateRunCall createRunCall = CreateRunCall();
  static GetRunCall getRunCall = GetRunCall();
  static ModifyRunCall modifyRunCall = ModifyRunCall();
  static SubmitToolOuputsToRunCall submitToolOuputsToRunCall =
      SubmitToolOuputsToRunCall();
  static CancelRunCall cancelRunCall = CancelRunCall();
  static ListRunStepsCall listRunStepsCall = ListRunStepsCall();
  static GetRunStepCall getRunStepCall = GetRunStepCall();
  static ListAssistantFilesCall listAssistantFilesCall =
      ListAssistantFilesCall();
  static CreateAssistantFileCall createAssistantFileCall =
      CreateAssistantFileCall();
  static GetAssistantFileCall getAssistantFileCall = GetAssistantFileCall();
  static DeleteAssistantFileCall deleteAssistantFileCall =
      DeleteAssistantFileCall();
  static ListMessageFilesCall listMessageFilesCall = ListMessageFilesCall();
  static GetMessageFileCall getMessageFileCall = GetMessageFileCall();
}

class CreateChatCompletionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "messages": [
    ""
  ],
  "model": "gpt-3.5-turbo",
  "frequency_penalty": 0,
  "logit_bias": {},
  "max_tokens": 0,
  "n": 1,
  "presence_penalty": 0,
  "response_format": {
    "type": "json_object"
  },
  "seed": 0,
  "stop": "",
  "stream": false,
  "temperature": 1,
  "top_p": 1,
  "tools": [
    {
      "type": "function",
      "function": {
        "description": "",
        "name": "",
        "parameters": {}
      }
    }
  ],
  "tool_choice": "",
  "user": "user-1234",
  "function_call": "",
  "functions": [
    {
      "description": "",
      "name": "",
      "parameters": {}
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createChatCompletion',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateChatCompletionCopyCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "model": "gpt-4-vision-preview",
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "What’s in this image?"
        },
        {
          "type": "image_url",
          "image_url": {
            "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Gfp-wisconsin-madison-the-nature-boardwalk.jpg/2560px-Gfp-wisconsin-madison-the-nature-boardwalk.jpg"
          }
        }
      ]
    }
  ],
  "max_tokens": 300
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createChatCompletion Copy',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization Bearer': '$apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateCompletionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "model": "",
  "prompt": "",
  "best_of": 0,
  "echo": false,
  "frequency_penalty": 0,
  "logit_bias": {},
  "logprobs": 0,
  "max_tokens": 16,
  "n": 1,
  "presence_penalty": 0,
  "seed": 0,
  "stop": "",
  "stream": false,
  "suffix": "test.",
  "temperature": 1,
  "top_p": 1,
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createCompletion',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateEditCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "instruction": "Fix the spelling mistakes.",
  "model": "text-davinci-edit-001",
  "input": "What day of the wek is it?",
  "n": 1,
  "temperature": 1,
  "top_p": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createEdit',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/edits',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "prompt": "A cute baby sea otter",
  "model": "dall-e-3",
  "n": 1,
  "quality": "standard",
  "response_format": "url",
  "size": "1024x1024",
  "style": "vivid",
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createImage',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/images/generations',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageEditCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createImageEdit',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/images/edits',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageVariationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createImageVariation',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/images/variations',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateEmbeddingCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "input": "The quick brown fox jumped over the lazy dog",
  "model": "text-embedding-ada-002",
  "encoding_format": "float",
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createEmbedding',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/embeddings',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSpeechCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "model": "",
  "input": "",
  "voice": "alloy",
  "response_format": "mp3",
  "speed": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createSpeech',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/audio/speech',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTranscriptionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createTranscription',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTranslationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createTranslation',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/audio/translations',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFilesCall {
  Future<ApiCallResponse> call({
    String? purpose = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listFiles',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/files',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'purpose': purpose,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFileCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createFile',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/files',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteFile',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/files/$fileId',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'retrieveFile',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/files/$fileId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DownloadFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'downloadFile',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/files/$fileId/content',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "training_file": "file-abc123",
  "hyperparameters": {
    "batch_size": "",
    "learning_rate_multiplier": "",
    "n_epochs": ""
  },
  "suffix": "",
  "validation_file": "file-abc123"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createFineTuningJob',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/fine_tuning/jobs',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListPaginatedFineTuningJobsCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listPaginatedFineTuningJobs',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/fine_tuning/jobs',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'retrieveFineTuningJob',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/fine_tuning/jobs/$fineTuningJobId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFineTuningEventsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listFineTuningEvents',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/fine_tuning/jobs/$fineTuningJobId/events',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cancelFineTuningJob',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/fine_tuning/jobs/$fineTuningJobId/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFineTuneCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "training_file": "file-abc123",
  "batch_size": 0,
  "classification_betas": [
    0
  ],
  "classification_n_classes": 0,
  "classification_positive_class": "",
  "compute_classification_metrics": false,
  "hyperparameters": {
    "n_epochs": ""
  },
  "learning_rate_multiplier": 0,
  "model": "curie",
  "prompt_loss_weight": 0,
  "suffix": "",
  "validation_file": "file-abc123"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createFineTune',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/fine-tunes',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFineTunesCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listFineTunes',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/fine-tunes',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveFineTuneCall {
  Future<ApiCallResponse> call({
    String? fineTuneId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'retrieveFineTune',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/fine-tunes/$fineTuneId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelFineTuneCall {
  Future<ApiCallResponse> call({
    String? fineTuneId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cancelFineTune',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/fine-tunes/$fineTuneId/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFineTuneEventsCall {
  Future<ApiCallResponse> call({
    String? fineTuneId = '',
    bool? stream,
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listFineTuneEvents',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/fine-tunes/$fineTuneId/events',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'stream': stream,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListModelsCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listModels',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/models',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'retrieveModel',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/models/$model',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteModel',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/models/$model',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateModerationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "input": "",
  "model": "text-moderation-stable"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createModeration',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/moderations',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListAssistantsCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listAssistants',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/assistants',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateAssistantCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "model": "",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "file_ids": [
    ""
  ],
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAssistant',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/assistants',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAssistant',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/assistants/$assistantId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "model": "",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "file_ids": [
    ""
  ],
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyAssistant',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/assistants/$assistantId',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteAssistant',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/assistants/$assistantId',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateThreadCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "messages": [
    {
      "role": "user",
      "content": "",
      "file_ids": [
        ""
      ],
      "metadata": {}
    }
  ],
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createThread',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getThread',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyThread',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteThread',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListMessagesCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listMessages',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId/messages',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "role": "user",
  "content": "",
  "file_ids": [
    ""
  ],
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createMessage',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId/messages',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMessage',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/threads/$threadId/messages/$messageId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyMessage',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/threads/$threadId/messages/$messageId',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateThreadAndRunCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "assistant_id": "",
  "thread": {
    "messages": [
      {
        "role": "user",
        "content": "",
        "file_ids": [
          ""
        ],
        "metadata": {}
      }
    ],
    "metadata": {}
  },
  "model": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createThreadAndRun',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/runs',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListRunsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listRuns',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId/runs',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "assistant_id": "",
  "model": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createRun',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId/runs',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRun',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId/runs/$runId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyRun',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/threads/$threadId/runs/$runId',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitToolOuputsToRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "tool_outputs": [
    {
      "tool_call_id": "",
      "output": ""
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitToolOuputsToRun',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/threads/$threadId/runs/$runId/submit_tool_outputs',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cancelRun',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/threads/$threadId/runs/$runId/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListRunStepsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listRunSteps',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/threads/$threadId/runs/$runId/steps',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRunStepCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? stepId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRunStep',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/threads/$threadId/runs/$runId/steps/$stepId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListAssistantFilesCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listAssistantFiles',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/assistants/$assistantId/files',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateAssistantFileCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    const ffApiRequestBody = '''
{
  "file_id": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAssistantFile',
      apiUrl: '${OpenAIAPIGroup.baseUrl}/assistants/$assistantId/files',
      callType: ApiCallType.POST,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAssistantFileCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAssistantFile',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/assistants/$assistantId/files/$fileId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAssistantFileCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteAssistantFile',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/assistants/$assistantId/files/$fileId',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListMessageFilesCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listMessageFiles',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/threads/$threadId/messages/$messageId/files',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMessageFileCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
    String? openApiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMessageFile',
      apiUrl:
          '${OpenAIAPIGroup.baseUrl}/threads/$threadId/messages/$messageId/files/$fileId',
      callType: ApiCallType.GET,
      headers: {
        'Authorisation Bearer':
            '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',
        'Authorization': 'Bearer $apiKeyAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OpenAI API Group Code

/// Start Flowise Group Code

class FlowiseGroup {
  static String baseUrl =
      'https://nafya-flowise.alikibao.online/api/v1/prediction/';
  static Map<String, String> headers = {};
  static FlowiseAPICallCall flowiseAPICallCall = FlowiseAPICallCall();
  static WlecomeLearnerCall wlecomeLearnerCall = WlecomeLearnerCall();
}

class FlowiseAPICallCall {
  Future<ApiCallResponse> call({
    String? question = '',
    String? systemMessagePrompt = '',
    String? topic = '',
    String? readingItem = '',
    String? sessionId = '',
    String? supabaseMetadataFilter = '',
    String? threadId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "$question",
  "overrideConfig": {
    "systemMessagePrompt": "$systemMessagePrompt",
    "sessionId": "$sessionId",
    "superbaseMetadataFilter":"$supabaseMetadataFilter"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Flowise API Call',
      apiUrl: '${FlowiseGroup.baseUrl}bdae9275-a3cd-49db-9278-2b8f0789aca1',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic activityName(dynamic response) => getJsonField(
        response,
        r'''$.activityName''',
      );
  dynamic activityDescription(dynamic response) => getJsonField(
        response,
        r'''$.activityDescription''',
      );
  dynamic activityPurpose(dynamic response) => getJsonField(
        response,
        r'''$.activityPurpose''',
      );
  dynamic activityTime(dynamic response) => getJsonField(
        response,
        r'''$.estimatedCompletionTime''',
      );
  dynamic hTMLbodyText(dynamic response) => getJsonField(
        response,
        r'''$.HTMLbodyText''',
      );
  dynamic activityInvitation(dynamic response) => getJsonField(
        response,
        r'''$.invitation''',
      );
  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
}

class WlecomeLearnerCall {
  Future<ApiCallResponse> call({
    String? question = '',
    String? systemMessagePrompt = '',
    String? topic = '',
    String? readingItem = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "$question",
  "overrideConfig": {
    "systemMessagePrompt": "$systemMessagePrompt"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'wlecome learner',
      apiUrl: '${FlowiseGroup.baseUrl}186ee3c0-7d5f-4a46-abf9-48d32e46293d',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic activityName(dynamic response) => getJsonField(
        response,
        r'''$.activityName''',
      );
  dynamic activityDescription(dynamic response) => getJsonField(
        response,
        r'''$.activityDescription''',
      );
  dynamic activityPurpose(dynamic response) => getJsonField(
        response,
        r'''$.activityPurpose''',
      );
  dynamic activityTime(dynamic response) => getJsonField(
        response,
        r'''$.estimatedCompletionTime''',
      );
  dynamic hTMLbodyText(dynamic response) => getJsonField(
        response,
        r'''$.HTMLbodyText''',
      );
  dynamic activityInvitation(dynamic response) => getJsonField(
        response,
        r'''$.invitation''',
      );
  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
}

/// End Flowise Group Code

/// Start cloudFunctions Group Code

class CloudFunctionsGroup {
  static String baseUrl =
      'https://us-central1-yourcaio-c75b4.cloudfunctions.net/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static WelcomeSummaryCall welcomeSummaryCall = WelcomeSummaryCall();
  static StartLearnCardChatCall startLearnCardChatCall =
      StartLearnCardChatCall();
  static GetTopicsCall getTopicsCall = GetTopicsCall();
}

class WelcomeSummaryCall {
  Future<ApiCallResponse> call({
    String? systemMessagePrompt = '',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "systemMessagePrompt": "$systemMessagePrompt",
  "sessionId": "$sessionId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Welcome Summary',
      apiUrl: '${CloudFunctionsGroup.baseUrl}/welcomeSummary',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
}

class StartLearnCardChatCall {
  Future<ApiCallResponse> call({
    String? systemMessagePrompt = '',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "systemMessagePrompt": "$systemMessagePrompt",
  "sessionId": "$sessionId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Start Learn Card Chat',
      apiUrl: '${CloudFunctionsGroup.baseUrl}startLearnCardChat',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTopicsCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
    String? systemMessagePrompt = '',
    bool? isLearnCards,
    String? learnCardId = '',
    String? flowiseUrl = '',
    String? threadId = '',
    String? companyDocId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetTopicsCall',
        'variables': {
          'sessionId': sessionId,
          'systemMessagePrompt': systemMessagePrompt,
          'isLearnCards': isLearnCards,
          'learnCardId': learnCardId,
          'flowiseUrl': flowiseUrl,
          'threadId': threadId,
          'companyDocId': companyDocId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End cloudFunctions Group Code

class GetLiveStreamIdCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '',
    String? playbackPolicy = 'public',
    String? mp4Support = 'standard',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLiveStreamId',
      apiUrl: 'https://api.mux.com/video/v1/assets/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==',
        'Content-Type': 'application/json',
      },
      params: {
        'policy': "public",
        'mp4_support': "standard",
        'PLAYBACK_ID': playbackId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic streamid(dynamic response) => getJsonField(
        response,
        r'''$.data.object.id''',
      );
  static dynamic playbackId(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class GetPastLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? streamId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPastLiveStream',
      apiUrl: 'https://api.mux.com/video/v1/assets?',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==',
        'Content-Type': 'application/json',
      },
      params: {
        'live_stream_id': streamId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? playbackid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      ));
}

class GetliveviewsCall {
  static Future<ApiCallResponse> call({
    String? videoViewId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getliveviews',
      apiUrl: 'https://api.mux.com/data/v1/video-views/{VIDEO_VIEW_ID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AuthoriseZoomCall {
  static Future<ApiCallResponse> call({
    String? grantType = '',
    String? accountId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Authorise Zoom',
      apiUrl:
          'https://zoom.us/oauth/token?grant_type=account_credentials&account_id=$accountId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic b1IxbkJpSGVTcWl3VndKTGdzVm0yQTp5aVFObFQzTnkzUzlmQ0cyNzZ0MmhnelZlWGRnRnZ3TQ==',
        'Host': 'zoom.us',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRecordingsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Recordings ',
      apiUrl: 'https://api.zoom.us/v2/users/dg@goappy.io',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzUxMiIsInYiOiIyLjAiLCJraWQiOiJiMWJlNTY2Yi1lNGM1LTQwM2EtYmYxZC1lMDMxMmJhZWM4YjcifQ.eyJ2ZXIiOjcsImF1aWQiOiIyYjA2YjY1ZDIyYzdlOTc3YWIxOTlhYjcwNTYyNWM3ZCIsImNvZGUiOiJMX0NBdTFVWVFJdV85QXpDYi1zd2ZncDVtdkRscVU3VzciLCJpc3MiOiJ6bTpjaWQ6b1IxbkJpSGVTcWl3VndKTGdzVm0yQSIsImdubyI6MCwidHlwZSI6MywiYXVkIjoiaHR0cHM6Ly9vYXV0aC56b29tLnVzIiwidWlkIjoiQ3JRemNDMWZSYVdwa3EzVmRpcWZZUSIsIm5iZiI6MTY3MTE1OTAzNCwiZXhwIjoxNjcxMTYyNjM0LCJpYXQiOjE2NzExNTkwMzQsImFpZCI6InVxcUYzZ1l3U2dhV0YwY3EzeXlzcWciLCJqdGkiOiI0MDI1NmM1ZS0yZWM1LTQ1ZjAtYjJmZi02OGRhMDQ1NzdkZTAifQ.QNuK2xWicl5ON26Meu0dhz7A_3zFQ4GBHM9aMYVgfx9NpYEpU76',
        'Host': 'api.zoom.us',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CloudinaryuploadCall {
  static Future<ApiCallResponse> call({
    String? upload = '',
    String? cloudname = '',
    String? apiKey = '',
    String? apiSecret = '',
  }) async {
    final ffApiRequestBody = '''
{
  "upload": "$upload",
  "cloudname": "$cloudname",
  "api_key": "$apiKey",
  "api_secret": "$apiSecret"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cloudinaryupload',
      apiUrl:
          'https://api.cloudinary.com/v1_1/{{cloud_name}}/:resource_type/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OpenaidavinciCall {
  static Future<ApiCallResponse> call({
    String? model = 'text-davinci-003',
    String? prompt = '',
    double? temperature = 0.7,
    int? maxTokens = 200,
    int? topP = 1,
    int? frequencyPenalty = 0,
    int? presencePenalty = 0,
  }) async {
    final ffApiRequestBody = '''
{
  "model": "$model",
   "prompt": "$prompt",
     "max_tokens": 256 ,
   "temperature": 0.7,
   "top_p": $topP,
  "frequency_penalty": $frequencyPenalty,
  "presence_penalty": $presencePenalty

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'openaidavinci',
      apiUrl: 'https://api.openai.com/v1/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic choices(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].text''',
      );
}

class MuxWebVideoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'muxWebVideo',
      apiUrl:
          'https://api.mux.com/video/v1/assets/{yG02Ke00f6nO5Kne7tNyBd8YjNj02PdQfwtwORcrOlxcpI}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class NewMuxGetLiveStreamIDCall {
  static Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NewMuxGetLiveStreamIDCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class NewMuxGetLiveStreamIDJUSTIdCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NewMuxGetLiveStreamIDJUSTIdCall',
        'variables': {
          'playbackId': playbackId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? liveStreamID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.object.id''',
      ));
}

class FirebaseCloudFunctionsCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "client_name": "Fiona",
  "business_name": "Boundaries are YES",
  "business_description": "boundary and emotional"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'firebase cloud functions',
      apiUrl: 'https://us-central1-caio-384318.cloudfunctions.net/coach-prompt',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OnboardingCall {
  static Future<ApiCallResponse> call({
    String? clientName = '',
    String? businessName = '',
    String? businessDescription = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'onboarding',
      apiUrl: 'https://hook.eu1.make.com/o58lx7gm5xepwspd9jxyqhwwb1mgigxs',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'client_name': clientName,
        'business_name': businessName,
        'business_description': businessDescription,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CloudinaryCall {
  static Future<ApiCallResponse> call({
    String? folder = 'Tony Morris International',
    String? subFolder = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cloudinary',
      apiUrl:
          'https://api.cloudinary.com/v1_1/dplpckpbm/folders/Tony%20Morris%20International/Estate%20and%20Lettings%20Agency/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NzcxODEyMTM2OTUzODg2OmV0ZkpudDU2VTZkVXhWNnJRd1l5Z2RTcTgyVQ==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CloudinaryCopyCall {
  static Future<ApiCallResponse> call({
    String? folder = 'Tony Morris International',
    String? subFolder = 'All universities',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cloudinary Copy',
      apiUrl:
          'https://api.cloudinary.com/v1_1/dplpckpbm/resources/video?prefix=Tony%20Morris%20International/Mortgage%20University/&type=upload&max_results=500',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NzcxODEyMTM2OTUzODg2OmV0ZkpudDU2VTZkVXhWNnJRd1l5Z2RTcTgyVQ==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CloudinaryGetAssetCall {
  static Future<ApiCallResponse> call({
    String? folder = 'Tony Morris International',
    String? subFolder = 'All universities',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cloudinary get asset',
      apiUrl:
          'https://api.cloudinary.com/v1_1/dplpckpbm/resources/video/upload/cxlop6rewycegnxirjec',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NzcxODEyMTM2OTUzODg2OmV0ZkpudDU2VTZkVXhWNnJRd1l5Z2RTcTgyVQ==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic googleSpeechStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.raw_convert.google_speech.status''',
      );
}

class CloudinaryTranscribeCall {
  static Future<ApiCallResponse> call({
    String? file =
        'https://res.cloudinary.com/dplpckpbm/video/upload/v1698659240/Tony%20Morris%20International/Estate%20and%20Letting%20Agency%20University/4.%20Objection%20Handling/Objection_Handling_-_26_Heard_dreadful_things_about_your_company_-_imb5ob.mp4',
    String? rawConvert = 'google_speech',
    String? timestamp = '',
    String? apiKey = '617667519725416',
    String? signature = '',
    int? timeout = 860000,
    String? fileName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "file": "$file",
  "raw_convert": "$rawConvert",
  "timestamp": "$timestamp",
  "api_key": "$apiKey",
  "signature": "$signature"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cloudinary Transcribe',
      apiUrl: 'https://api.cloudinary.com/v1_1/dplpckpbm/video/upload',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic NzcxODEyMTM2OTUzODg2OmV0ZkpudDU2VTZkVXhWNnJRd1l5Z2RTcTgyVQ==',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? publicid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.public_id''',
      ));
  static int? versionid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.version''',
      ));
}

class CloudinaryGetTranscriptionCall {
  static Future<ApiCallResponse> call({
    String? publicId = '',
    String? version = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CloudinaryGetTranscriptionCall',
        'variables': {
          'publicId': publicId,
          'version': version,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? transcript(dynamic response) => (getJsonField(
        response,
        r'''$[:].transcript''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? words(dynamic response) => getJsonField(
        response,
        r'''$[:].words''',
        true,
      ) as List?;
  static String? transcriptnotlist(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].transcript''',
      ));
}

class CloudinaryAttemptAssetCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '617667519725416',
    String? apiSecret = 'BJxhmBBDXqy0hYZ-95_-Wx8nz2Y',
    String? publicId = 'aggptop74rglbmdc0yoz',
    String? version = '1699009502',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Cloudinary attempt asset ',
      apiUrl:
          'https://api.cloudinary.com/v1_1/dplpckpbm/resources/video/upload/$publicId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NzcxODEyMTM2OTUzODg2OmV0ZkpudDU2VTZkVXhWNnJRd1l5Z2RTcTgyVQ==',
      },
      params: {
        'public_id': publicId,
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? transcript(dynamic response) => (getJsonField(
        response,
        r'''$[:].transcript''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? words(dynamic response) => getJsonField(
        response,
        r'''$[:].words''',
        true,
      ) as List?;
  static String? transcriptnotlist(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].transcript''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.raw_convert.google_speech.status''',
      ));
  static dynamic statusjson(dynamic response) => getJsonField(
        response,
        r'''$.info.raw_convert.google_speech''',
      );
  static dynamic statuslistpossible(dynamic response) => getJsonField(
        response,
        r'''$.info.raw_convert''',
      );
}

class CloudinaryGetSignatureCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cloudinary Get Signature ',
      apiUrl:
          'https://us-central1-tony-morris-internationa-1b480.cloudfunctions.net/getCloudinarySign',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? signature(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signature''',
      ));
  static dynamic timestamp(dynamic response) => getJsonField(
        response,
        r'''$.timestamp''',
      );
}

class WebhookCheckCloudinaryCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "type": "TRANSCRIPTION_COMPLETED",
  "data": {
    "asset_id": "12345678",
    "public_id": "sampleid1234",
    "version": 12345,
    "version_id": "sampleversionid",
    "signature": "sample_signature",
    "width": 1920,
    "height": 1080,
    "format": "mp4",
    "resource_type": "video",
    "created_at": "2023-11-03T19:29:21Z",
    "tags": ["sample", "tag"],
    "pages": 1,
    "bytes": 99931932,
    "type": "upload",
    "etag": "sample_etag",
    "placeholder": false,
    "url": "http://sample.url/video.mp4",
    "secure_url": "https://sample.secure.url/video.mp4",
    "playback_url": "https://sample.playback.url/video.m3u8",
    "folder": "sample_folder",
    "info": {
      "raw_convert": {
        "google_speech": {
          "status": "completed",
          "data": {
            "formats": [
              {
                "type": "sample_type",
                "content": "sample_content"
              }
            ]
          }
        }
      }
    },
    "audio": {
      "codec": "aac",
      "bit_rate": "317285",
      "frequency": 48000,
      "channels": 2,
      "channel_layout": "stereo"
    },
    "video": {
      "pix_format": "yuv420p",
      "codec": "h264",
      "level": 41,
      "profile": "Main",
      "bit_rate": "12776981",
      "time_base": "1/25000"
    },
    "is_audio": false,
    "frame_rate": 25,
    "bit_rate": 13098383,
    "duration": 61,
    "rotation": 0,
    "original_filename": "sample_filename",
    "nb_frames": 1525,
    "api_key": "sample_api_key"
  }
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'webhook Check Cloudinary',
      apiUrl: 'https://hook.eu1.make.com/94i2cdq7o5vlpfvmlktgaxjfjct12f7l',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FlowiseCUrlSupabaseChatCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "$question"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'flowise cUrl Supabase Chat',
      apiUrl:
          'https://nafya-flowise.alikibao.online/api/v1/prediction/38b321da-5e0e-46d4-a4ec-6938235f2446',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
  static String? blockId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sourceDocuments[:].metadata.block_id''',
      ));
  static String? blockName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sourceDocuments[:].metadata.block_name''',
      ));
  static String? blockType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sourceDocuments[:].metadata.block_type''',
      ));
  static String? tileId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sourceDocuments[:].metadata.tile_id''',
      ));
}

class SAMPLECreateTileFromFlowiseInformationCall {
  static Future<ApiCallResponse> call({
    dynamic bodyJson,
  }) async {
    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = body;
    return ApiManager.instance.makeApiCall(
      callName: 'SAMPLE  create tile from flowise information',
      apiUrl: 'https://mycloudfunctiontocreatetiles.com',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OpenAiFunctionCall {
  static Future<ApiCallResponse> call({
    String? userMessage = '',
    String? systemMessage = '',
    String? sessionId = '',
    String? userId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'OpenAiFunctionCall',
        'variables': {
          'userMessage': userMessage,
          'systemMessage': systemMessage,
          'sessionId': sessionId,
          'userId': userId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.openAiResponse''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userMessage''',
      ));
}

class GetTileBlockContentCall {
  static Future<ApiCallResponse> call({
    String? sessionId = '',
    String? systemMessagePrompt = '',
    String? tileBlockId = '',
    String? topic = '',
    String? subject = '',
    bool? isLearnCards,
    String? flowiseUrl = '',
    String? tileId = '',
    String? outputKey = '',
    String? tableName = '',
    String? queryName = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetTileBlockContentCall',
        'variables': {
          'sessionId': sessionId,
          'systemMessagePrompt': systemMessagePrompt,
          'tileBlockId': tileBlockId,
          'topic': topic,
          'subject': subject,
          'isLearnCards': isLearnCards,
          'flowiseUrl': flowiseUrl,
          'tileId': tileId,
          'outputKey': outputKey,
          'tableName': tableName,
          'queryName': queryName,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.openAiResponse''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userMessage''',
      ));
}

class FlowiseGetTileNameCall {
  static Future<ApiCallResponse> call({
    String? sessionId = '',
    String? systemMessagePrompt = '',
    String? getTilesPromptUserMessage = '',
    String? supabaseProjUrl = '',
    String? tableName = '',
    String? queryName = '',
    bool? isLearnCards,
    String? flowiseUrl = '',
    String? threadId = '',
    String? companyDocId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FlowiseGetTileNameCall',
        'variables': {
          'sessionId': sessionId,
          'systemMessagePrompt': systemMessagePrompt,
          'getTilesPromptUserMessage': getTilesPromptUserMessage,
          'supabaseProjUrl': supabaseProjUrl,
          'tableName': tableName,
          'queryName': queryName,
          'isLearnCards': isLearnCards,
          'flowiseUrl': flowiseUrl,
          'threadId': threadId,
          'companyDocId': companyDocId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.openAiResponse''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userMessage''',
      ));
}

class OpenAiFunctionViaFlowiseCopyCall {
  static Future<ApiCallResponse> call({
    String? sessionId = '',
    String? systemMessagePrompt = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'OpenAiFunctionViaFlowiseCopyCall',
        'variables': {
          'sessionId': sessionId,
          'systemMessagePrompt': systemMessagePrompt,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.openAiResponse''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userMessage''',
      ));
}

class OpenAiFunctionBeforeChangeCall {
  static Future<ApiCallResponse> call({
    List<String>? userMessageList,
    String? systemMessage =
        'You are going to compile a customised learning journey based on the users responses but for now we just want to welcome the user and give them an outline of what topics we are going to cover and why. we do not need to map the plan yet, the response will be formatted as an article using the following structure <h1></h1> primary topic <h2> sub topic give a comprehensive outline <h3> whatever you see fit and <p> a summary',
    String? userSessionId = '',
  }) async {
    final userMessage = _serializeList(userMessageList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'OpenAiFunctionBeforeChangeCall',
        'variables': {
          'userMessage': userMessage,
          'systemMessage': systemMessage,
          'userSessionId': userSessionId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.openAiResponse''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userMessage''',
      ));
}

class OpenAiInspireMeCall {
  static Future<ApiCallResponse> call({
    String? userMessage = '',
    String? systemMessage = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'OpenAiInspireMeCall',
        'variables': {
          'userMessage': userMessage,
          'systemMessage': systemMessage,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.openAiResponse''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userMessage''',
      ));
}

class StartLearningJourneyCall {
  static Future<ApiCallResponse> call({
    String? tileId = '',
    String? topic = '',
    String? learningCard = '',
    String? companyDetails = '',
    String? userDetails = '',
    String? learningCardType = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'StartLearningJourneyCall',
        'variables': {
          'tileId': tileId,
          'topic': topic,
          'learningCard': learningCard,
          'companyDetails': companyDetails,
          'userDetails': userDetails,
          'learningCardType': learningCardType,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class OpenAiFunctionSingleItemBackupCall {
  static Future<ApiCallResponse> call({
    String? userMessage = '',
    String? systemMessage =
        '  \"systemMessage\": \"On tile click Can you provide me with a detailed guide and resources to deepen my understanding and skills [userMessage]  response will be formatted as an article using the following structure <h1> </h1> primary topic <h2> sub topic give a comprehensive outline <h3> whatever you see fit and <p> a summary.',
    String? selectedTileId = '',
    String? htmlContent = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'OpenAiFunctionSingleItemBackupCall',
        'variables': {
          'userMessage': userMessage,
          'systemMessage': systemMessage,
          'selectedTileId': selectedTileId,
          'htmlContent': htmlContent,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DalleImageGenerationCall {
  static Future<ApiCallResponse> call({
    String? blockName = '',
    String? sessionId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DalleImageGenerationCall',
        'variables': {
          'blockName': blockName,
          'sessionId': sessionId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.imageUrl''',
      ));
}

class ReflectionExcersisesNotUsedNotDeleteCall {
  static Future<ApiCallResponse> call({
    String? tileBlockId = '',
    String? htmlPassed = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ReflectionExcersisesNotUsedNotDeleteCall',
        'variables': {
          'tileBlockId': tileBlockId,
          'htmlPassed': htmlPassed,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class LearningActivityCall {
  static Future<ApiCallResponse> call({
    String? tileBlockId = '',
    String? htmlPassed = '',
    String? subject = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'LearningActivityCall',
        'variables': {
          'tileBlockId': tileBlockId,
          'htmlPassed': htmlPassed,
          'subject': subject,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CleanJsonCall {
  static Future<ApiCallResponse> call({
    dynamic originalJsonStringJson,
  }) async {
    final originalJsonString = _serializeJson(originalJsonStringJson);
    final ffApiRequestBody = '''
{
  "originalJsonString": $originalJsonString
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cleanJson',
      apiUrl:
          'https://us-central1-yourcaio-c75b4.cloudfunctions.net/handleJsonExtraction',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? activityName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityName''',
      ));
  static String? activityDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityDescription''',
      ));
  static String? activityPurpose(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityPurpose''',
      ));
  static String? estimatedCompletionTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.estimatedCompletionTime''',
      ));
  static String? hTMLbodyText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.HTMLbodyText''',
      ));
  static String? invitation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.invitation''',
      ));
}

class HandleHTMLCall {
  static Future<ApiCallResponse> call({
    String? originalHtmlString = '',
  }) async {
    final ffApiRequestBody = '''
{
  "originalHtmlString": "$originalHtmlString"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'handleHTML',
      apiUrl:
          'https://us-central1-yourcaio-c75b4.cloudfunctions.net/handleHtmlWithOpenAi',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? activityName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityName''',
      ));
  static String? activityDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityDescription''',
      ));
  static String? activityPurpose(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityPurpose''',
      ));
  static String? estimatedCompletionTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.estimatedCompletionTime''',
      ));
  static String? hTMLbodyText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.HTMLbodyText''',
      ));
  static String? invitation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.invitation''',
      ));
}

class HandleHTMLCopyCall {
  static Future<ApiCallResponse> call({
    String? originalHtmlString = '',
  }) async {
    final ffApiRequestBody = '''
{
  "originalHtmlString": "$originalHtmlString"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'handleHTML Copy',
      apiUrl:
          'https://us-central1-yourcaio-c75b4.cloudfunctions.net/handleHtmlValidation',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? activityName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityName''',
      ));
  static String? activityDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityDescription''',
      ));
  static String? activityPurpose(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityPurpose''',
      ));
  static String? estimatedCompletionTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.estimatedCompletionTime''',
      ));
  static String? hTMLbodyText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.HTMLbodyText''',
      ));
  static String? invitation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.invitation''',
      ));
}

class CleanJsonCorrectionAiCall {
  static Future<ApiCallResponse> call({
    dynamic originalJsonStringJson,
  }) async {
    final originalJsonString = _serializeJson(originalJsonStringJson);
    final ffApiRequestBody = '''
{
  "originalJsonString": $originalJsonString
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cleanJson correction ai',
      apiUrl:
          'https://us-central1-yourcaio-c75b4.cloudfunctions.net/handleJsonCorrection',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? activityName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityName''',
      ));
  static String? activityDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityDescription''',
      ));
  static String? activityPurpose(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.activityPurpose''',
      ));
  static String? estimatedCompletionTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.estimatedCompletionTime''',
      ));
  static String? hTMLbodyText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.HTMLbodyText''',
      ));
  static String? invitation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.invitation''',
      ));
}

class CallLearnCardChatCall {
  static Future<ApiCallResponse> call({
    String? systemMessagePrompt = '',
    String? sessionId = '',
    String? threadId = '',
    String? learnCardId = '',
    String? supabaseProjUrl = '',
    String? tableName = '',
    String? queryName = '',
    bool? isLearnCards,
    String? flowiseUrl = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CallLearnCardChatCall',
        'variables': {
          'systemMessagePrompt': systemMessagePrompt,
          'sessionId': sessionId,
          'threadId': threadId,
          'learnCardId': learnCardId,
          'supabaseProjUrl': supabaseProjUrl,
          'tableName': tableName,
          'queryName': queryName,
          'isLearnCards': isLearnCards,
          'flowiseUrl': flowiseUrl,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CloudinaryPresetCreateCall {
  static Future<ApiCallResponse> call({
    String? presetName = '',
    String? folderName = '',
    String? context = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CloudinaryPresetCreateCall',
        'variables': {
          'presetName': presetName,
          'folderName': folderName,
          'context': context,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
