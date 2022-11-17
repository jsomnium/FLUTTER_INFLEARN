import 'package:book_store/book_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(
      builder: (context, bookService, child) {
        return Scaffold(
          appBar: AppBar(
              title: Text(
                'Book Store',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              centerTitle: false,
              actions: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    'total ${bookService.bookList.length}',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )
              ],
              bottom: PreferredSize()),
        );
      },
    );
  }
}
