import 'package:flutter/foundation.dart';

class NexaboundStore extends ChangeNotifier {
  int articlesRead = 0;
  
  void incrementRead() {
    articlesRead++;
    notifyListeners();
  }
}
