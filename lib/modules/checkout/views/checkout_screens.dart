part of '../checkout.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final formatCurrency = NumberFormat.currency(symbol: "Rp. ");
  final CartController _cartController = Get.put(CartController());
  final CheckoutController _checkoutController = Get.put(CheckoutController());
  bool isDiscount = false;

  var total = 0.0;
  var discount = 0.0;

  int? _value = 0;
  List<Products> prod = [];

  String paymentMethod = 'custom_pay_1';

  List<String> listOfPayments = [
    'custom_pay_1',
    'custom_pay_2',
    'custom_pay_3',
    'custom_pay_4'
  ];

  @override
  void initState() {
    super.initState();
   
    total = _cartController.totalPrice2.value;
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return primaryC;
      }
      return primaryC;
    }

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub Total :",
                        style: draculaText.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                        formatCurrency.format(double.parse(
                            _cartController.totalPrice2.toString())),
                        style: draculaText.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              isDiscount
                  ? Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Discount :",
                              style: draculaText.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("- " + formatCurrency.format(discount),
                              style: draculaText.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total :",
                        style: draculaText.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(formatCurrency.format(double.parse(total.toString())),
                        style: draculaText.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              DividerSeparator(color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isDiscount,
                        onChanged: (bool? value) {
                          if (value == true) {
                            discount =
                                _cartController.totalPrice2.value * 10 / 100;
                            total = total -
                                (_cartController.totalPrice2.value * 10 / 100);
                          } else {
                            total = _cartController.totalPrice2.value;
                          }
                          setState(() {
                            isDiscount = value!;
                          });
                        },
                      ),
                      Text("Discount 10%",
                          style: draculaText.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: listOfPayments.map((e) {
                    int idx = listOfPayments.indexOf(e);
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        selectedColor: primaryC,
                        backgroundColor: Color(0xFFbdc3c7),
                        labelStyle: secondaryText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        selected: _value == idx,
                        onSelected: (bool selected) {
                          if (selected) {
                            setState(() {
                              paymentMethod = e;
                              _value = selected ? idx : null;
                            });
                          }
                        },
                        label: Text(
                            e == 'custom_pay_1'
                                ? 'Debit Mandiri'
                                : e == 'custom_pay_2'
                                    ? 'QRIS'
                                    : e == 'custom_pay_3' 
                                    ? 'Free' : "Cash",
                            style: secondaryText),
                      ),
                    );
                  }).toList(),
                ),
              ),
              TextButton(
                onPressed: () {
                  prod.addAll(_cartController.cart.map((element) => Products(productId: element.id, variationId: element.variationId, quantity: element.quantity, unitPrice: element.price.toStringAsFixed(4))));

                  final checkout = Checkout(
                    sells: [
                      Sells(
                      locationId: 1, 
                      contactId: 1, 
                      transactionDate: DateTime.now().toString().split('.')[0], 
                      discountAmount: isDiscount ? 10 : 0, 
                      products: prod, 
                      payments: [Payments(amount: total.toStringAsFixed(4), method: paymentMethod)]
                    )]
                  );
                  _checkoutController.createSell(checkout);

                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: primaryC,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Center(
                      child: Text("Save & Print",
                          style: whiteText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteC,
          leading: Container(
              margin: EdgeInsets.only(left: 20),
              child: Center(
                child: Icon(Icons.document_scanner, color: primaryC, size: 26),
              )),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Icon(Icons.keyboard_arrow_down, color: primaryC, size: 35))
          ],
        ),
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text("CHEKOUT",
                    style: draculaText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              SizedBox(height: 20),
              DividerSeparator(color: silverC),
              Flexible(
                child: ListView(
                    children: _cartController.cart
                        .map((element) => _buildCardProduct(element))
                        .toList()),
              ),
            ],
          ),
        )));
  }

  Widget _buildCardProduct(Cart cart) => Column(
        children: [
          ListTile(
              title: Text(cart.name + " " + cart.variation,
                  style: blackText.copyWith(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  formatCurrency.format(cart.price) +
                      " X " +
                      cart.quantity.toString(),
                  style: blackText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              trailing: Text(
                formatCurrency.format(cart.totalPrice),
                style: blackText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16),
              )),
          DividerSeparator(color: silverC),
        ],
      );
}
