import 'package:flutter/material.dart';
import 'package:sat/feature_box.dart';
import 'package:sat/pallete.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';

  @override
  void initState() {
    super.initState();
    initSpeechtoText();
  }

  Future<void> initSpeechtoText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sat Assistant'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withAlpha(100),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            //chat bobule

            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 40.0)
                  .copyWith(top: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Pallete.borderColor,
                ),
              ),
              child: const Text(
                'Good morning, What task Can I perform for you?',
                style: TextStyle(
                  fontFamily: 'Cera',
                  color: Pallete.borderColor,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10.0, left: 22.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Here are a few suggestions',
                style: TextStyle(
                  fontFamily: 'Cera',
                  fontWeight: FontWeight.bold,
                  color: Pallete.borderColor,
                  fontSize: 18,
                ),
              ),
            ),
            //features list
            const Column(
              children: [
                FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: 'ChatGPT',
                    descriptionText:
                        'A smarter way to stay orgainzed and informed with ChatGPT'),
                FeatureBox(
                    color: Pallete.secondSuggestionBoxColor,
                    headerText: 'Dall-E',
                    descriptionText:
                        'Get inspored and stay creative with your assisant powered by Dall-E'),
                FeatureBox(
                    color: Pallete.thirdSuggestionBoxColor,
                    headerText: 'Smart Voice Assistant',
                    descriptionText:
                        'Get the best of both worlds with smart voice assistant powered by ChatGPT and Dall-E'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(200),
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await stopListening();
          } else {
            initSpeechToText();
          }
        },
        child: Icon(Icons.mic),
        shape: const CircleBorder(),
      ),
    );
  }
}
