import 'package:bloc/bloc.dart';
import 'package:bloc_implementation/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersLoadingState());
}
