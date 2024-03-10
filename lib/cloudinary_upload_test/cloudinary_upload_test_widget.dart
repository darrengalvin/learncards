import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'cloudinary_upload_test_model.dart';
export 'cloudinary_upload_test_model.dart';

class CloudinaryUploadTestWidget extends StatefulWidget {
  const CloudinaryUploadTestWidget({
    super.key,
    required this.presetId,
  });

  final String? presetId;

  @override
  State<CloudinaryUploadTestWidget> createState() =>
      _CloudinaryUploadTestWidgetState();
}

class _CloudinaryUploadTestWidgetState
    extends State<CloudinaryUploadTestWidget> {
  late CloudinaryUploadTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CloudinaryUploadTestModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'cloudinaryUploadTest'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'cloudinaryUploadTest',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 0.0, 12.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 5.0,
                          borderWidth: 1.0,
                          buttonSize: 55.0,
                          fillColor: FlutterFlowTheme.of(context).accent1,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'CLOUDINARY_UPLOAD_TEST_arrow_back_ICN_ON');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.safePop();
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FlutterFlowWebView(
                      content:
                          '<html>       <body>       <!-- Cloudinary Upload Button -->       <button id=\"upload_widget\" class=\"cloudinary-button\">Upload files</button>              <!-- Cloudinary Widget Script -->       <script src=\"https://upload-widget.cloudinary.com/global/all.js\" type=\"text/javascript\"></script>          <script type=\"text/javascript\">         var myWidget = cloudinary.createUploadWidget({         cloudName: \'hzxyensd5\',          uploadPreset: \'${widget.presetId}\',         // Add other widget configurations here if needed       }, (error, result) => {            if (!error && result && result.event === \"success\") {              console.log(\'Done! Here is the image info: \', result.info);              // You can add additional JavaScript here to handle the uploaded image           }       });        // Event listener for the upload button       document.getElementById(\"upload_widget\").addEventListener(\"click\", function(){           myWidget.open();       }, false);       </script>       </body>       </html>',
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      verticalScroll: false,
                      horizontalScroll: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
