import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cat/cat_form.dart';
import 'cat/cat_list.dart';
import 'cat/cat_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech talk: Drift'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: CatForm(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Cats',
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => ref.read(catProvider.notifier).removeCats(),
                  child: Text(
                    'Flush',
                    style: textTheme.bodyMedium?.copyWith(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () => ref.read(catProvider.notifier).loadCats(),
                  child: const Text('Load'),
                ),
              ],
            ),
          ),
          const CatList(),
        ],
      ),
    );
  }
}
