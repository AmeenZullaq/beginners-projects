import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetProductByCategoryService {
  Future<List<ProductModel>> getProductByCategory({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productByCategoryList = [];

    for (int i = 0; i < data.length; i++) {
      productByCategoryList.add(ProductModel.fromJson(data[i]));
    }
    return productByCategoryList;
  }
}
