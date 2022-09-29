import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/exception/failure/failure_exceptions.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/presentation/common/state/state_status.dart';
import 'package:flutter_map/presentation/partner/list/cubit/partner_list_cubit.dart'
    as cbt;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import 'package:rxdart/rxdart.dart';

part 'partner_list_state.dart';
part 'partner_list_event.dart';
part 'partner_list_bloc.freezed.dart';

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

class PartnerListBloc extends Bloc<PartnerListEvent, PartnerListState> {
  cbt.PartnerListCubit partnerListCubit;
  PartnerListBloc({
    required this.partnerListCubit,
  })  : _partnerListCubit = partnerListCubit,
        super(PartnerListState.initial()) {
    _streamSubscription = _partnerListCubit.stream.listen((c) {
      c.status.maybeWhen(
          success: (r) => add(CollectPartnerListEvent(partners: r)),
          orElse: () => null);
    });

    on<ChangedKeyWordEvent>(_onChangedKeyWordEvent,
        transformer: debounce(const Duration(milliseconds: 100)));
    on<CollectPartnerListEvent>(_onCollectPartnerListEvent);
  }

  final cbt.PartnerListCubit _partnerListCubit;
  late StreamSubscription<cbt.PartnerListState> _streamSubscription;

  void _onChangedKeyWordEvent(
    ChangedKeyWordEvent event,
    Emitter<PartnerListState> emit,
  ) async {
    if (event.keyWord.isEmpty) {
      _partnerListCubit.state.status.maybeWhen(
          success: (data) async {
            emit(state.copyWith(status: const StateStatus.loading()));

            final me = -6.1651366269863335;
            final me1 = 106.87359415250097;

            List<Partner> r =
                List<Partner>.from(data == null ? [] : data.toList());

            r.sort((a, b) =>
                (Geolocator.distanceBetween(me, me1, a.latitude, a.longitude)
                            .round() /
                        1000)
                    .compareTo((Geolocator.distanceBetween(
                                me, me1, b.latitude, b.longitude)
                            .round() /
                        1000)));

            emit(state.copyWith(
                status: StateStatus.success(data: r.isEmpty ? null : r),
                isSearch: !state.isSearch));
          },
          orElse: () => null);
    } else {
      _partnerListCubit.state.status.maybeWhen(
          success: (data) async {
            emit(state.copyWith(status: const StateStatus.loading()));

            final me = -6.1651366269863335;
            final me1 = 106.87359415250097;
            List<Partner>? r = [];

            data?.forEach((e) {
              if (e.name.toLowerCase().contains(event.keyWord.toLowerCase())) {
                r.add(e);
              }
            });

            r.sort((a, b) =>
                (Geolocator.distanceBetween(me, me1, a.latitude, a.longitude)
                            .round() /
                        1000)
                    .compareTo((Geolocator.distanceBetween(
                                me, me1, b.latitude, b.longitude)
                            .round() /
                        1000)));

            emit(state.copyWith(
                status: StateStatus.success(data: r.isEmpty ? null : r),
                isSearch: !state.isSearch));
          },
          orElse: () => null);
    }
  }

  void _onCollectPartnerListEvent(
    CollectPartnerListEvent event,
    Emitter<PartnerListState> emit,
  ) async {
    emit(state.copyWith(status: const StateStatus.loading()));
    await Future.delayed(Duration(milliseconds: 1000));
    debugPrint("PARTNER LIST BLOC DATA ${event.partners}");

    final me = -6.1651366269863335;
    final me1 = 106.87359415250097;

    List<Partner> r = List<Partner>.from(
        event.partners == null ? [] : event.partners!.toList());

    r.sort((a, b) =>
        (Geolocator.distanceBetween(me, me1, a.latitude, a.longitude).round() /
                1000)
            .compareTo(
                (Geolocator.distanceBetween(me, me1, b.latitude, b.longitude)
                        .round() /
                    1000)));

    emit(state.copyWith(
        status: StateStatus.success(data: r.isEmpty ? null : r)));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
