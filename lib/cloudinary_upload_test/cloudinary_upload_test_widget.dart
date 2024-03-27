import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
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
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CLOUDINARY_UPLOAD_TEST_BUTTON_BTN_ON_TAP');
                          logFirebaseEvent('Button_launch_u_r_l');
                          await launchURL(
                              'https://yourcaio.co.uk/cloudinary.html');
                        },
                        text: 'Button',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FlutterFlowWebView(
                      content:
                          '<!DOCTYPE html> <html lang=\"en\"> <head>     <meta charset=\"UTF-8\">     <title>Cloudinary Upload</title>     <script src=\"https://upload-widget.cloudinary.com/global/all.js\" type=\"text/javascript\"></script>     <script type=\"text/javascript\">     function showUploadWidget() {         cloudinary.openUploadWidget({             cloudName: \"dplpckpbm\",             uploadPreset: \"${widget.presetId}\",             sources: [                 \"local\", \"url\", \"camera\", \"image_search\",                 \"google_drive\", \"dropbox\", \"instagram\",                 \"facebook\", \"shutterstock\", \"getty\",                 \"istock\", \"unsplash\"             ],             googleApiKey: \"<image_search_google_api_key>\",             showAdvancedOptions: true,             cropping: true,             multiple: false,             defaultSource: \"local\",             styles: {                 palette: {                     window: \"#FFFFFF\",                     windowBorder: \"#90A0B3\",                     tabIcon: \"#0078FF\",                     menuIcons: \"#5A616A\",                     textDark: \"#000000\",                     textLight: \"#FFFFFF\",                     link: \"#0078FF\",                     action: \"#FF620C\",                     inactiveTabIcon: \"#0E2F5A\",                     error: \"#F44235\",                     inProgress: \"#0078FF\",                     complete: \"#20B832\",                     sourceBg: \"#E4EBF1\"                 },                 fonts: {                     default: { active: true }                 }             }         }, (err, info) => {             if (!err) {                 console.log(\"Upload Widget event - \", info);             }         });     }     </script> </head> <body>     <button id=\"upload_widget\" class=\"cloudinary-button\" onclick=\"showUploadWidget()\">Upload files</button> </body> </html>',
                      width: 600.0,
                      height: MediaQuery.sizeOf(context).height * 6.0,
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
