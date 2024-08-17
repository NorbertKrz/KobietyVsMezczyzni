import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PopupWindow extends StatefulWidget {
  final CategoryData categoryData;
  const PopupWindow({
    super.key,
    required this.categoryData,
  });

  @override
  State<PopupWindow> createState() => _PopupWindowState();
}

class _PopupWindowState extends State<PopupWindow> {
  late GooglePayButton googlePayButton;

  @override
  void initState() {
    googlePayButton = GooglePayButton(
        paymentConfiguration: PaymentConfiguration.fromJsonString(
            widget.categoryData.googlePayConfiguration),
        onPaymentResult: (result) {
          print('REZULTAT: $result');
          if (result.isNotEmpty) {
            print('Przeszło');
          } else {
            print('Transakcja nie powiodła się');
          }
        },
        type: GooglePayButtonType.buy,
        width: RawGooglePayButton.minimumButtonWidth,
        loadingIndicator: const Center(
          child: CircularProgressIndicator(),
        ),
        paymentItems: const [
          PaymentItem(
              label: 'Ogólne',
              amount: '4.99',
              status: PaymentItemStatus.final_price),
        ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: const Color.fromARGB(255, 133, 133, 133),
          elevation: 40,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1, strokeAlign: -15),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          // elevation: 0,
          content: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 265,
                          child: Center(
                            child: Text(
                              "Zdjęcie",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ),
                        ),
                        Text(
                          "Typ: ${widget.categoryData.type}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Kategoria: ${widget.categoryData.name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Liczba wyrażeń: ${widget.categoryData.expressionsNumber}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Cena: ${widget.categoryData.price}zł",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  _confirmButtons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _confirmButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        googlePayButton,
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 100,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(42),
                backgroundColor: const Color.fromARGB(255, 136, 136, 136),
              ),
              child: const Text(
                "Anuluj",
              )),
        ),
      ],
    );
  }
}

class CategoryData {
  final String googlePayConfiguration;
  final String name;
  final String type;
  final String image;
  final double price;
  final int expressionsNumber;

  CategoryData({
    required this.googlePayConfiguration,
    required this.name,
    required this.image,
    required this.type,
    required this.price,
    required this.expressionsNumber,
  });
}
