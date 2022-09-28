import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/presentation/partner/list/bloc/partner_list_bloc.dart';
import 'package:flutter_map/presentation/partner/sliding_panel/bloc/partner_sliding_panel_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PartnerMapWidget extends StatefulWidget {
  PartnerMapWidget({Key? key}) : super(key: key);

  @override
  State<PartnerMapWidget> createState() => _PartnerMapWidgetState();
}

class _PartnerMapWidgetState extends State<PartnerMapWidget> {
  late GoogleMapController _googleMapController;
  Completer<GoogleMapController> _controller = Completer();
  double _pad = 0.0;
  late LatLng _latlong;
  late LatLng _latlongOnMove;

  Set<Marker>? _markers = <Marker>{};
  BitmapDescriptor? myMarker;

  @override
  void initState() {
    super.initState();
    _latlong = LatLng(-6.1651366269863335, 106.87359415250097);
    _latlongOnMove = LatLng(-6.1651366269863335, 106.87359415250097);
  }

  @override
  void dispose() {
    _googleMapController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PartnerSlidingPanelBloc, PartnerSlidingPanelState>(
            listenWhen: (p, c) {
          return p.tap != c.tap;
        }, listener: (context, state) {
          debugPrint("$_latlong");
          _latlong = LatLng(state.latitude!, state.longitude!);
          _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(state.latitude!, state.longitude!),
                  zoom: 17)));

          _googleMapController
              .showMarkerInfoWindow(MarkerId(state.markerId ?? ""));
        }),
        BlocListener<PartnerSlidingPanelBloc, PartnerSlidingPanelState>(
            listenWhen: (p, c) {
          return p.expand != c.expand;
        }, listener: (context, state) async {
          final zoom = await _googleMapController.getZoomLevel();
          late double pad;
          if (state.expand == false) {
            pad = 0.0;
          } else {
            pad = 300.0;
          }
          // setState(() {
          //   _pad = pad;
          // });
          // await Future.delayed(Duration(milliseconds: 50));
          // _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          //     CameraPosition(target: _latlong, zoom: zoom)));
        })
      ],
      child: BlocBuilder<PartnerListBloc, PartnerListState>(
          builder: ((context, state) {
        return state.status.when(
            initial: () => Container(),
            success: (data) {
              //List<Marker> _markers = <Marker>[];

              return GoogleMap(
                onCameraMove: (position) {
                  _latlongOnMove = LatLng(
                      position.target.latitude, position.target.longitude);
                  debugPrint("S $_latlongOnMove");
                },
                onCameraIdle: () {
                  _latlong = _latlongOnMove;
                  debugPrint("SSS $_latlong");
                },
                buildingsEnabled: false,
                rotateGesturesEnabled: false,
                //myLocationEnabled: true,
                //myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(-6.1651366269863335, 106.87359415250097),
                  zoom: 14,
                ),
                markers: _markers!,
                padding: EdgeInsets.only(bottom: _pad),
                onMapCreated: (controller) async {
                  _googleMapController = controller;
                  _controller.complete(controller);
                  //await Future.delayed(Duration(milliseconds: 100));
                  _markers?.add(Marker(
                      onTap: () {},
                      //icon: BitmapDescriptor.hueAzure.round(),
                      markerId: MarkerId('myId'),
                      position: LatLng(-6.1651366269863335, 106.87359415250097),
                      infoWindow: InfoWindow(title: "I Am Here/My Location")));

                  data?.forEach((e) async {
                    myMarker = await BitmapDescriptor.fromAssetImage(
                      ImageConfiguration(size: Size(0.05, 0.05)),
                      "assets/images/winn1.jpg",
                    );
                    _markers?.add(Marker(
                        onTap: () {
                          _latlong = LatLng(e.latitude, e.longitude);
                          context.read<PartnerSlidingPanelBloc>()
                            ..add(TapMarkerPartnerSlidingPanelEvent(
                                markerId: e.id));
                        },
                        icon: myMarker!,
                        markerId: MarkerId(e.id),
                        position: LatLng(e.latitude, e.longitude),
                        infoWindow: InfoWindow(title: e.name)));
                  });

                  debugPrint("PARTNER MAP WIDGET ONMAPCREATED");

                  await Future.delayed(Duration(milliseconds: 100));
                  setState(() {});
                  _pad = 200;

                  await Future.delayed(Duration(milliseconds: 100));
                  _googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                          target:
                              LatLng(-6.1651366269863335, 106.87359415250097),
                          zoom: 14)));
                },
              );
            },
            loading: () => GoogleMap(
                  onCameraMove: (position) {
                    _latlongOnMove = LatLng(
                        position.target.latitude, position.target.longitude);
                    debugPrint("S $_latlongOnMove");
                  },
                  onCameraIdle: () {
                    debugPrint("LLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
                    _latlong = _latlongOnMove;
                    debugPrint("SSS $_latlong");
                  },
                  buildingsEnabled: false,
                  rotateGesturesEnabled: false,
                  //myLocationEnabled: true,
                  //myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-6.1651366269863335, 106.87359415250097),
                    zoom: 14,
                  ),
                  //markers: Set<Marker>.of(_markers),
                  padding: EdgeInsets.only(bottom: _pad),
                  onMapCreated: (controller) async {
                    _googleMapController = controller;
                    _controller.complete(controller);
                    await Future.delayed(Duration(milliseconds: 100));
                    // setState(() {});
                    // _pad = 200;

                    // await Future.delayed(Duration(milliseconds: 100));
                    // _googleMapController.animateCamera(
                    //     CameraUpdate.newCameraPosition(CameraPosition(
                    //         target:
                    //             LatLng(-6.1651366269863335, 106.87359415250097),
                    //         zoom: 14)));
                  },
                ),
            failure: (f) => GoogleMap(
                  onCameraMove: (position) {
                    _latlongOnMove = LatLng(
                        position.target.latitude, position.target.longitude);
                    debugPrint("S $_latlongOnMove");
                  },
                  onCameraIdle: () {
                    debugPrint("FFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
                    _latlong = _latlongOnMove;
                    debugPrint("SSS $_latlong");
                  },
                  buildingsEnabled: false,
                  rotateGesturesEnabled: false,
                  //myLocationEnabled: true,
                  //myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-6.1651366269863335, 106.87359415250097),
                    zoom: 14,
                  ),
                  //markers: Set<Marker>.of(_markers),
                  padding: EdgeInsets.only(bottom: _pad),
                  onMapCreated: (controller) async {
                    _googleMapController = controller;
                    _controller.complete(controller);
                    await Future.delayed(Duration(milliseconds: 100));
                    // setState(() {});
                    // _pad = 200;

                    // await Future.delayed(Duration(milliseconds: 100));
                    // _googleMapController.animateCamera(
                    //     CameraUpdate.newCameraPosition(CameraPosition(
                    //         target:
                    //             LatLng(-6.1651366269863335, 106.87359415250097),
                    //         zoom: 14)));
                  },
                ));
      })),
    );
  }
}
