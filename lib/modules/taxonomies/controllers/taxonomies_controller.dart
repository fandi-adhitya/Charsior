part of '../taxonomies.dart';

class TaxonomiesController extends GetxController with StateMixin<Taxonomies>{

  @override
  void onInit() {
    super.onInit();
    TaxonomiesService().getTaxonomies().then((resp){
      change(resp, status: RxStatus.success());
      resp!.data.insert(0, Data(id: 0, name: "All", businessId: 0, parentId: 0, createdBy: 0, categoryType: "0", createdAt: "", updatedAt: "", subCategories: [""]));
    }, onError: (err) { 
        change(null, status: RxStatus.error());
      });
  }

}