// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PessoaModelAdapter extends TypeAdapter<PessoaModel> {
  @override
  final int typeId = 1;

  @override
  PessoaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PessoaModel(
      fields[0] as String,
      fields[1] as double,
      fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PessoaModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._nome)
      ..writeByte(1)
      ..write(obj._peso)
      ..writeByte(2)
      ..write(obj._altura);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PessoaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
