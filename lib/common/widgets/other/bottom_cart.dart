part of '../../common.dart';

class BottomCart extends StatefulWidget {
  const BottomCart({Key? key}) : super(key: key);

  @override
  State<BottomCart> createState() => _BottomCartState();
}

class _BottomCartState extends State<BottomCart> {
  final formatCurrency = NumberFormat.currency(symbol: "Rp. ");
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: 60,
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.only(left: 20, top: 0),
          decoration: BoxDecoration(
            color: whiteC,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child:
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                Expanded(
                    child:  Text(
                        formatCurrency.format(
                            double.parse(_cartController.totalPrice2.toString())),
                        style: draculaText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16))),
                SizedBox(width: 30),
                _cartController.cart.isNotEmpty ? 
                TextButton(
                  onPressed: () {
                    Get.toNamed("/cart");
                  },
                  child:Center(child: Icon(Icons.keyboard_arrow_up, color: draculaC)),
                ) : Container(),
                _cartController.cart.isNotEmpty ? 
                Expanded(
                  child: SizedBox(
                    width: 200,
                    height: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed('/checkout');
                        },
                        child: Container(
                            height: double.infinity,
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                            border: Border.all(color: primaryC),

                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Center(
                                child: Obx(() => Text(
                                    "Checkout (${_cartController.totalQuantity2})",
                                    style: primaryText.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)))))),
                  ),
                ) : Container()
              ])),
    ));
  }
}
