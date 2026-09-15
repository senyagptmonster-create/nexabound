import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkArticle {
  final String id;
  final String title;
  final String url;
  final int estMinutes;
  final String collection;
  bool isArchived;
  final DateTime addedAt;

  BookmarkArticle({
    required this.id,
    required this.title,
    required this.url,
    required this.estMinutes,
    required this.collection,
    this.isArchived = false,
    required this.addedAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'url': url,
    'estMinutes': estMinutes,
    'collection': collection,
    'isArchived': isArchived,
    'addedAt': addedAt.toIso8601String(),
  };

  factory BookmarkArticle.fromJson(Map<String, dynamic> m) => BookmarkArticle(
    id: m['id'] as String,
    title: m['title'] as String,
    url: m['url'] as String,
    estMinutes: m['estMinutes'] as int,
    collection: m['collection'] as String,
    isArchived: m['isArchived'] as bool? ?? false,
    addedAt: DateTime.parse(m['addedAt'] as String),
  );
}

class ShelfController extends ChangeNotifier {
  static const _shelfKey = 'nexabound_bookmarks_v2';

  final List<BookmarkArticle> _articles = [];
  String _selectedCollection = 'All';

  List<BookmarkArticle> get articles {
    if (_selectedCollection == 'All') return List.unmodifiable(_articles.where((a) => !a.isArchived));
    return List.unmodifiable(_articles.where((a) => !a.isArchived && a.collection == _selectedCollection));
  }

  List<BookmarkArticle> get archived => List.unmodifiable(_articles.where((a) => a.isArchived));

  ShelfController() {
    _loadArticles();
  }

  Future<void> _loadArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_shelfKey);
    if (raw != null) {
      final List dec = jsonDecode(raw);
      _articles.clear();
      _articles.addAll(dec.map((e) => BookmarkArticle.fromJson(e)));
    } else {
      _articles.addAll([
        BookmarkArticle(
          id: '1',
          title: 'The Psychology of Architectural Spatial Light',
          url: 'journal.arch/spatial-light',
          estMinutes: 7,
          collection: 'Design',
          addedAt: DateTime.now().subtract(const Duration(hours: 4)),
        ),
        BookmarkArticle(
          id: '2',
          title: 'Distributed State Engines in Mobile Hardware',
          url: 'tech.review/state-engines',
          estMinutes: 12,
          collection: 'Tech',
          addedAt: DateTime.now().subtract(const Duration(days: 1)),
        ),
        BookmarkArticle(
          id: '3',
          title: 'Cold Brew Extraction Extraction Rates',
          url: 'coffee.lab/extraction',
          estMinutes: 4,
          collection: 'Culinary',
          addedAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
      ]);
    }
    notifyListeners();
  }

  void filterCollection(String col) {
    _selectedCollection = col;
    notifyListeners();
  }

  void addArticle(String title, String url, int min, String col) async {
    final a = BookmarkArticle(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      url: url,
      estMinutes: min,
      collection: col,
      addedAt: DateTime.now(),
    );
    _articles.insert(0, a);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_shelfKey, jsonEncode(_articles.map((e) => e.toJson()).toList()));
    notifyListeners();
  }

  void toggleArchive(String id) async {
    final idx = _articles.indexWhere((a) => a.id == id);
    if (idx != -1) {
      _articles[idx].isArchived = !_articles[idx].isArchived;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_shelfKey, jsonEncode(_articles.map((e) => e.toJson()).toList()));
      notifyListeners();
    }
  }

  void deleteArticle(String id) async {
    _articles.removeWhere((a) => a.id == id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_shelfKey, jsonEncode(_articles.map((e) => e.toJson()).toList()));
    notifyListeners();
  }
}
