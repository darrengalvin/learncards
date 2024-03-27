import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cloudinary_uploader_model.dart';
export 'cloudinary_uploader_model.dart';

class CloudinaryUploaderWidget extends StatefulWidget {
  const CloudinaryUploaderWidget({
    super.key,
    required this.presetId,
  });

  final String? presetId;

  @override
  State<CloudinaryUploaderWidget> createState() =>
      _CloudinaryUploaderWidgetState();
}

class _CloudinaryUploaderWidgetState extends State<CloudinaryUploaderWidget> {
  late CloudinaryUploaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CloudinaryUploaderModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 800.0,
          maxHeight: 600.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowWebView(
              content:
                  '<html>       <body>       <!-- Cloudinary Upload Button -->       <button id=\"upload_widget\" class=\"cloudinary-button\">Upload files</button>              <!-- Cloudinary Widget Script -->       <script src=\"https://upload-widget.cloudinary.com/global/all.js\" type=\"text/javascript\"></script>          <script type=\"text/javascript\">         var myWidget = cloudinary.createUploadWidget({         cloudName: \'hzxyensd5\',          uploadPreset: \'${widget.presetId}\',         // Add other widget configurations here if needed       }, (error, result) => {            if (!error && result && result.event === \"success\") {              console.log(\'Done! Here is the image info: \', result.info);              // You can add additional JavaScript here to handle the uploaded image           }       });        // Event listener for the upload button       document.getElementById(\"upload_widget\").addEventListener(\"click\", function(){           myWidget.open();       }, false);       </script>       </body>       </html>',
              height: 600.0,
              verticalScroll: false,
              horizontalScroll: false,
              html: true,
            ),
          ],
        ),
      ),
    );
  }
}
