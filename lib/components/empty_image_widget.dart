import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_image_model.dart';
export 'empty_image_model.dart';

class EmptyImageWidget extends StatefulWidget {
  const EmptyImageWidget({
    super.key,
    this.action,
    this.blockDoc,
  });

  final Future Function()? action;
  final TileBlocksRecord? blockDoc;

  @override
  State<EmptyImageWidget> createState() => _EmptyImageWidgetState();
}

class _EmptyImageWidgetState extends State<EmptyImageWidget> {
  late EmptyImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyImageModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EMPTY_IMAGE_emptyImage_ON_INIT_STATE');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).btnBk,
            width: 1.0,
          ),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('EMPTY_IMAGE_Container_zz4eelf4_ON_TAP');
            logFirebaseEvent('Container_upload_media_to_firebase');
            final selectedMedia = await selectMedia(
              mediaSource: MediaSource.photoGallery,
              multiImage: false,
            );
            if (selectedMedia != null &&
                selectedMedia
                    .every((m) => validateFileFormat(m.storagePath, context))) {
              setState(() => _model.isDataUploading1 = true);
              var selectedUploadedFiles = <FFUploadedFile>[];

              var downloadUrls = <String>[];
              try {
                showUploadMessage(
                  context,
                  'Uploading file...',
                  showLoading: true,
                );
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
                    (m) async => await uploadData(m.storagePath, m.bytes),
                  ),
                ))
                    .where((u) => u != null)
                    .map((u) => u!)
                    .toList();
              } finally {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                _model.isDataUploading1 = false;
              }
              if (selectedUploadedFiles.length == selectedMedia.length &&
                  downloadUrls.length == selectedMedia.length) {
                setState(() {
                  _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                  _model.uploadedFileUrl1 = downloadUrls.first;
                });
                showUploadMessage(context, 'Success!');
              } else {
                setState(() {});
                showUploadMessage(context, 'Failed to upload data');
                return;
              }
            }

            logFirebaseEvent('Container_backend_call');

            await widget.blockDoc!.reference.update({
              ...mapToFirestore(
                {
                  'image_gallery':
                      FieldValue.arrayUnion([_model.uploadedFileUrl1]),
                },
              ),
            });
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0x121AADF9),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).btnBk,
                    borderRadius: 8.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      color: FlutterFlowTheme.of(context).customColor7,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'EMPTY_IMAGE_add_a_photo_outlined_ICN_ON_');
                      logFirebaseEvent('IconButton_upload_media_to_firebase');
                      final selectedMedia = await selectMedia(
                        mediaSource: MediaSource.photoGallery,
                        multiImage: false,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        setState(() => _model.isDataUploading2 = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
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
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading2 = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          setState(() {
                            _model.uploadedLocalFile2 =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl2 = downloadUrls.first;
                          });
                          showUploadMessage(context, 'Success!');
                        } else {
                          setState(() {});
                          showUploadMessage(context, 'Failed to upload data');
                          return;
                        }
                      }

                      logFirebaseEvent('IconButton_backend_call');

                      await widget.blockDoc!.reference.update({
                        ...mapToFirestore(
                          {
                            'image_gallery': FieldValue.arrayUnion(
                                [_model.uploadedFileUrl1]),
                          },
                        ),
                      });
                    },
                  ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Text(
                    'Add an Image',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
