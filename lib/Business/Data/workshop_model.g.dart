// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkshopModelImplAdapter extends TypeAdapter<_$WorkshopModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$WorkshopModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$WorkshopModelImpl(
      id: fields[0] as String,
      title: fields[1] as String,
      cardList: (fields[2] as List).cast<CardModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$WorkshopModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.cardList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkshopModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkshopModelImpl _$$WorkshopModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkshopModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      cardList: (json['cardList'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkshopModelImplToJson(_$WorkshopModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cardList': instance.cardList,
    };
