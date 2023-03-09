
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Book {
 final String title;
 final String description;
 final String imageUrl;
 final double prix;
  final int id;
 final String auteur;
 int quantity;

  Book(
   { required this.id,
     required this.title ,
      required this.description,
      required this.imageUrl,
      required this.prix,
      required this.auteur,
      required this.quantity,
       });
 void addquan()
 {
   this.quantity+=1;
 }
  void removequan()
  {
    if(this.quantity>1) {
      this.quantity -= 1;
    }
  }

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': auteur,
      'imageUrl': imageUrl,
      'description': description,
      'price': prix,
      'quantity': quantity,
    };
  }
}

 
 

