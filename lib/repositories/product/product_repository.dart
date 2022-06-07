import 'package:cloud_firestore/cloud_firestore.dart';
import '../storage/storage_repository.dart';
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
  Stream<Product> getProduct(String productId) {
    print('Getting user images from DB');
    return _firebaseFirestore
        .collection('products')
        .doc(productId)
        .snapshots()
        .map((snap) => Product.fromSnapshot(snap));
  }

  @override
  Future<void> createProduct(Product product) async {
    await _firebaseFirestore.collection('products').doc().set(product.toMap());
  }

  @override
  Future<void> updateProduct(Product product, String docId) async {
    _firebaseFirestore.collection('products').doc(docId).update(
          product.toMap(),
        );
  }

  // @override
  // Future<void> updateProductPictures(String imageName) async {
  //   String downloadUrl =
  //       await StorageRepository().getDownloadURLProduct(imageName);

  //   return _firebaseFirestore.collection('products').doc().update({
  //     'imageUrls': FieldValue.arrayUnion([downloadUrl])
  //   });
  // }
}
