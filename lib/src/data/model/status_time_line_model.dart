import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/domain/entity/status_timeline_entity.dart';

class StatusTimelineModel extends StatusTimelineEntity {
  const StatusTimelineModel({
    required super.status,
    required super.timestamp,
  });

  factory StatusTimelineModel.fromJson({required Map<String, dynamic> json}) {
    return StatusTimelineModel(
      status: OrderStatus.values[json['status'] as int],
      timestamp: json['updated_at'] as Timestamp,
    );
  }
  factory StatusTimelineModel.fromEntity(
      {required StatusTimelineEntity entity}) {
    return StatusTimelineModel(
      status: entity.status,
      timestamp: entity.timestamp,
    );
  }

  Timestamp get _timestamp => Timestamp.now();

  static List<StatusTimelineModel> fromJsonList(
      {required List<dynamic> jsonList}) {
    return jsonList
        .map<StatusTimelineModel>(
          // ignore: always_specify_types
          (json) => StatusTimelineModel.fromJson(
            json: json as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  static List<Map<String, dynamic>> toJsonList({
    required List<StatusTimelineEntity> statusTimelineEntities,
  }) {
    if (statusTimelineEntities.isEmpty) {
      final StatusTimelineEntity initialEntry = StatusTimelineEntity(
        status: OrderStatus.pending,
        timestamp: Timestamp.now(),
      );

      statusTimelineEntities = <StatusTimelineEntity>[initialEntry];
    }

    return statusTimelineEntities.map((StatusTimelineEntity entity) {
      final StatusTimelineModel model = StatusTimelineModel.fromEntity(
        entity: entity,
      );
      return model.toJson();
    }).toList();
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status.index,
      'updated_at': _timestamp,
    };
  }
}
