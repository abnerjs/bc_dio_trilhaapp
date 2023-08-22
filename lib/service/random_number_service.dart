import 'dart:math';

class GetRandomNumber {
  static int randomNumber() {
    Random number = Random();
    return number.nextInt(100);
  }
}
