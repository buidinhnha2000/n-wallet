import 'package:equatable/equatable.dart';
import '../balance/balance.dart';

class Balance extends Equatable {
  final String? updatedAt, createdAt, deletedAt, value, status;
  final int? id;

  const Balance(this.id, this.updatedAt, this.createdAt, this.deletedAt,
      this.value, this.status);

  @override
  List<Object?> get props =>
      [id, updatedAt, createdAt, deletedAt, value, status];

  factory Balance.fromDTO(BalanceJson? dto) => Balance(dto?.id, dto?.updatedAt,
      dto?.createdAt, dto?.deletedAt, dto?.value, dto?.status);
}
