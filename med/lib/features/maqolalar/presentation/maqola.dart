import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med/core/auth_status/status.dart';
import 'package:med/core/widgets/maqola.dart';
import 'package:med/core/widgets/w_maqola_widget.dart';
import 'package:med/features/asosiy/presentation/bloc/maqola_bloc.dart';

class MaqolaScreen extends StatefulWidget {
  const MaqolaScreen({super.key});

  @override
  State<MaqolaScreen> createState() => _MaqolaScreenState();
}

class _MaqolaScreenState extends State<MaqolaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MaqolaBloc, MaqolaState>(
        builder: (context, state) {
          if (state.statusMaqola == StatusMaqola.pure) {
            context.read<MaqolaBloc>().add(
                  MaqolaBlocStarted(),
                );
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state.statusMaqola == StatusMaqola.loading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state.statusMaqola == StatusMaqola.failure) {
            return const Center(
              child: Text(
                "Xatolik",
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Maqola(
                            entities: state.data[index],
                          ),
                        ),
                      );
                    },
                    child: NewItem(
                      onTap: () {
                        context.read<MaqolaBloc>().add(
                              SavedEvent(
                                id: state.data[index].id,
                                entities: state.data[index],
                              ),
                            );
                      },
                      newEntity: state.data[index],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
