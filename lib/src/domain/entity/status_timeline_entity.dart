import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';

class StatusTimelineEntity extends Equatable {
  const StatusTimelineEntity({
    required this.status,
    required this.timestamp,
  });

  final OrderStatus status;
  final Timestamp timestamp;

  StatusTimelineEntity copyWith({
    OrderStatus? status,
    Timestamp? timestamp,
  }) {
    return StatusTimelineEntity(
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, timestamp];
}
