import 'dart:async';
import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/services/planet_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestorePlanetService implements PlanetService {
  CollectionReference planets = FirebaseFirestore.instance.collection('planets');
  FirebaseStorage storage = FirebaseStorage.instance;

  Stream<List<Planet>> getPlanets() => planets.snapshots().asyncMap(_queryToList);

  Future<List<Planet>> _queryToList(QuerySnapshot snapshot) async {
    final result = <Planet>[];
    for (var doc in snapshot.docs) {
      result.add(await _planetFromJson(doc));
    }
    return result;
  }

  Future<Planet> _planetFromJson(DocumentSnapshot document) async {
    Map<String, dynamic> json = document.data()! as Map<String, dynamic>;
    return Planet(
      name: json['name'],
      image: await storage.ref(json['image']).getDownloadURL(),
      price: json['price'].toString(),
      description: json['description'],
    );
  }
}
