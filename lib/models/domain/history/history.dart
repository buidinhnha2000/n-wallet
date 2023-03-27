import 'package:equatable/equatable.dart';
import '../../history/history.dart';
import '../../history/history_data.dart';
import '../../history/history_receiver.dart';
import '../../history/history_sender.dart';

class History extends Equatable {
  final int? total;
  final List<HistoryDataJson>? historyDataJson;

  const History({this.total, this.historyDataJson});

  @override
  List<Object?> get props => [total, historyDataJson];

  factory History.fromDTO(HistoryJson? dto) => History(
        total: dto?.total,
        historyDataJson: dto?.historyDataJson,
      );
}

class HistoryData extends Equatable {
  final int? id;
  final String? updatedAt, createdAt, deletedAt, status, typeTransaction, notes;
  final double? amount;
  final List<HistoryReceiverJson>? historyReceiverJson;
  final List<HistorySenderJson>? historySenderJson;

  const HistoryData(
      {this.id,
      this.updatedAt,
      this.createdAt,
      this.deletedAt,
      this.status,
      this.typeTransaction,
      this.notes,
      this.amount,
      this.historyReceiverJson,
      this.historySenderJson});

  @override
  List<Object?> get props => [
        id,
        updatedAt,
        createdAt,
        deletedAt,
        status,
        typeTransaction,
        notes,
        amount,
        historyReceiverJson,
        historySenderJson,
      ];

  factory HistoryData.fromDTO(HistoryDataJson? dto) => HistoryData(
        id: dto?.id,
        updatedAt: dto?.updatedAt,
        createdAt: dto?.createdAt,
        deletedAt: dto?.deletedAt,
        status: dto?.status,
        typeTransaction: dto?.typeTransaction,
        notes: dto?.notes,
        amount: dto?.amount,
        historyReceiverJson: dto?.receiver,
        historySenderJson: dto?.sender,
      );
}

class HistoryReceiver extends Equatable {
  final int? id;
  final String? updatedAt, createdAt, deletedAt, email, name;

  const HistoryReceiver(
      {this.id,
        this.updatedAt,
        this.createdAt,
        this.deletedAt,
        this.email,
        this.name,});

  @override
  List<Object?> get props => [
    id,
    updatedAt,
    createdAt,
    deletedAt,
    email,
    name,
  ];

  factory HistoryReceiver.fromDTO(HistoryReceiverJson? dto) => HistoryReceiver(
    id: dto?.id,
    updatedAt: dto?.updatedAt,
    createdAt: dto?.createdAt,
    deletedAt: dto?.deletedAt,
    email: dto?.email,
    name: dto?.name,
  );
}

class HistorySender extends Equatable {
  final int? id;
  final String? updatedAt, createdAt, deletedAt, email, name;

  const HistorySender(
      {this.id,
        this.updatedAt,
        this.createdAt,
        this.deletedAt,
        this.email,
        this.name,});

  @override
  List<Object?> get props => [
    id,
    updatedAt,
    createdAt,
    deletedAt,
    email,
    name,
  ];

  factory HistorySender.fromDTO(HistorySenderJson? dto) => HistorySender(
    id: dto?.id,
    updatedAt: dto?.updatedAt,
    createdAt: dto?.createdAt,
    deletedAt: dto?.deletedAt,
    email: dto?.email,
    name: dto?.name,
  );
}
