import 'dart:math';

void main() {
  final random = Random();

  final myList = List<int>.generate(1000000, (_) => random.nextInt(1000000));

  print("Generated 1,000,000 numbers!");
  radixSort(myList);

  print(myList);
}


void radixSort(List<int> list) {
  if (list.length <= 1) {
    return;
  }

  
  int place = 1;

  int biggestNumber = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > biggestNumber) {
      biggestNumber = list[i];
    }
  }
   final numberOfDigits = biggestNumber.toString().length;

   for(int i = 0; i < numberOfDigits; i++) {

    final buckets = List<List<int>>.generate(10, (_) => []);

    for (int value in list) {
      final digit = (value ~/ place) % 10;
      buckets[digit].add(value);

    }

    list.clear();
    for (final bucket in buckets) {
      list.addAll(bucket);
    }

    place = place * 10;
   }
}