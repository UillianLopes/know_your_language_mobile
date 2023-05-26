import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/widgets/selection_list/selection_list_controller.dart';
import 'package:know_your_language/src/widgets/selection_list/selection_list_option.dart';

class SelectionList<T> extends StatelessWidget {
  final SelectionListController<T> controller;
  final Widget Function(BuildContext context, T item) builder;
  final Widget placeholder;

  const SelectionList({
    super.key,
    required this.controller,
    required this.builder,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = controller.items$.value;

      if (items.isEmpty) {
        return Center(
          child: this.placeholder,
        );
      }

      return ListView.separated(
        itemBuilder: (context, index) => SelecionListOption(
          controller: controller,
          index: index,
          child: builder(context, items[index]),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemCount: items.length,
      );
    });
  }
}
