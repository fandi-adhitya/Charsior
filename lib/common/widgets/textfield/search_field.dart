part of '../../common.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isNotEmpty = false;
  final TextEditingController _searchEditingController =  TextEditingController();
  final ProductController _productController = Get.put(ProductController());


  @override
  void initState() {
    super.initState();
    isNotEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin : EdgeInsets.all(10.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
               enableInteractiveSelection: false,
              controller: _searchEditingController,
              onChanged: (text){
                if(text.isNotEmpty) {
                  isNotEmpty = true;
                  _productController.getProductsByName(text);
                  setState(() {});
                } else {
                  _productController.getProductsBySubCategoryId(_productController.subCategoryId.value);
                  isNotEmpty = false;
                  setState(() {});
                }
              },
              keyboardType: TextInputType.text,
              style: blackText,
              cursorColor: primaryC,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 16,
                    color: silverC,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  filled: true,
                  hintStyle: blackText.copyWith(color: Colors.grey, fontSize: 14),
                  hintText: "Search all product here...",
                  fillColor: Colors.white70),
            ),
          ),
          checkIfTextIsNotEmpty(isNotEmpty)
        ],
      ),
    );
  }

  Widget checkIfTextIsNotEmpty(bool isNotEmpty) {
    if(isNotEmpty){
      return Container(
        margin: EdgeInsets.only(left : 5),
        child: TextButton(onPressed: (){
          _searchEditingController.clear();
          _searchEditingController.clearComposing();
          _searchEditingController.dispose();
          isNotEmpty = false;
          setState(() {});
        }, child: Icon(Icons.clear, color: brownC,))
      );
    }
    return Container();
    
  }
}
