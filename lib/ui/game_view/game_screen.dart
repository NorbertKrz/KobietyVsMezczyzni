import 'dart:async';
import 'dart:math';
import 'package:animated_background/animated_background.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gender_fight/routes/app_router.dart';
import 'package:gender_fight/ui/game_view/widgets/current_watchword.dart';
import 'package:gender_fight/ui/game_view/widgets/game_buttons.dart';
import 'package:gender_fight/ui/game_view/widgets/men_ready_text.dart';
import 'package:gender_fight/ui/game_view/widgets/top_bar.dart';
import 'package:gender_fight/ui/game_view/widgets/women_ready_text.dart';
import 'package:gender_fight/ui/global/background/background_circles.dart';
import 'package:gender_fight/ui/global/buttons/animated_elevated_button.dart';
import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:gender_fight/words_list/men_words_list.dart';
import 'package:gender_fight/words_list/women_words_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rive/rive.dart' as rive;

const riveFile = 'assets/animations/hourglass.riv';

@RoutePage()
class GameScreen extends StatefulWidget {
  final bool isMenTurn;
  const GameScreen({Key? key, required this.isMenTurn}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  int menScore = 0;
  int womenScore = 0;
  int roundTime = 75;
  int timerSeconds = 76;
  Timer countdownTimer = Timer(const Duration(seconds: 76), () {});
  String currentWord = '';
  bool isMenTurn = true;
  List<String> menWords = [];
  List<String> womenWords = [];
  Random random = Random();
  rive.Artboard? _artboard;
  rive.RiveAnimationController _animationController =
      rive.SimpleAnimation('Example');
  final AudioPlayer _audioPlayerButtons = AudioPlayer();
  final AudioPlayer _audioPlayerCountdown = AudioPlayer();
  bool countdownHasPlayedSound = false;
  String countdown = "audios/countdown.mp3";
  String rightAnswer = "audios/rightAnswer.mp3";
  String wrongAnswer = "audios/wrongAnswer.mp3";
  String start = "audios/start.mp3";
  String click = "audios/click.mp3";

  @override
  void initState() {
    super.initState();
    countdownTimer.cancel();
    menWords.addAll(hairsWordsList);
    menWords.addAll(generalListWomen);

    womenWords.addAll(technologyList);
    womenWords.addAll(generalListMen);

    isMenTurn = widget.isMenTurn;
    currentWord = getNextWord();
  }

  @override
  void dispose() {
    _animationController.dispose();
    countdownTimer.cancel();
    _audioPlayerButtons.dispose();
    _audioPlayerCountdown.dispose();
    super.dispose();
  }

  Future<void> _playSound(String path) async {
    await _audioPlayerButtons.play(AssetSource(path));
  }

  Future<void> _playSoundWithFadeIn(String path) async {
    await _audioPlayerCountdown.setVolume(0.0);
    await _audioPlayerCountdown.play(AssetSource(path));

    double volume = 0.0;
    double step = 0.1;
    int interval = 500;

    Timer.periodic(Duration(milliseconds: interval), (timer) {
      if (volume < 0.7) {
        volume += step;
        _audioPlayerCountdown.setVolume(volume.clamp(0.0, 0.7));
      } else {
        timer.cancel();
      }
    });
    countdownHasPlayedSound = true;
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    if (timerSeconds <= 11 && !countdownHasPlayedSound) {
      _playSoundWithFadeIn(countdown);
    }
    return PopScope(
      canPop: !countdownTimer.isActive && menScore == 0 && womenScore == 0,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }

        final NavigatorState navigator = Navigator.of(context);
        final bool? shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Czy na pewno chcesz zakończyć turę?',
              style: GoogleFonts.poppins(
                  color: kGreyColor, fontWeight: FontWeight.w700, fontSize: 17),
            ),
            actions: <Widget>[
              AnimatedButton(
                height: 60,
                width: 80,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                color: kLightGreen,
                child: const Text(
                  'Nie',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0XFFFFFFFF),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              AnimatedButton(
                height: 60,
                width: 80,
                onPressed: () {
                  Navigator.of(context).pop(true);
                  AutoRouter.of(context).push(const HomeRoute());
                },
                color: kRed,
                child: const Text(
                  'Tak',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0XFFFFFFFF),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        );
        if (shouldPop ?? false) {
          navigator.pop();
        }
      },
      child: Scaffold(
          backgroundColor:
              isMenTurn ? menGameGradient.first : womenGameGradient.first,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: isMenTurn
                      ? LinearGradient(
                          colors: menGameGradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.clamp)
                      : LinearGradient(
                          colors: womenGameGradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.clamp),
                ),
                child: Stack(
                  children: [
                    const BackgroundCircles(),
                    AnimatedBackground(
                        behaviour: RandomParticleBehaviour(
                          options: const ParticleOptions(
                            spawnMaxRadius: 10,
                            spawnMinSpeed: 5,
                            particleCount: 18,
                            spawnMaxSpeed: 15,
                            minOpacity: 0.1,
                            opacityChangeRate: 0.5,
                            spawnOpacity: 0.4,
                            baseColor: Color.fromARGB(69, 255, 255, 255),
                          ),
                        ),
                        vsync: this,
                        child: Column(children: [
                          Column(
                            children: [
                              TopBar(
                                womenScore: womenScore,
                                menScore: menScore,
                                isMenTurn: isMenTurn,
                              ),
                            ],
                          ),
                          Expanded(
                            // GAME VIEW
                            child: countdownTimer.isActive
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height <
                                                    600
                                                ? 0
                                                : 30,
                                      ),
                                      CurrentWatchword(
                                          currentWord: currentWord),
                                      _artboard != null
                                          ? Expanded(
                                              child: Stack(
                                                alignment: Alignment.topCenter,
                                                children: [
                                                  Visibility(
                                                    visible: timerSeconds <=
                                                        roundTime,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8.0),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        '$timerSeconds',
                                                        style: TextStyle(
                                                            shadows: <Shadow>[
                                                              Shadow(
                                                                offset:
                                                                    const Offset(
                                                                        1, 1),
                                                                blurRadius: 4.0,
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                            ],
                                                            fontSize: 46,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: timerSeconds <=
                                                                    5
                                                                ? const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    226,
                                                                    44,
                                                                    31)
                                                                : timerSeconds <=
                                                                        15
                                                                    ? const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        255,
                                                                        123,
                                                                        0)
                                                                    : const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        48,
                                                                        48,
                                                                        48)),
                                                      ),
                                                    ),
                                                  ),
                                                  rive.Rive(
                                                    artboard: _artboard!,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      GameButtons(
                                        cocorrectAnswerFnc: correctAnswer,
                                        skipWordFnc: skipWord,
                                      )
                                    ],
                                  )
                                // READY VIEW
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: isMenTurn
                                              ? MenReadyText()
                                              : WomenReadyText()),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text(
                                            'Jeżeli tak, kliknij poniższy przycisk, aby rozpocząć turę.',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: kTextColor,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: AnimatedButton(
                                            height: 100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            onPressed: () {
                                              _playSound(start).then(
                                                  (value) => startTimer());
                                            },
                                            color: isMenTurn
                                                ? kMenButton
                                                : kWomenButton,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'START',
                                                style: GoogleFonts.poppins(
                                                    shadows: [
                                                      const Shadow(
                                                        color: Color.fromARGB(
                                                            255, 32, 32, 32),
                                                        blurRadius: 2.0,
                                                        offset:
                                                            Offset(2.0, 2.0),
                                                      ),
                                                    ],
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    fontSize: 35,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer()
                                    ],
                                  ),
                          )
                        ])),
                  ],
                )),
          )),
    );
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFile);
    rive.RiveFile rFile = rive.RiveFile.import(bytes);

    setState(() => _artboard = rFile.mainArtboard
      ..addController(_animationController = rive.SimpleAnimation('Example')));
  }

  String getNextWord() {
    if (isMenTurn) {
      int randomIndex = random.nextInt(menWords.length);
      return menWords.isNotEmpty
          ? menWords.removeAt(randomIndex)
          : 'Brak więcej słów!';
    } else {
      int randomIndex = random.nextInt(womenWords.length);
      return womenWords.isNotEmpty
          ? womenWords.removeAt(randomIndex)
          : 'Brak więcej słów!';
    }
  }

  startTimer() {
    currentWord = getNextWord();
    _loadRiveFile();
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timerSeconds--;
      });
      if (timerSeconds <= 0) {
        endTurn();
      }
    });
  }

  endTurn() {
    countdownTimer.cancel();
    setState(() {
      isMenTurn = !isMenTurn;
      timerSeconds = roundTime;
      countdownHasPlayedSound = false;
    });
  }

  correctAnswer() {
    setState(() {
      if (isMenTurn) {
        menScore++;
      } else {
        womenScore++;
      }
      currentWord = getNextWord();
    });
    _playSound(rightAnswer);
  }

  skipWord() {
    setState(() {
      if (isMenTurn) {
        menScore--;
      } else {
        womenScore--;
      }
      currentWord = getNextWord();
    });
    _playSound(wrongAnswer);
  }
}
