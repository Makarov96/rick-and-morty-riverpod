import 'package:equatable/equatable.dart';

class GenericException implements Exception, Equatable {
  GenericException([
    this.message = '',
    this.prefix = '',
  ]);

  final String message;
  final String prefix;
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [message, prefix];

  @override
  String toString() => 'GenericException(message: $message, prefix: $prefix)';
}

class RemoteException extends GenericException {}
