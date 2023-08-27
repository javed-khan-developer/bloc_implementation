import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_bloc.dart';
import 'cubit/users_cubit.dart';
import 'debug/bloc_observer.dart';
import 'repository/product_repository.dart';
import 'repository/users_repository.dart';
import 'view/home_view.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
            ProductRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => UsersCubit(
            UserRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
