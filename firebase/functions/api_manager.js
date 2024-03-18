const axios = require("axios").default;
const qs = require("qs");

/// Start MUX VIDEO Group Code

const muxVideoGroup = {
  baseUrl: "https://api.mux.com/video/",
  headers: {
    Authorization: `Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==`,
    "Content-Type": `application/json`,
  },
};

async function _newGetLiveStreamIDCall(context, ffVariables) {
  var playbackIds = ffVariables["playbackIds"];
  var playbackPolicy = ffVariables["playbackPolicy"];
  var mp4Support = ffVariables["mp4Support"];

  var url = `${muxVideoGroup.baseUrl}v1/playback-ids/${playbackIds}`;
  var headers = {
    Authorization: `Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==`,
    "Content-Type": `application/json`,
  };
  var params = {
    "playback-ids": playbackIds,
    playback_policy: playbackPolicy,
    mp4_support: mp4Support,
  };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}

async function _newGetPastLiveStreamCall(context, ffVariables) {
  var streamId = ffVariables["streamId"];

  var url = `${muxVideoGroup.baseUrl}/v1/assets/`;
  var headers = {
    Authorization: `Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==`,
    "Content-Type": `application/json`,
  };
  var params = { live_stream_id: streamId };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}

/// End MUX VIDEO Group Code

/// Start cloudFunctions Group Code

const cloudFunctionsGroup = {
  baseUrl: "https://us-central1-yourcaio-c75b4.cloudfunctions.net/",
  headers: { "Content-Type": `application/json` },
};

async function _welcomeSummaryCall(context, ffVariables) {
  var systemMessagePrompt = ffVariables["systemMessagePrompt"];
  var sessionId = ffVariables["sessionId"];

  var url = `${cloudFunctionsGroup.baseUrl}/welcomeSummary`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "systemMessagePrompt": "${systemMessagePrompt}",
  "sessionId": "${sessionId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _startLearnCardChatCall(context, ffVariables) {
  var systemMessagePrompt = ffVariables["systemMessagePrompt"];
  var sessionId = ffVariables["sessionId"];

  var url = `${cloudFunctionsGroup.baseUrl}startLearnCardChat`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "systemMessagePrompt": "${systemMessagePrompt}",
  "sessionId": "${sessionId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _getTopicsCall(context, ffVariables) {
  var sessionId = ffVariables["sessionId"];
  var systemMessagePrompt = ffVariables["systemMessagePrompt"];
  var isLearnCards = ffVariables["isLearnCards"];
  var learnCardId = ffVariables["learnCardId"];
  var flowiseUrl = ffVariables["flowiseUrl"];
  var threadId = ffVariables["threadId"];
  var companyDocId = ffVariables["companyDocId"];

  var url = `${cloudFunctionsGroup.baseUrl}/getTopics`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "sessionId": "${sessionId}",
  "systemMessagePrompt": "${systemMessagePrompt}",
  "isLearnCards": "${isLearnCards}",
  "learnCardId": "${learnCardId}",
  "flowiseUrl": "${flowiseUrl}",
  "threadId": "${threadId}",
  "companyDocId": "${companyDocId}",
  "previousTopics": "<previousTopics>"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _getISPDataCall(context, ffVariables) {
  var username = ffVariables["username"];
  var password = ffVariables["password"];
  var companyDocId = ffVariables["companyDocId"];
  var email = ffVariables["email"];
  var companyName = ffVariables["companyName"];
  var sessionId = ffVariables["sessionId"];
  var threadDetails = ffVariables["threadDetails"];
  var threadId = ffVariables["threadId"];
  var userId = ffVariables["userId"];

  var url = `${cloudFunctionsGroup.baseUrl}ispGetData`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "username": "${username}",
  "password": "${password}",
  "companyDocId": "${companyDocId}",
  "email": "${email}",
  "companyName": "${companyName} ",
  "session_id": "${sessionId}",
  "thread_id": "${threadId}",
  "user_id": "${sessionId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _getISPDataCopyCall(context, ffVariables) {
  var username = ffVariables["username"];
  var password = ffVariables["password"];
  var companyDocId = ffVariables["companyDocId"];
  var email = ffVariables["email"];
  var companyName = ffVariables["companyName"];
  var sessionId = ffVariables["sessionId"];
  var threadDetails = ffVariables["threadDetails"];
  var threadId = ffVariables["threadId"];
  var userId = ffVariables["userId"];

  var url = `${cloudFunctionsGroup.baseUrl}ispGetData`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "username": "${username}",
  "password": "${password}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

/// End cloudFunctions Group Code

async function _newMuxGetLiveStreamIDCall(context, ffVariables) {
  var url = `https://api.mux.com/video/v1/live-streams/Ex2HqAoJAZLoNbOx802ydWuTMRL9pda3HlC2SDteZlZU/playback-ids/VbjfjPJBPkUexMfIyKvbLLZL01NKI8pxe8QGilRJ3Zks`;
  var headers = {
    Authorization: `Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}
async function _newMuxGetLiveStreamIDJUSTIdCall(context, ffVariables) {
  var playbackId = ffVariables["playbackId"];

  var url = `https://api.mux.com/video/v1/playback-ids/${playbackId}`;
  var headers = {
    Authorization: `Basic ZjE0OWY0NDctYTEwOC00ZjBiLWJiNjAtYTBkNjUzZjYyNjc4OlpvR1JpaHZGWDBCS09ySnE3Zmw3ekN6ZUdtOGd3ZGRvUk9IMmw0UTE3d1RReDlGWHdFbDlQQXhIc0NqeGRVV3RwaGcybHpENFc5Ng==`,
  };
  var params = { PLAYBACK_ID: playbackId };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}
async function _cloudinaryGetTranscriptionCall(context, ffVariables) {
  var publicId = ffVariables["publicId"];
  var version = ffVariables["version"];

  var url = `https://res.cloudinary.com/dplpckpbm/raw/upload/v${version}/${publicId}.transcript`;
  var headers = {
    Authorization: `Basic NzcxODEyMTM2OTUzODg2OmV0ZkpudDU2VTZkVXhWNnJRd1l5Z2RTcTgyVQ==`,
  };
  var params = { public_id: publicId, version: version };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}
async function _openAiFunctionCall(context, ffVariables) {
  var userMessage = ffVariables["userMessage"];
  var systemMessage = ffVariables["systemMessage"];
  var sessionId = ffVariables["sessionId"];
  var userId = ffVariables["userId"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/processOpenAiRequest`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "systemMessage": "${systemMessage}",
  "userMessage": "${userMessage}",
  "sessionId": "${sessionId}",
  "userId": "${userId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _getTileBlockContentCall(context, ffVariables) {
  var sessionId = ffVariables["sessionId"];
  var systemMessagePrompt = ffVariables["systemMessagePrompt"];
  var tileBlockId = ffVariables["tileBlockId"];
  var topic = ffVariables["topic"];
  var subject = ffVariables["subject"];
  var isLearnCards = ffVariables["isLearnCards"];
  var flowiseUrl = ffVariables["flowiseUrl"];
  var tileId = ffVariables["tileId"];
  var outputKey = ffVariables["outputKey"];
  var tableName = ffVariables["tableName"];
  var queryName = ffVariables["queryName"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/getTheContentTileBlock`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "sessionId": "${sessionId}",
  "systemMessagePrompt": "${systemMessagePrompt}",
  "tileBlockId": "${tileBlockId}",
  "topic": "${topic}",
  "subject": "${subject}",
  "flowiseUrl": "${flowiseUrl}",
  "tileId": "${tileId}",
  "outputKey": "${outputKey}",
  "tableName": "${tableName}",
  "queryName": "${queryName}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _flowiseGetTileNameCall(context, ffVariables) {
  var sessionId = ffVariables["sessionId"];
  var systemMessagePrompt = ffVariables["systemMessagePrompt"];
  var getTilesPromptUserMessage = ffVariables["getTilesPromptUserMessage"];
  var supabaseProjUrl = ffVariables["supabaseProjUrl"];
  var tableName = ffVariables["tableName"];
  var queryName = ffVariables["queryName"];
  var isLearnCards = ffVariables["isLearnCards"];
  var flowiseUrl = ffVariables["flowiseUrl"];
  var threadId = ffVariables["threadId"];
  var companyDocId = ffVariables["companyDocId"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/flowiseGetTileName`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "sessionId": "${sessionId}",
  "systemMessagePrompt": "${systemMessagePrompt}",
  "getTilesPromptUserMessage": "${getTilesPromptUserMessage}",
  "supabaseProjUrl": "${supabaseProjUrl}",
  "tableName": "${tableName}",
  "queryName": "${queryName}",
  "isLearnCards": ${isLearnCards},
  "flowiseUrl": "${flowiseUrl}",
  "threadId": "${threadId}",
  "companyDocId": "${companyDocId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _openAiFunctionViaFlowiseCopyCall(context, ffVariables) {
  var sessionId = ffVariables["sessionId"];
  var systemMessagePrompt = ffVariables["systemMessagePrompt"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/processOpenAiRequest`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "sessionId": "${sessionId}",
  "systemMessagePrompt": "${systemMessagePrompt}"

}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _openAiFunctionBeforeChangeCall(context, ffVariables) {
  var userMessage = ffVariables["userMessage"];
  var systemMessage = ffVariables["systemMessage"];
  var userSessionId = ffVariables["userSessionId"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/processOpenAiRequest`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "systemMessage": "You are going to compile a customised learning journey based on the users responses but for now we just want to welcome the user and give them an outline of what topics we are going to cover and why. we do not need to map the plan yet, the response will be formatted as an article using the following structure <h1></h1> primary topic <h2> sub topic give a comprehensive outline <h3> whatever you see fit and <p> a summary",
  "userMessage": ${userMessage},
  "userSessionId": "${userSessionId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _openAiInspireMeCall(context, ffVariables) {
  var userMessage = ffVariables["userMessage"];
  var systemMessage = ffVariables["systemMessage"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/processOpenAiRequest`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "systemMessage": "I have a platform that suggests things that one can learn using openAi Api, any topic I need a list of 5 items, just the items no conversation",
  "userMessage": ${userMessage},
  "userSessionId": "<userSessionId>"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _startLearningJourneyCall(context, ffVariables) {
  var tileId = ffVariables["tileId"];
  var topic = ffVariables["topic"];
  var learningCard = ffVariables["learningCard"];
  var companyDetails = ffVariables["companyDetails"];
  var userDetails = ffVariables["userDetails"];
  var learningCardType = ffVariables["learningCardType"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/getTheContent`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "tileId": "${tileId}",
  "topic": "${topic}",
  "learningCard": "${learningCard}",
  "companyDetails": "${companyDetails}",
  "learningCardType": "${learningCardType}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _openAiFunctionSingleItemBackupCall(context, ffVariables) {
  var userMessage = ffVariables["userMessage"];
  var systemMessage = ffVariables["systemMessage"];
  var selectedTileId = ffVariables["selectedTileId"];
  var htmlContent = ffVariables["htmlContent"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/openAiGenerateTileBlocks`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "systemMessage": "On tile click Can you provide me with a detailed guide and resources to deepen my understanding and skills [userMessage]  response will be formatted as an article using the following structure <h1> </h1> primary topic <h2> sub topic give a comprehensive outline <h3> whatever you see fit and <p> a summary.,",
  "userMessage": "${userMessage}",
  "selectedTileId": "${selectedTileId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _dalleImageGenerationCall(context, ffVariables) {
  var blockName = ffVariables["blockName"];
  var sessionId = ffVariables["sessionId"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/dall_eImageGeneration_background`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "block_name": "${blockName}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _reflectionExcersisesNotUsedNotDeleteCall(context, ffVariables) {
  var tileBlockId = ffVariables["tileBlockId"];
  var htmlPassed = ffVariables["htmlPassed"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/createReflectionExercise`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "tile_block_id": "${tileBlockId}",
  "htmlPassed": "${htmlPassed}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _learningActivityCall(context, ffVariables) {
  var tileBlockId = ffVariables["tileBlockId"];
  var htmlPassed = ffVariables["htmlPassed"];
  var subject = ffVariables["subject"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/learningActivity`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "tile_block_id": "${tileBlockId}",
  "htmlPassed": "${htmlPassed}",
  "subject": "${subject}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _callLearnCardChatCall(context, ffVariables) {
  var systemMessagePrompt = ffVariables["systemMessagePrompt"];
  var sessionId = ffVariables["sessionId"];
  var threadId = ffVariables["threadId"];
  var learnCardId = ffVariables["learnCardId"];
  var supabaseProjUrl = ffVariables["supabaseProjUrl"];
  var tableName = ffVariables["tableName"];
  var queryName = ffVariables["queryName"];
  var isLearnCards = ffVariables["isLearnCards"];
  var flowiseUrl = ffVariables["flowiseUrl"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/startLearnCardChat`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "systemMessagePrompt": "${systemMessagePrompt}",
  "sessionId": "${sessionId}",
  "threadId": "${threadId}",
  "learnCardId": "${learnCardId}",
  "supabaseProjUrl": "${supabaseProjUrl}",
  "tableName": "${tableName}",
  "queryName": "${queryName}",
  "isLearnCards": ${isLearnCards},
"flowiseUrl":"${flowiseUrl}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}
async function _cloudinaryPresetCreateCall(context, ffVariables) {
  var presetName = ffVariables["presetName"];
  var folderName = ffVariables["folderName"];
  var context = ffVariables["context"];

  var url = `https://771812136953886:etfJnt56U6dUxV6rQwYygdSq82U@api.cloudinary.com/v1_1/dplpckpbm/upload_presets`;
  var headers = { "Content-Type": `application/x-www-form-urlencoded` };
  var params = {
    name: presetName,
    folder: folderName,
    unsigned: true,
    notification_url: `https://us-central1-yourcaio-c75b4.cloudfunctions.net/cloudinary_webhook_receive`,
    context: context,
  };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "X_WWW_FORM_URL_ENCODED",
    }),
    returnBody: true,
  });
}
async function _iSPDataLookupCall(context, ffVariables) {
  var username = ffVariables["username"];
  var password = ffVariables["password"];
  var companyDocId = ffVariables["companyDocId"];
  var companyName = ffVariables["companyName"];
  var sessionId = ffVariables["sessionId"];
  var threadId = ffVariables["threadId"];
  var userId = ffVariables["userId"];
  var threadDetails = ffVariables["threadDetails"];

  var url = `https://us-central1-yourcaio-c75b4.cloudfunctions.net/ispGetData`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "username": "${username}",
  "password": "${password}",
  "companyDocId": "${companyDocId}",
  "companyName": "${companyName}",
  "session_id": "${sessionId}",
  "threadDetails": ${threadDetails},
  "thread_id": "${threadId}",
  "user_id": "${userId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    NewMuxGetLiveStreamIDCall: _newMuxGetLiveStreamIDCall,
    NewMuxGetLiveStreamIDJUSTIdCall: _newMuxGetLiveStreamIDJUSTIdCall,
    CloudinaryGetTranscriptionCall: _cloudinaryGetTranscriptionCall,
    OpenAiFunctionCall: _openAiFunctionCall,
    GetTileBlockContentCall: _getTileBlockContentCall,
    FlowiseGetTileNameCall: _flowiseGetTileNameCall,
    OpenAiFunctionViaFlowiseCopyCall: _openAiFunctionViaFlowiseCopyCall,
    OpenAiFunctionBeforeChangeCall: _openAiFunctionBeforeChangeCall,
    OpenAiInspireMeCall: _openAiInspireMeCall,
    StartLearningJourneyCall: _startLearningJourneyCall,
    OpenAiFunctionSingleItemBackupCall: _openAiFunctionSingleItemBackupCall,
    DalleImageGenerationCall: _dalleImageGenerationCall,
    ReflectionExcersisesNotUsedNotDeleteCall:
      _reflectionExcersisesNotUsedNotDeleteCall,
    LearningActivityCall: _learningActivityCall,
    CallLearnCardChatCall: _callLearnCardChatCall,
    CloudinaryPresetCreateCall: _cloudinaryPresetCreateCall,
    ISPDataLookupCall: _iSPDataLookupCall,
    NewGetLiveStreamIDCall: _newGetLiveStreamIDCall,
    NewGetPastLiveStreamCall: _newGetPastLiveStreamCall,
    GetTopicsCall: _getTopicsCall,
    GetISPDataCall: _getISPDataCall,
    GetISPDataCopyCall: _getISPDataCopyCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
