import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'uploadimage_model.dart';
export 'uploadimage_model.dart';

class UploadimageWidget extends StatefulWidget {
  const UploadimageWidget({
    super.key,
    this.tileblock,
    this.tileblockref,
  });

  final TileblocksRecord? tileblock;
  final DocumentReference? tileblockref;

  @override
  State<UploadimageWidget> createState() => _UploadimageWidgetState();
}

class _UploadimageWidgetState extends State<UploadimageWidget> {
  late UploadimageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadimageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 400.0,
          ),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primaryBackground,
                FlutterFlowTheme.of(context).secondary
              ],
              stops: const [0.0, 1.0],
              begin: const AlignmentDirectional(0.0, -1.0),
              end: const AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).lineColor,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: FlutterFlowTheme.of(context).lineColor,
                            offset: const Offset(0.0, 1.0),
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primaryBackground,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          stops: const [0.0, 1.0],
                          begin: const AlignmentDirectional(0.0, -1.0),
                          end: const AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Upload Image',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'These is a beta uploader',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.more_vert,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        if ((_model.uploadedFileUrl == '') ||
                            (widget.tileblock?.image == null ||
                                widget.tileblock?.image == ''))
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'UPLOADIMAGE_COMP_Imageunset_ON_TAP');
                              logFirebaseEvent(
                                  'Imageunset_upload_media_to_firebase');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }

                              logFirebaseEvent('Imageunset_backend_call');

                              await widget.tileblock!.reference
                                  .update(createTileblocksRecordData(
                                image: _model.uploadedFileUrl,
                              ));
                            },
                            child: Image.asset(
                              'assets/images/red.png',
                              width: double.infinity,
                              height: 400.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (widget.tileblock?.image == null ||
                            widget.tileblock?.image == '')
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'UPLOADIMAGE_Imagejustuploaded_ON_TAP');
                              logFirebaseEvent(
                                  'Imagejustuploaded_update_component_state');
                              setState(() {
                                _model.showimageupload = true;
                              });
                            },
                            child: Image.network(
                              _model.uploadedFileUrl,
                              width: double.infinity,
                              height: 400.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
