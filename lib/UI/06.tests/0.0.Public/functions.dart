import 'dart:math';

class PublicFun {
  static void shuffleList(List<String> list) {
    final random = Random();

    for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
  }
}
