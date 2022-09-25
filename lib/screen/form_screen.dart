import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_by_json/bloc/form_screen_cubit.dart';
import 'package:test_form_by_json/widget/iroha_form.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormScreenCubit>(
      create: (context) => FormScreenCubit()..loadData(),
      child: BlocBuilder<FormScreenCubit, FormScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.title),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final item = state.data[index];
                      return IrohaForm(
                        data: item,
                        key: ValueKey('TEXTFORMFIELD_${item['control_id']}'),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: context.read<FormScreenCubit>().submit,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Test Submit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
