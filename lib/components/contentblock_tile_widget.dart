import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contentblock_tile_model.dart';
export 'contentblock_tile_model.dart';

class ContentblockTileWidget extends StatefulWidget {
  const ContentblockTileWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final String? parameter1;
  final String? parameter2;
  final DocumentReference? parameter3;

  @override
  State<ContentblockTileWidget> createState() => _ContentblockTileWidgetState();
}

class _ContentblockTileWidgetState extends State<ContentblockTileWidget> {
  late ContentblockTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContentblockTileModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 3.0, 16.0, 3.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x411D2429),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.parameter1!,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF090F13),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Outfit'),
                                ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 8.0, 0.0),
                          child: AutoSizeText(
                            widget.parameter2!.maybeHandleOverflow(
                              maxChars: 70,
                              replacement: '…',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF7C8791),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Outfit'),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'CONTENTBLOCK_TILE_Icon_le6bntpl_ON_TAP');
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.black,
                      size: 27.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
