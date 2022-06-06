import '/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
  Stream<Product> getProduct(String productId);
  Future<void> createProduct(Product product);
  Future<void> updateProduct(Product product, String docId);
  Future<void> updateProductPictures(Product product, String imageName);
}
