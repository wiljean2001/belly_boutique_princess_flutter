import '/models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
  Future<void> createCategory(Category category);
  Future<void> updateCategory(Category category);
}
