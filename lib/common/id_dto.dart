import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'entity.dart';

abstract class IdDto<T> extends Equatable {
  String? get id;

  const IdDto();

  static List<T>? toDomainList<T extends Entity, E extends IdDto>(List<E>? dto) {
    if (dto == null) return null;
    List<T> list = [];
    for (var element in dto) {
      T? domain = element.toDomain().fold(() => null,(r)=>r);
      if(domain==null) return null;
      list.add(domain);
    }
    return list;
  }

  Option<T> toDomain();

  Map<String, dynamic> toJson();

  @override
  List<Object?> get props => [id];
}

abstract class TimeStampedDto {
  DateTime? get createdAt;

  DateTime? get updatedAt;
}
