import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/right_pane/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon_widget.dart';
import 'package:flutter/material.dart';
import 'alitest_model.dart';
export 'alitest_model.dart';

class AlitestWidget extends StatefulWidget {
  const AlitestWidget({super.key});

  @override
  State<AlitestWidget> createState() => _AlitestWidgetState();
}

class _AlitestWidgetState extends State<AlitestWidget> {
  late AlitestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlitestModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'alitest'});
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
        title: 'alitest',
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
                children: [
                  wrapWithModel(
                    model: _model.aICOMMUNICATIONDeletesoonModel,
                    updateCallback: () => setState(() {}),
                    child: const AICOMMUNICATIONDeletesoonWidget(
                      askingQuestion: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
