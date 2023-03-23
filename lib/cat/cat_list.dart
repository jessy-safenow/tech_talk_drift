import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cat_provider.dart';

class CatList extends ConsumerWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catsAsyncValue = ref.watch(catProvider);
    return catsAsyncValue.when(
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (_, __) {
        return const Center();
      },
      data: (cats) {
        if (cats.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text('No cats',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.grey)),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cats.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(cats[index].name),
            subtitle: Text(
                'ID: ${cats[index].id}, Age: ${cats[index].age ?? 'Unknown'}'),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
        );
      },
    );
  }
}
