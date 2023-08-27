import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/users_cubit.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    context.read<UsersCubit>().onLoadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.userModel.length,
              itemBuilder: (context, index) {
                var data = state.userModel[index];
                return Card(
                  borderOnForeground: true,
                  child: ListTile(
                    title: Text(data.company?.name.toString() ?? "NA"),
                    subtitle: Text(data.email.toString()),
                    trailing: Text(data.name.toString()),
                  ),
                );
              },
            );
          } else if (state is UserErrorState) {
            return Text(state.errorMessage);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
