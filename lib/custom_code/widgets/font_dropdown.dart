// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class FontDropdown extends StatefulWidget {
  const FontDropdown({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _FontDropdownState createState() => _FontDropdownState();
}

class _FontDropdownState extends State<FontDropdown> {
  String selectedFont = 'Arial';
  double fontSize = 16.0;

  List<Map<String, dynamic>> fontOptions = [
    {'font': 'Arial', 'size': 16.0},
    {'font': 'Times New Roman', 'size': 18.0},
    {'font': 'Courier New', 'size': 20.0},
    // Add more font options here
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Selected Font: $selectedFont',
          style: TextStyle(fontFamily: selectedFont, fontSize: fontSize),
        ),
        SizedBox(height: 20.0),
        DropdownButtonFormField<Map<String, dynamic>>(
          value: fontOptions[0],
          onChanged: (value) {
            setState(() {
              selectedFont = value?['font'];
              fontSize = value?['size'];
            });
          },
          items: fontOptions.map((option) {
            return DropdownMenuItem<Map<String, dynamic>>(
              value: option,
              child: Row(
                children: [
                  Text(option['font']),
                  SizedBox(width: 10.0),
                  Text(
                    'Size: ${option['size']}',
                    style: TextStyle(fontSize: option['size']),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
