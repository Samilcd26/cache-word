// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardModelImplAdapter extends TypeAdapter<_$CardModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$CardModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CardModelImpl(
      id: fields[0] as String,
      frontSide: fields[1] as String,
      backSide: fields[2] as String,
      isOpen: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$CardModelImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.frontSide)
      ..writeByte(2)
      ..write(obj.backSide)
      ..writeByte(3)
      ..write(obj.isOpen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardModelImpl _$$CardModelImplFromJson(Map<String, dynamic> json) =>
    _$CardModelImpl(
      id: json['id'] as String,
      frontSide: json['frontSide'] as String,
      backSide: json['backSide'] as String,
      isOpen: json['isOpen'] as bool? ?? false,
    );

Map<String, dynamic> _$$CardModelImplToJson(_$CardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'frontSide': instance.frontSide,
      'backSide': instance.backSide,
      'isOpen': instance.isOpen,
    };
