part of '../../common.dart';

class ProductCard extends StatefulWidget {
  final List<ProductData> product;
  final int index;
  // price = int.parse(widget.product[widget.index].productVariations[0].variations[0].defaultPurchasePrice);

  const ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final formatCurrency = NumberFormat.currency(symbol: "Rp. ");
  final _cartController = Get.put(CartController());

  int defaultValue = -1;

  @override
  void initState() {
    super.initState();
  }

  void showAddCartBottomSheet(ProductData data) {
    double price = double.parse(widget.product[widget.index].productVariations[0]
        .variations[0].defaultPurchasePrice);    

    int variationId = widget.product[widget.index].productVariations[0].id;
    String variant = widget.product[widget.index].productVariations.length < 2 ? "-" : "Hot";

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
                backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            // height: MediaQuery.of(context).size.height / 2 + 100,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            decoration: BoxDecoration(
                color: whiteC,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
              return Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            color: primaryC,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            data.name.substring(0, 2).toUpperCase(),
                            style: whiteText.copyWith(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                          child: Text(data.name,
                              style: draculaText.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      SizedBox(height: 2),
                      Center(
                          child: Text(formatCurrency.format(price),
                              style: draculaText.copyWith(fontSize: 24))),
                      SizedBox(height: 10),
                      data.productVariations.length < 2
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: data.productVariations.map((e) {
                                int idx = data.productVariations.indexOf(e);
                                return ChoiceChip(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  selectedColor: primaryC,
                                  backgroundColor: Color(0xFFbdc3c7),
                                  labelStyle: secondaryText.copyWith(
                                      fontWeight: FontWeight.bold),
                                  selected: defaultValue == idx,
                                  onSelected: (bool selected) {
                                    if(selected) {
                                       state(() {
                                          variant = e.variations[0].name;
                                          variationId = e.variations[0].id;
                                          price = double.parse(e
                                              .variations[0].defaultPurchasePrice);
                                          defaultValue = selected ? idx : -1;
                                        });
                                    }
                                  },
                                  label: Text(e.variations[0].name,
                                      style: secondaryText),
                                );
                              }).toList()),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                _cartController.subQuantity();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: secondaryC,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: primaryC
                                  ),
                                ),
                              )),
                          SizedBox(width: 10),
                          Obx(() => Text(_cartController.quantity.toString(),
                              style: primaryText.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18))),
                          SizedBox(width: 10),
                          TextButton(
                              onPressed: () {
                                _cartController.addQuantity();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: primaryC,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: whiteC,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            Cart cart = Cart(
                                id: data.id,
                                name: data.name,
                                variation: data.productVariations.length < 2
                                    ? "-"
                                    : variant,
                                price: price,
                                variationId: data.productVariations.length < 2 
                                ? data.productVariations[0].id 
                                : variationId,
                                quantity: _cartController.quantity.value,
                                totalPrice: price * _cartController.quantity.value);

                            _cartController.addProductToCart(cart);
                            _cartController.quantity.value = 1;
                            defaultValue = -1;

                            Navigator.pop(context);
                            GlobalSnackbar.showSnackbar(
                                "Success",
                                "Successfully added product to cart",
                                Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: brownC,
                            ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryC),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add to Cart",
                                    style: primaryText.copyWith(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 20),
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: primaryC,
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              );
            }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    
    var num = double.parse(widget.product[widget.index].productVariations[0]
        .variations[0].defaultPurchasePrice);

    print(widget.product[widget.index].productVariations[0]
        .variations[0].defaultPurchasePrice);
    // return ListTile(
    //         leading: Container(
    //           width: 50,
    //           height: 50,
    //           decoration: BoxDecoration(
    //               color: Colors.grey,
    //               borderRadius: BorderRadius.all(Radius.circular(10))),
    //           child: Center(
    //             child: Text(widget.product[widget.index].name.substring(0, 2).toUpperCase(),
    //                 style: whiteText.copyWith(
    //                     fontWeight: FontWeight.bold, fontSize: 18)),
    //           ),
    //         ),
    //         title: Text(widget.product[widget.index].name,
    //             style: blackText.copyWith(fontWeight: FontWeight.bold)),
    //         subtitle: Text(formatCurrency.format(num),
    //             style: blackText.copyWith(
    //                 fontWeight: FontWeight.bold, fontSize: 18)),
    //         // trailing: Text(cart.variation == "-" ? "-" : cart.variation,style: blackText.copyWith(fontWeight: FontWeight.bold),
    //         );

    return Card(
      child: InkWell(
          splashColor: Colors.brown.withAlpha(30),
          onTap: () {
            showAddCartBottomSheet(widget.product[widget.index]);
          },
          child: Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 200,
                    height: 80,
                    decoration: BoxDecoration(
                        color: primaryC.withOpacity(0.9),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                        widget.product[widget.index].name
                            .substring(0, 2)
                            .toUpperCase(),
                        style: whiteText.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(widget.product[widget.index].name,
                          style: draculaText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      // _buildBadge(widget.product[widget.index].subCategory!.name),
                      SizedBox(height: 5),
                      Text(formatCurrency.format(num), style: draculaText.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ],
                
              ))),
    );
  }

  // Widget _buildRawChip() => RawChip(label: label, )

  Widget _buildBadge(String text) => Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: primaryC,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    child: Text(text, style: whiteText.copyWith(fontSize: 8, fontWeight: FontWeight.bold),),

  );

  Widget _buildChoiceVariants(ProductData data, int defaultValue) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: data.productVariations.map((e) {
        int idx = data.productVariations.indexOf(e);
        return RawChip(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          selectedColor: primaryC,
          backgroundColor: Color(0xFFbdc3c7),
          labelStyle: secondaryText.copyWith(fontWeight: FontWeight.bold),
          selected: defaultValue == idx,
          onSelected: (bool selected) {
            setState(() {
              defaultValue = selected ? idx : -1;
            });
            print("defaultValue ==>" + defaultValue.toString());
            print("idx ==> " + idx.toString());
          },
          label: Text(e.variations[0].name, style: secondaryText),
        );
      }).toList());
}
