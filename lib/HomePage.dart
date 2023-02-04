import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_bloc/cubit/internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BlocBuilder use only ui change
      //BlocListener use only background listen
      //BlocConsumer use both of

      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state == InternetState.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Connected"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state == InternetState.Lost) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text("Disconnected"),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (BuildContext context, state) {
          if (state == InternetState.Gained) {
            return const Center(child: Text("Connected"));
          } else if (state == InternetState.Lost) {
            return const Center(
              child: Text("Disconnected"),
            );
          } else {
            return const Center(
              child: Text("Loading"),
            );
          }
        },
      ),
    );
  }
}
