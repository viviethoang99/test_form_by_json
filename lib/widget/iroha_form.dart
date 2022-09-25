import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_by_json/bloc/form_screen_cubit.dart';

class IrohaForm extends StatelessWidget {
  const IrohaForm({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    if (data['label'] == null) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 10,
        ),
        child: Text(
          data['value'],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data['label']),
        const SizedBox(height: 5),
        TextFormField(
          initialValue: data['value'] ?? '',
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: data['hint'] ?? '',
          ),
          style: data['style'],
          onChanged: (value) {
            context.read<FormScreenCubit>().changeValue(
                  key: data['control_id'],
                  value: value,
                );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
