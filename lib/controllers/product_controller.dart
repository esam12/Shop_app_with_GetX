import 'package:api_getx/controllers/products_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductsRepository productsRepository = ProductsRepository();
  List products = [].obs;
  RxBool loading = false.obs;

  getDataFromRepo() async {
    products = await productsRepository.getData();
    print(products);
  }

  @override
  void onInit() {
    getDataFromRepo();
    super.onInit();
  }
}
