import 'package:bloc/bloc.dart';
import 'package:bloc_implementation/repository/users_repository.dart';
import 'package:equatable/equatable.dart';
import '../models/user_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepository userRepository;
  UsersCubit(this.userRepository) : super(UsersLoadingState());
  onLoadUsers() async {
    try {
      emit(UsersLoadingState());
      var data = await userRepository.getUsers();
      emit(UsersLoadedState(userModel: data));
    } catch (e) {
      emit(UserErrorState(errorMessage: e.toString()));
    }
  }
}
