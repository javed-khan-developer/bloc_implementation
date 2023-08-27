part of 'users_cubit.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitialState extends UsersState {}

final class UsersLoadingState extends UsersState {}

final class UsersLoadedState extends UsersState {
  final List<UserModel> userModel;
  const UsersLoadedState({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

final class UserErrorState extends UsersState {
  final String errorMessage;

  const UserErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
