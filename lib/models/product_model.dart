import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id; // identificador - PK
  final String title; // titulo o nombre del producto
  final String descript; // descripcion del producto
  final List<dynamic> imageUrls; // imagenes - fotos
  final List<dynamic> sizes; //tallas

  // Constructor
  const Product({
    this.id,
    required this.title,
    required this.descript,
    required this.imageUrls,
    required this.sizes,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        descript,
        imageUrls,
        sizes,
      ];

// Snapshot de la Base de datos, obtener datos
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap.id,
      title: snap['title'],
      descript: snap['descript'],
      imageUrls: snap['imageUrls'],
      sizes: snap['sizes'],
    );
    return product;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'descript': descript,
      'imageUrls': imageUrls,
      'sizes': sizes,
    };
  }

  Product copyWith({
    String? id,
    String? title,
    String? descript,
    List<dynamic>? imageUrls,
    List<dynamic>? sizes,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      descript: descript ?? this.descript,
      imageUrls: imageUrls ?? this.imageUrls,
      sizes: sizes ?? this.sizes,
    );
  }
}
