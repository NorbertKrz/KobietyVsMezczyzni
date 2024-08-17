import 'package:animated_background/animated_background.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gender_fight/ui/global/styles/text_styles.dart';
import 'package:gender_fight/ui/vocabulary_view/widgets/animation_app_bar.dart';
import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:gender_fight/ui/vocabulary_view/widgets/popup_window.dart';
import 'package:gender_fight/payment_configurations.dart'
    as payment_configurations;

class VocabularyCategories {
  final String googlePayConfiguration;
  final String name;
  final String image;
  final String type;
  final double price;
  final int expressionsNumber;
  final Color color;
  final Color colorDarker;
  VocabularyCategories({
    required this.googlePayConfiguration,
    required this.name,
    required this.image,
    required this.type,
    required this.price,
    required this.expressionsNumber,
    required this.color,
    required this.colorDarker,
  });
}

@RoutePage()
class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({Key? key}) : super(key: key);

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen>
    with TickerProviderStateMixin {
  List<VocabularyCategories> items = [
    VocabularyCategories(
        googlePayConfiguration: payment_configurations.defaultGooglePay,
        name: 'Ogólne',
        type: 'Męskie',
        image: 'assets/images/man.png',
        price: 4.99,
        expressionsNumber: 100,
        color: kPastelBlue,
        colorDarker: kPastelBlueDarker),
    VocabularyCategories(
      googlePayConfiguration: payment_configurations.defaultGooglePay2,
      name: 'Ogólne',
      type: 'Damskie',
      image: 'assets/images/woman.png',
      price: 4.99,
      expressionsNumber: 100,
      color: kPastelViolet,
      colorDarker: kPastelVioletDarker,
    ),
    VocabularyCategories(
      googlePayConfiguration: '',
      name: 'Garderoba',
      type: 'Męskie',
      image: 'assets/images/hairdresser.png',
      price: 4.99,
      expressionsNumber: 100,
      color: kPastelYellow,
      colorDarker: kPastelYellowDarker,
    ),
    VocabularyCategories(
        googlePayConfiguration: '',
        name: 'Garderoba',
        type: 'Damskie',
        image: 'assets/images/hairdresser.png',
        price: 4.99,
        expressionsNumber: 100,
        color: kPastelOrange,
        colorDarker: kPastelOrangeDarker),
    VocabularyCategories(
        googlePayConfiguration: '',
        name: 'Sprzęt komputerowy',
        type: 'Męskie',
        image: 'assets/images/monitor.png',
        price: 4.99,
        expressionsNumber: 100,
        color: kPastelBeige,
        colorDarker: kPastelBeigeDarker),
    VocabularyCategories(
        googlePayConfiguration: '',
        name: 'Pielęgnacja skóry',
        type: 'Damskie',
        image: 'assets/images/cream.png',
        price: 4.99,
        expressionsNumber: 100,
        color: kPastelLime,
        colorDarker: kPastelLimeDarker),
    VocabularyCategories(
        googlePayConfiguration: '',
        name: 'Warsztat samochodowy',
        type: 'Męskie',
        image: 'assets/images/wrench.png',
        price: 4.99,
        expressionsNumber: 100,
        color: kPastelBlueD,
        colorDarker: kPastelBlueDDarker),
    VocabularyCategories(
        googlePayConfiguration: '',
        name: 'Technologia',
        type: 'Męskie',
        image: 'assets/images/hairdresser.png',
        price: 4.99,
        expressionsNumber: 100,
        color: kPastelGreen,
        colorDarker: kPastelGreenDarker),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: kVocabularyBackground,
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: mainViewGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp),
          ),
          width: double.maxFinite,
          child: AnimatedBackground(
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
            child: CustomScrollView(
              slivers: [
                const SliverPersistentHeader(
                  delegate: AnimationAppBar(),
                  pinned: true,
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return SizedBox(
                    height: 220,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          _showMyDialog(CategoryData(
                              googlePayConfiguration:
                                  items[index].googlePayConfiguration,
                              name: items[index].name,
                              image: items[index].image,
                              type: items[index].type,
                              price: items[index].price,
                              expressionsNumber:
                                  items[index].expressionsNumber));
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 180,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        elevation: 5,
                                        color: Colors.transparent,
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                backgroundBlendMode:
                                                    BlendMode.srcOver,
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    // Color(0xFFe84558),
                                                    // Color(0xFFf19099)
                                                    items[index].colorDarker,
                                                    items[index].color,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 17,
                                    left: 25,
                                  ),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 180,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items[index].type,
                                              style:
                                                  playStyleBoldWhite26CategoryType,
                                            ),
                                            Text(
                                              items[index].name,
                                              style:
                                                  playStyleBoldWhite26CategoryName,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Text(
                                              "4,99 zł",
                                              style: playStyle14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Image.asset(
                                  items[index].image,
                                  width: 120,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }, childCount: items.length))
              ],
            ),
          ),
        ));
  }

  Future<void> _showMyDialog(CategoryData categoryData) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PopupWindow(categoryData: categoryData);
      },
    );
  }
}
