// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigurationModelAdapter extends TypeAdapter<ConfigurationModel> {
  @override
  final int typeId = 0;

  @override
  ConfigurationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigurationModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ConfigurationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigurationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
