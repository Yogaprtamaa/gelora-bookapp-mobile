import 'dart:convert';

import 'package:gelora/model/schedule/data_schedule.dart';
import 'package:gelora/model/venue/venue.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class ScheduleModel {
  ScheduleModel({this.venue, this.schedules});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);

  final Venue? venue;
  final List<DataSchedule>? schedules;

  @override
  String toString() => json.encode(this);

}