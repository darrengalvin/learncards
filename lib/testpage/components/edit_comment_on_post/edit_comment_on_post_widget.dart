import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_comment_on_post_model.dart';
export 'edit_comment_on_post_model.dart';

class EditCommentOnPostWidget extends StatefulWidget {
  const EditCommentOnPostWidget({
    super.key,
    this.postidcomments,
    this.notificationsdoc,
    this.commentposter,
    this.postid,
    this.postiddocs,
  });

  final DocumentReference? postidcomments;
  final NotificationsRecord? notificationsdoc;
  final SocialCommentsRecord? commentposter;
  final DocumentReference? postid;
  final SocialpostsRecord? postiddocs;

  @override
  State<EditCommentOnPostWidget> createState() =>
      _EditCommentOnPostWidgetState();
}

class _EditCommentOnPostWidgetState extends State<EditCommentOnPostWidget> {
  late EditCommentOnPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCommentOnPostModel());

    _model.textController ??=
        TextEditingController(text: widget.commentposter?.comment);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 190.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x162D3A21),
              offset: Offset(0.0, 3.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 50.0,
                      height: 50.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        currentUserPhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Write something...',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Outfit',
                                color: const Color(0xFF57636C),
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Outfit'),
                              ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 8.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF101213),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Outfit'),
                            ),
                        maxLines: 3,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 12.0,
              thickness: 2.0,
              color: Color(0xFFF1F4F8),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('EDIT_COMMENT_ON_POST_EDIT_BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');

                      await widget.commentposter!.reference
                          .update(createSocialCommentsRecordData(
                        comment: _model.textController.text,
                      ));
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    },
                    text: 'Edit',
                    options: FFButtonOptions(
                      width: 90.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF4B39EF),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Outfit'),
                              ),
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
