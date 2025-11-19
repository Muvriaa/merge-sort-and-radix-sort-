import 'dart:math';

void main() {
  final random = Random();

  final myList = List<int>.generate(1000000, (_) => random.nextInt(1000000));

  print("Generated 1,000,000 numbers!");

  final sortedList = mergeSort(myList);

  print("Done sorting!");

  print(sortedList);
}

List<int> mergeSort(List<int> unsortedList) {
  // base case (when are we finished)
  if (unsortedList.length <= 1) {
    return unsortedList;
  }

  // divide
  final middle = unsortedList.length ~/ 2;
  final leftList = unsortedList.sublist(0, middle);
  final rightList = unsortedList.sublist(middle);

  // conquer (merge)
  final sortedLeft = mergeSort(leftList);
  final sortedRight = mergeSort(rightList);

  return merge(sortedLeft, sortedRight);
}

List<int> merge(List<int> leftList, List<int> rightList) {
  final List<int> result = [];
  int leftIndex = 0;
  int rightIndex = 0;

  while (leftIndex < leftList.length && rightIndex < rightList.length) {
    final leftValue = leftList[leftIndex];
    final rightValue = rightList[rightIndex];
    if (leftValue < rightValue) {
      result.add(leftValue);
      leftIndex++;
    } else {
      result.add(rightValue);
      rightIndex++;
    }
  }

  // add remaining from leftList
  while (leftIndex < leftList.length) {
    result.add(leftList[leftIndex]);
    leftIndex++;
  }

  // add remaining from rightList
  while (rightIndex < rightList.length) {
    result.add(rightList[rightIndex]);
    rightIndex++;
  }

  return result;
}
