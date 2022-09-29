import 'package:flutter_map/application/partner/i_partner_service.dart';
import 'package:flutter_map/application/partner/partner_service.dart';
import 'package:flutter_map/domain/partner/repository/i_partner_repository.dart';
import 'package:flutter_map/infrastructure/partner/data_source/api/partner_data_source_api.dart';
import 'package:flutter_map/infrastructure/partner/repository/partner_repository.dart';
import 'package:flutter_map/infrastructure/service/geo_injectable_module.dart';
import 'package:flutter_map/presentation/cart/cubit/cart_cubit.dart';
//import 'package:flutter_map/presentation/merchant/map/bloc/merchant_pick_up_location_bloc.dart';
import 'package:flutter_map/presentation/partner/list/bloc/partner_list_bloc.dart';
import 'package:flutter_map/presentation/partner/list/cubit/partner_list_cubit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g) {
  //final geoInjectableModule = _$GeoInjectableModule();
  //g.registerLazySingleton<Geolocator>(() => geoInjectableModule.geolocator);
  // g.registerLazySingleton<MerchantPickUpLocationBloc>(
  //     () => MerchantPickUpLocationBloc());

  g.registerLazySingleton<PartnerDataSourceApi>(() => PartnerDataSourceApi());
  g.registerLazySingleton<IPartnerRepository>(
      () => PartnerRepository(partnerDataSourceApi: g()));
  g.registerLazySingleton<IPartnerService>(
      () => PartnerService(partnerRepository: g()));
  g.registerLazySingleton<PartnerListCubit>(
      () => PartnerListCubit(partnerService: g()));
  g.registerLazySingleton<PartnerListBloc>(
      () => PartnerListBloc(partnerListCubit: g()));
  g.registerLazySingleton<CartCubit>(() => CartCubit());
}

class _$GeoInjectableModule extends GeoInjectableModule {}
