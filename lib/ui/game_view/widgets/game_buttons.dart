import 'package:flutter/material.dart';
import 'package:gender_fight/ui/global/buttons/animated_elevated_button.dart';
import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:gender_fight/ui/global/styles/text_styles.dart';

class GameButtons extends StatefulWidget {
  final void Function() cocorrectAnswerFnc;
  final void Function() skipWordFnc;
  const GameButtons(
      {Key? key, required this.cocorrectAnswerFnc, required this.skipWordFnc})
      : super(key: key);

  @override
  State<GameButtons> createState() => _GameButtonsState();
}

class _GameButtonsState extends State<GameButtons> {
  bool isButtonDisabled = false;

  void handleClick(void Function() fnc) {
    if (!isButtonDisabled) {
      setState(() {
        isButtonDisabled = true;
      });

      fnc();

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          isButtonDisabled = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: AnimatedButton(
                height: 100,
                width: (MediaQuery.of(context).size.width - 100) / 2,
                onPressed: () {
                  isButtonDisabled ? null : handleClick(widget.skipWordFnc);
                },
                color: kBeige,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 4.0,
                          color: Color.fromARGB(255, 29, 29, 29),
                        ),
                      ],
                      Icons.next_plan_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text('Pomiń', style: playStyleBold16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: AnimatedButton(
                height: 100,
                width: (MediaQuery.of(context).size.width - 100) / 2,
                onPressed: () {
                  isButtonDisabled
                      ? null
                      : handleClick(widget.cocorrectAnswerFnc);
                },
                color: kLightGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 4.0,
                          color: Color.fromARGB(255, 29, 29, 29),
                        ),
                      ],
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text('Dobrze', style: playStyleBold16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
