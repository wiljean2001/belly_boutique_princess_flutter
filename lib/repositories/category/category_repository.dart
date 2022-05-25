import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/category_model.dart';
import '/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> createCategory(Category category) async {
    await _firebaseFirestore
        .collection('categories')
        .doc()
        .set(category.toMap());
  }

  @override
  Future<void> updateCategory(Category category) async {
    return _firebaseFirestore
        .collection('users')
        .doc(category.id)
        .update(category.toMap())
        .then(
          (value) => print('Category document updated.'),
        );
  }
/**
 * 
  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }

  @override
  Future<void> updateUser(User user) async {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then(
          (value) => print('User document updated.'),
        );
  }
 */
}
