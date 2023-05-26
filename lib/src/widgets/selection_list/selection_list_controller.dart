import 'package:get/get.dart';

class SelectionListController<T> extends GetxController {
  final selectedIndex$ = Rx<int?>(null);
  final items$ = Rx<List<T>>([]);
  final isCompleted$ = Rx<bool>(false);
  final correctIndex$ = Rx<int?>(null);
  final incorrectIndexes$ = Rx<List<int>>([]);

  reset() {
    selectedIndex$.value = null;
    correctIndex$.value = null;
    isCompleted$.value = false;
    items$.value = [];
  }

  seed(List<T> items, List<int> incorrectIndexes) {
    correctIndex$.value = null;
    selectedIndex$.value = null;
    isCompleted$.value = false;
    items$.value = items;
    incorrectIndexes$.value = incorrectIndexes;
  }

  select(int index) {
    selectedIndex$.value = index;
  }

  complete({required int correctIndex}) {
    correctIndex$.value = correctIndex;
    isCompleted$.value = true;
    incorrectIndexes$.value = [];
  }

  markCurretIndexAsIncorrect() {
    final selectedIndex = selectedIndex$.value;

    if (selectedIndex == null) {
      return;
    }

    incorrectIndexes$.value = [...incorrectIndexes$.value, selectedIndex];

    selectedIndex$.value = null;
  }
}
