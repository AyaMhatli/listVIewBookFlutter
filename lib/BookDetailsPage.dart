import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Book.dart';
import 'PanierPage.dart';
import 'DBHelper.dart';

class BookDetailsPage extends StatefulWidget {
   final Book book;


  BookDetailsPage({required this.book});

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  int _quantity = 1;

  DBHelper databaseHelper = DBHelper();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PanierPage(),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.book.imageUrl,
              width: 300,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              widget.book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.book.auteur,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              widget.book.prix.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              widget.book.description,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Quantity: $_quantity'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_quantity > 1) {
                            _quantity--;
                          }
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _quantity++;


                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                //da5el
                Book newBook = Book(
                  id: widget.book.id,
                  title: widget.book.title,
                  auteur: widget.book.auteur,
                  imageUrl: widget.book.imageUrl,
                  description: widget.book.description,
                  prix: widget.book.prix,
                  quantity: _quantity,
                );
                int res = await databaseHelper.saveBook(newBook);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Book added to cart'),
                    duration: Duration(seconds: 1),
                  ),
                );

              },
              child: Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}


