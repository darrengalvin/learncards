import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'updates_model.dart';
export 'updates_model.dart';

class UpdatesWidget extends StatefulWidget {
  const UpdatesWidget({super.key});

  @override
  State<UpdatesWidget> createState() => _UpdatesWidgetState();
}

class _UpdatesWidgetState extends State<UpdatesWidget> {
  late UpdatesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdatesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
