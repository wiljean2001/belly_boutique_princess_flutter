import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/product_model.dart';
import '/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> createCategory(Product product) async {
    await _firebaseFirestore.collection('products').doc().set(product.toMap());
  }

  @override
  Future<void> updateCategory(Product product, String docId) async {
    _firebaseFirestore.collection('products').doc(docId).update(
          product.toMap(),
        );
  }
}
