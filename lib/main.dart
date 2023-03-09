import 'package:flutter/material.dart';
import 'CommandePage.dart';
import 'BookDetailsPage.dart';
import 'PanierPage.dart';
import 'listBook.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailsPage(book: books[index]),
                
              ),
            );
          },
          child: ListTile(
            leading: Image.network(
              books[index].imageUrl,
              width: 50,
              height: 50,
            ),
            title: Text(books[index].title),
            subtitle: Text(books[index].auteur),
          ),
        );
      },
    );
  }
}