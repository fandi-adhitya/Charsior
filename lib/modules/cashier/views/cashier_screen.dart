part of '../cashier.dart';

class CashierScreen extends StatefulWidget {
  @override
  _CashierScreenState createState() => _CashierScreenState();
}

class _CashierScreenState extends State<CashierScreen> {
  final CashierController _cashierController = Get.find<CashierController>();
  final TaxonomiesController _taxonomiesController = Get.put(TaxonomiesController());

  final ProductController _productController = Get.put(ProductController());

  @override
  void initState(){
    super.initState();
    // _isShowSummary = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomCart(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<CashierController>(
        builder: (_) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SearchField(),
                    ChoiceChipTwo(),
                    SizedBox(height: 10),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: _productController.obx((state) =>
                          state!.data.isEmpty ?
                          EmptyData() :
                          GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // mainAxisSpacing: 10,
                              // crossAxisSpacing: 10
                            ),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              return ProductCard(product: state.data, index: index);
                            }
                          ),
                          onEmpty: EmptyData(),
                          onError: (s) => Text(s.toString()),
                          onLoading: Container(
                            margin: EdgeInsets.all(0),
                            child: GridView(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10
                              ),
                              children: List<Widget>.generate(10, (index) => ProductCardOnLoad()) ,
                            ),
                          )
                        )
                      ),
                    ),
                    // SizedBox(height: 90)
                    SizedBox(height: 80),

                  ],
                ),
              )
            ),
          );
        }
      ),
    );
  }
}
