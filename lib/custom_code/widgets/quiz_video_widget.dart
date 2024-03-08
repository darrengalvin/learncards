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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizVideoWidget extends StatefulWidget {
  final String blockId;
  final double? width;
  final double? height;

  final String tileId; // Assuming you have this data available
  final String userId; // Assuming you have this data available

  const QuizVideoWidget({
    Key? key,
    required this.blockId,
    required this.tileId, // Make sure to initialize this in the constructor
    required this.userId, // Make sure to initialize this in the constructor

    this.width,
    this.height,
  }) : super(key: key);

  @override
  _QuizVideoWidgetState createState() => _QuizVideoWidgetState();
}

class _QuizVideoWidgetState extends State<QuizVideoWidget> {
  String? selectedOption;
  bool? isCorrect;
  String? question;
  List<String>? options;
  String? correctAnswer;
  bool dataFetched = false;
  bool isVisible = true;
  final AudioPlayer audioPlayer = AudioPlayer();

  String? userId; // Corrected capitalization
  String? tileId; // Corrected capitalization
  String? answerStatus; // Removed the incorrect initialization

  @override
  void initState() {
    super.initState();
    _fetchQuizData();
  }

  Future<void> _fetchQuizData() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('quiz')
        .where('tile_block_id', isEqualTo: widget.blockId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      setState(() {
        question = doc.get('question');
        options = List<String>.from(doc.get('possibleAnswers'));
        correctAnswer = doc.get('correctAnswer');
        dataFetched = true;
      });
    } else {
      setState(() {
        dataFetched = true;
      });
    }
  }

  Future<void> _playSound(bool correct) async {
    final String correctSoundUrl =
        'https://res.cloudinary.com/dplpckpbm/video/upload/v1698955815/goappy/correct-choice-43861_cfbeqw.mp3';
    final String incorrectSoundUrl =
        'https://res.cloudinary.com/dplpckpbm/video/upload/v1698955815/goappy/negative_beeps-6008_lxk0xg.mp3';
    await audioPlayer.setSource(
        correct ? UrlSource(correctSoundUrl) : UrlSource(incorrectSoundUrl));
    await audioPlayer.resume(); // This resumes the audio if it was paused.
  }

  Future<void> _recordAnswer(String option, bool correct) async {
    await FirebaseFirestore.instance.collection('quiz_answers').add({
      'blockId': widget.blockId,
      'tileId': widget.tileId, // Using the tileId from the widget
      'userId': widget.userId, // Using the userId from the widget
      'selectedOption': option,
      'isCorrect': correct,
      'answeredAt': Timestamp.now(),
      'answerStatus': correct
          ? 'correct'
          : 'incorrect', // This will be a string 'correct' or 'incorrect'
    });
  }

  void _checkAnswer(String option) {
    bool correct = option == correctAnswer;
    _playSound(correct); // Play sound
    _recordAnswer(option, correct); // Record the answer

    setState(() {
      selectedOption = option;
      isCorrect = correct;
      isVisible = false; // Hide the quiz
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!dataFetched) {
      return const CircularProgressIndicator();
    }

    if (question == null || options == null || correctAnswer == null) {
      return Text('Cannot match \'${widget.blockId}\' with tile_block_id');
    }

    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              question!,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 75.0), // Add bottom padding here
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align items to the start
                    children: [
                      for (var option in options!)
                        GestureDetector(
                          onTap: () {
                            _checkAnswer(option);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: selectedOption == option
                                        ? isCorrect!
                                            ? Colors.green
                                            : Colors.red
                                        : Colors.white,
                                    border: Border.all(
                                      color: selectedOption == option
                                          ? Colors.transparent
                                          : Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: selectedOption == option
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (selectedOption != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  isCorrect! ? 'Correct!' : 'Incorrect',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: isCorrect! ? Colors.green : Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Always dispose of your controllers when the widget is removed from the tree
    audioPlayer.dispose();
    super.dispose();
  }
}
