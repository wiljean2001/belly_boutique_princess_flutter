import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String name;
  final Timestamp? dateOfBirth;
  final String gender;
  final String role;
  final List<dynamic> imageUrls;
  final List<dynamic> interests;
  final String location;

  // final String bio;
  // final String jobTitle;

  const User({
    this.id,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.role,
    required this.imageUrls,
    required this.interests,
    required this.location,
    // required this.bio,
    // required this.jobTitle,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        dateOfBirth,
        gender,
        role,
        imageUrls,
        interests,
        location,
        // bio,
        // jobTitle,
      ];

// Base de datos
  static User fromSnapshot(DocumentSnapshot snap) {
    User user = User(
      id: snap.id,
      name: snap['name'],
      dateOfBirth: snap['date_of_birth'],
      gender: snap['gender'],
      role: snap['role'],
      imageUrls: snap['imageUrls'],
      interests: snap['interests'],
      location: snap['location'],
      // bio: snap['bio'],
      // jobTitle: snap['jobTitle'],
    );
    return user;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'role': role,
      'imageUrls': imageUrls,
      'interests': interests,
      'location': location,
      // 'bio': bio,
      // 'jobTitle': jobTitle,
    };
  }

  User copyWith({
    String? id,
    String? name,
    Timestamp? dateOfBirth,
    String? gender,
    String? role,
    List<dynamic>? imageUrls,
    List<dynamic>? interests,
    String? location,
    // String? bio,
    // String? jobTitle,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      imageUrls: imageUrls ?? this.imageUrls,
      interests: interests ?? this.interests,
      location: location ?? this.location,
      // bio: bio ?? this.bio,
      // jobTitle: jobTitle ?? this.jobTitle,
    );
  }

  static List<User> users = [
    User(
      id: '1',
      name: 'John',
      dateOfBirth: Timestamp.fromDate(DateTime.now()),
      gender: 'Male',
      role: 'admin',
      imageUrls: [
        'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
        'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
        'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
        'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
        'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      ],
      // jobTitle: 'Job Title Here',
      interests: ['Music', 'Economics', 'Football'],
      // bio:
      // 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
      location: 'Milan',
    ),
    User(
      id: '2',
      name: 'Tamara',
      dateOfBirth: Timestamp.fromDate(DateTime.now()),
      gender: 'Female',
      role: 'admin',
      imageUrls: [
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
      ],
      // jobTitle: 'Job Title Here',
      interests: ['Music', 'Economics', 'Football'],
      // bio:
      // 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
      location: 'Milan',
    ),
    User(
      id: '3',
      name: 'Marta',
      dateOfBirth: Timestamp.fromDate(DateTime.now()),
      gender: 'Female',
      role: 'user',
      imageUrls: [
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      ],
      // jobTitle: 'Job Title Here',
      interests: ['Music', 'Economics', 'Football'],
      // bio:
      // 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
      location: 'Milan',
    ),
    User(
      id: '4',
      name: 'Sara',
      dateOfBirth: Timestamp.fromDate(DateTime.now()),
      gender: 'Female',
      role: 'user',
      imageUrls: [
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
      ],
      // jobTitle: 'Job Title Here',
      interests: ['Music', 'Economics', 'Football'],
      // bio:
      // 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
      location: 'Milan',
    ),
  ];
}
