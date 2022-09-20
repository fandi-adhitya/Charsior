part of '../cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController _cartController = Get.put(CartController());
  final formatCurrency = NumberFormat.currency(symbol: "Rp. ");
  int tempQuantity = 0;

  @override
  void initState() {
    super.initState();
    tempQuantity = 0;
  }

  void updateQuantity(Cart cart) {
    final formatCurrency = NumberFormat.currency(symbol: "Rp. ");

    tempQuantity = cart.quantity;

    showModalBottomSheet(
        // barrierColor: Colors.black.withOpacity(0.2),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 140,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter state) {
                return Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cart.name + ' - ' + cart.variation,
                                  style: draculaText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    tempQuantity < 2
                                        ? state(() => tempQuantity = 1)
                                        : state(() => tempQuantity--);
                                  },
                                  child: Container(
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: secondaryC,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: primaryC,
                                      ),
                                    ),
                                  )),
                              SizedBox(width: 5),
                              Text(tempQuantity.toString()),
                              SizedBox(width: 5),
                              TextButton(
                                  onPressed: () {
                                    state(() {
                                      tempQuantity++;
                                    });
                                  },
                                  child: Container(
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: primaryC,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: whiteC,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            _cartController.updateCart(cart, tempQuantity);
                            _cartController.refresh();
                            Navigator.pop(context);
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: primaryC),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Update",
                                    style: whiteText.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 20),
                                  Icon(
                                    Icons.update,
                                    color: whiteC,
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                );
              }));
        });

    // Get.bottomSheet(
    //   Container(
    //     height: 140,
    //     margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    //     padding: EdgeInsets.all(10.0),
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.all(Radius.circular(30.0))),
    //     child: Center(
    //       child: Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(cart.name,
    //                       style: draculaText.copyWith(
    //                           fontWeight: FontWeight.bold, fontSize: 18)),
    //                   Text(
    //                       formatCurrency
    //                           .format(int.parse(cart.totalPrice.toString())),
    //                       style: primaryText.copyWith(
    //                           fontWeight: FontWeight.bold, fontSize: 16)),
    //                 ],
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   TextButton(
    //                       onPressed: () {
    //                         // _cartController.subQuantity();
    //                       },
    //                       child: Container(
    //                         height: 25,
    //                         decoration: BoxDecoration(
    //                             color: secondaryC,
    //                             borderRadius:
    //                                 BorderRadius.all(Radius.circular(5))),
    //                         child: Center(
    //                           child: Icon(
    //                             Icons.remove,
    //                             color: primaryC,
    //                           ),
    //                         ),
    //                       )),
    //                   SizedBox(width: 10),
    //                   Obx(()=> Text(_cartController.tempQuantity.toString())),
    //                   SizedBox(width: 10),
    //                   TextButton(
    //                       onPressed: () {
    //                         _cartController.addQuantityFromUpdate(cart);
    //                         // update();
    //                       },
    //                       child: Container(
    //                         height: 25,
    //                         decoration: BoxDecoration(
    //                             color: primaryC,
    //                             borderRadius:
    //                                 BorderRadius.all(Radius.circular(5))),
    //                         child: Center(
    //                           child: Icon(
    //                             Icons.add,
    //                             color: whiteC,
    //                           ),
    //                         ),
    //                       )),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           TextButton(
    //               onPressed: () {},
    //               child: Container(
    //                 // width: MediaQuery.of(context).size.width,
    //                 height: 50,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.all(Radius.circular(30)),
    //                     color: primaryC),
    //                 child: Center(
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Text(
    //                         "Update",
    //                         style: whiteText.copyWith(
    //                             fontSize: 16, fontWeight: FontWeight.bold),
    //                       ),
    //                       SizedBox(width: 20),
    //                       Icon(
    //                         Icons.update,
    //                         color: whiteC,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               )),
    //         ],
    //       ),
    //     )));
  }

  void addQuantityFromUpdate(Cart cart) {
    setState(() {
      tempQuantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: whiteC,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: whiteC,
            leading: Container(
                margin: EdgeInsets.only(left: 20),
                child: Center(
                  child: Icon(Icons.shopping_bag_outlined,
                      color: primaryC, size: 26),
                )),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Icon(Icons.keyboard_arrow_down,
                      color: primaryC, size: 35))
            ],
          ),
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total :",style: draculaText.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(formatCurrency.format(double.parse(_cartController.totalPrice2.toString())),style: draculaText.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Obx(() => _cartController.cart.isNotEmpty ? TextButton(
                  onPressed: () {
                    Get.toNamed('/checkout');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        // color: primaryC,
                        border: Border.all(color: primaryC),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Center(
                        child: Text("CHECKOUT",
                            style: primaryText.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ),
                ) : Container()),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: SafeArea(
              child: Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: _cartController.cart.isEmpty
                  ? EmptyData()
                  : ListView(
                      children: _cartController.cart
                          .map((element) => _buildCardProduct(element))
                          .toList()),
            ),
          )),
        ));
  }

  Widget _buildCardProduct(Cart cart) => Slidable(
      key: const ValueKey(0),
      closeOnScroll: true,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
         SizedBox(
              width: 50,
              height: 50,
              child: Container(
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextButton(
                  onPressed: () {
                    _cartController.deleteFromCart(cart);
                  },
                  child: Icon(Icons.delete_forever, color: whiteC,
                ),
              ))),
          SizedBox(
              width: 50,
              height: 50,
              child: Container(
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: silverC,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextButton(
                  onPressed: () {
                    updateQuantity(cart);
                  },
                  child: Icon(Icons.edit, color: draculaC,
                ),
              ))),
        ],
      ),
      child: 
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(cart.quantity.toString() + "x",
                    style: whiteText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            title: Text(cart.name,
                style: blackText.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(formatCurrency.format(cart.totalPrice),
                style: blackText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 18)),
            trailing: Text(
              cart.variation == "-" ? "-" : cart.variation,
              style: blackText.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

      );
}

void doNothing(BuildContext context) {}
