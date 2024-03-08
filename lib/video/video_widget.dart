import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'video_model.dart';
export 'video_model.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'VIDEO'});
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
        title: 'VIDEO',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 400.0,
                        height: 400.0,
                        child: custom_widgets.VideoWithPlayAndEnd(
                          width: 400.0,
                          height: 400.0,
                          videoUrl:
                              'https://res.cloudinary.com/dplpckpbm/video/upload/v1675856918/Tony%20Morris%20International/24%20Reviews/20.6_success_stories_PERFECT_vrzxgj.mp4',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  SizedBox(
                    width: 400.0,
                    height: 600.0,
                    child: custom_widgets.VideoWithPlay(
                      width: 400.0,
                      height: 600.0,
                      videoUrl:
                          'https://res.cloudinary.com/dplpckpbm/video/upload/v1675856918/Tony%20Morris%20International/24%20Reviews/20.6_success_stories_PERFECT_vrzxgj.mp4',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
