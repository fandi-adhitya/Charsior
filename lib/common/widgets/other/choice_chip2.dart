part of '../../common.dart';

class ChoiceChipTwo extends StatefulWidget {
  @override
  State<ChoiceChipTwo> createState() => _ChoiceChipTwoState();
}

class _ChoiceChipTwoState extends State<ChoiceChipTwo> {
  final TaxonomiesController _taxonomiesController = Get.put(TaxonomiesController());
  final ProductController _productController = Get.put(ProductController());
  int? _value = 0;

  @override
  void initState() {
    _value = int.parse(_productController.subCategoryId.value);
    // _taxonomiesController.state!.data.insert(0, );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: _taxonomiesController.obx(
        (state) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 30.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: state!.data.map((e){
                  int idx = state.data.indexOf(e);
                  return Container(
                          margin: EdgeInsets.only(right: 20),
                          child: ChoiceChip(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            selectedColor: Color(0xFF197c82),
                            backgroundColor: Color(0xFFbdc3c7),
                            labelStyle: secondaryText.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                            selected: _value == idx,
                            onSelected: (bool selected) {
                              if(selected){
                                _productController.update();
                                _productController.getProductsBySubCategoryId(e.id.toString());
                                setState(() {
                                  _value = selected ? idx : null;
                                });
                              }
                            },
                            label: Text(e.name, style: secondaryText),
                          ),
                        );
                }).toList()
              )
        ),
        onLoading: ChoiceChipOnLoad()
      ),
    );
  }
}