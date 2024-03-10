import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'column_image_component_model.dart';
export 'column_image_component_model.dart';

class ColumnImageComponentWidget extends StatefulWidget {
  const ColumnImageComponentWidget({
    super.key,
    required this.editmode,
    required this.imageHeight,
    required this.imageWidth,
    required this.blocksDoc,
  });

  final bool? editmode;
  final int? imageHeight;
  final int? imageWidth;
  final TileBlocksRecord? blocksDoc;

  @override
  State<ColumnImageComponentWidget> createState() =>
      _ColumnImageComponentWidgetState();
}

class _ColumnImageComponentWidgetState
    extends State<ColumnImageComponentWidget> {
  late ColumnImageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColumnImageComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: widget.imageWidth?.toDouble(),
                  height: widget.imageHeight?.toDouble(),
                  constraints: const BoxConstraints(
                    maxHeight: 600.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'COLUMN_IMAGE_COMPONENT_Image_ajc5pnas_ON');
                        logFirebaseEvent('Image_expand_image');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: FlutterFlowExpandedImageView(
                              image: Image.network(
                                widget.blocksDoc?.imageGallery.isEmpty
                                    ? 'https://media.australian.museum/media/dd/images/Rhinella_marina_Border_Ranges_NP.width-1200.a2aaf34.jpg'
                                    : widget.blocksDoc!.imageGallery.first,
                                fit: BoxFit.contain,
                              ),
                              allowRotation: false,
                              tag: widget.blocksDoc?.imageGallery.isEmpty
                                  ? 'https://media.australian.museum/media/dd/images/Rhinella_marina_Border_Ranges_NP.width-1200.a2aaf34.jpg'
                                  : widget.blocksDoc!.imageGallery.first,
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: widget.blocksDoc?.imageGallery.isEmpty
                            ? 'https://media.australian.museum/media/dd/images/Rhinella_marina_Border_Ranges_NP.width-1200.a2aaf34.jpg'
                            : widget.blocksDoc!.imageGallery.first,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.blocksDoc?.imageGallery.isEmpty
                                ? 'https://media.australian.museum/media/dd/images/Rhinella_marina_Border_Ranges_NP.width-1200.a2aaf34.jpg'
                                : widget.blocksDoc!.imageGallery.first,
                            width: widget.imageWidth?.toDouble(),
                            height: widget.imageHeight?.toDouble(),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 640.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
