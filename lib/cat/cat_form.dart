import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cat_provider.dart';

class CatForm extends ConsumerStatefulWidget {
  const CatForm({Key? key}) : super(key: key);

  @override
  CatFormState createState() => CatFormState();
}

class CatFormState extends ConsumerState<CatForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _ageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add cat',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _nameTextController,
                  decoration: const InputDecoration(hintText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Very empty.';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: TextFormField(
                  controller: _ageTextController,
                  decoration: const InputDecoration(hintText: 'Age'),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 24),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    ref.read(catProvider.notifier).addCat(
                          name: _nameTextController.text,
                          age: int.tryParse(_ageTextController.text),
                        );
                    _formKey.currentState?.reset();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
