import 'package:flutter/material.dart';

class BookItem {
  final String id;
  final String title;
  final String author;
  final int totalPages;
  final int currentPage;

  const BookItem({
    required this.id,
    required this.title,
    required this.author,
    required this.totalPages,
    required this.currentPage,
  });

  double get progress => totalPages == 0 ? 0.0 : (currentPage / totalPages).clamp(0.0, 1.0);

  BookItem copyWithPage(int newPage) {
    return BookItem(
      id: id,
      title: title,
      author: author,
      totalPages: totalPages,
      currentPage: newPage.clamp(0, totalPages),
    );
  }
}

class BookshelfState extends ChangeNotifier {
  List<BookItem> books = [
    const BookItem(id: '1', title: 'Meditations', author: 'Marcus Aurelius', totalPages: 254, currentPage: 182),
    const BookItem(id: '2', title: 'Gödel, Escher, Bach', author: 'Douglas Hofstadter', totalPages: 777, currentPage: 310),
    const BookItem(id: '3', title: 'Thinking, Fast and Slow', author: 'Daniel Kahneman', totalPages: 499, currentPage: 499),
    const BookItem(id: '4', title: 'The Master and Margarita', author: 'Mikhail Bulgakov', totalPages: 384, currentPage: 140),
  ];

  int annualGoal = 24;
  int annualCompleted = 14;

  void updatePages(String id, int page) {
    books = books.map((b) {
      if (b.id == id) {
        return b.copyWithPage(page);
      }
      return b;
    }).toList();
    notifyListeners();
  }
}

class BookshelfScope extends InheritedNotifier<BookshelfState> {
  const BookshelfScope({
    super.key,
    required BookshelfState notifier,
    required super.child,
  }) : super(notifier: notifier);

  static BookshelfState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<BookshelfScope>();
    assert(scope != null, 'No BookshelfScope found in context');
    return scope!.notifier!;
  }
}
