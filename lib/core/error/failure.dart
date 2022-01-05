import 'package:equatable/equatable.dart';

//This abstract calss is for handle error
///

abstract class Failure extends Equatable {
  const Failure([
    this.message = '',
    this.prefix = '',
  ]);
  final String message;
  final String prefix;

  @override
  List<Object?> get props => [message, prefix];
}

class NetworkFailure extends Failure {}

class LocalDataFailure extends Failure {}

class ServerFailure extends Failure {}
