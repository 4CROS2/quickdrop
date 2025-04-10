import 'package:equatable/equatable.dart';

/// Represents a user's current location.
/// Use [isEmpty] to check if both fields are empty.
class CurrentLocationEntity extends Equatable {
  const CurrentLocationEntity({
    required this.address,
    required this.name,
  });

  /// Creates an empty instance with both fields initialized to empty strings.
  const CurrentLocationEntity.empty()
      : address = '',
        name = '';

  final String address;
  final String name;

  bool get isEmpty => name.isEmpty && address.isEmpty;
  bool get isNotEmpty => !isEmpty;

  @override
  List<Object> get props => <Object>[address, name];
}
