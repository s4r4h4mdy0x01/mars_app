part of 'mars_cubit.dart';

sealed class MarsState extends Equatable {
  const MarsState();

  @override
  List<Object> get props => [];
}

final class MarsInitial extends MarsState {}

final class RoverLoading extends MarsState {}

final class RoverSucceeded extends MarsState {}

final class MarsLoading extends MarsState {}

final class MarsSucceeded extends MarsState {



}
