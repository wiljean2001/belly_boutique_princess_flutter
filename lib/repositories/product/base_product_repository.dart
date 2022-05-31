import '/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
  Future<void> createCategory(Product product);
  Future<void> updateCategory(Product product, String docId);
}
