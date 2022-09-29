import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/di/injection.dart';
import 'package:flutter_map/presentation/cart/cubit/cart_cubit.dart';
import 'package:flutter_map/presentation/common/colors.dart';
import 'package:flutter_map/presentation/partner/list/bloc/partner_list_bloc.dart';
import 'package:flutter_map/presentation/partner/list/cubit/partner_list_cubit.dart';
import 'package:flutter_map/presentation/partner/main/screen/partner_main_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureGetIt();

  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<PartnerListCubit>()),
      BlocProvider(
        create: (context) => getIt<PartnerListBloc>(),
        lazy: false,
      ),
      BlocProvider(create: (context) => getIt<CartCubit>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shops',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: ((context) => Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PartnerMainScreen()),
                    );
                  },
                  child: Icon(Icons.map_outlined),
                ),
                body: Container(),
              )),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PanelController panelController = PanelController();

  @override
  void dispose() {
    panelController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        onPanelOpened: () {
          debugPrint("EXPANDED");
        },
        header: Container(
          decoration: BoxDecoration(
              color: Colors.grey[50],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.00),
                  topLeft: Radius.circular(40.00))),
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              width: 65,
              height: 3,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        isDraggable: true,
        minHeight: 90,
        maxHeight: 400,
        //snapPoint: 0.5,
        //panelSnapping: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        //panelBuilder: (c) {
        //return
        panel: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: CustomScrollView(
                //controller: c,
                slivers: [
                  // SliverToBoxAdapter(
                  //   child: SizedBox(
                  //     height: 30,
                  //   ),
                  // ),
                  SliverPersistentHeader(
                      pinned: true,
                      //floating: true,
                      delegate: HomeMainOrderSearchDelegate()),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.green
                                : Colors.greenAccent,
                            height: 80,
                            alignment: Alignment.center,
                            child: Text(
                              "Item $index",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        );
                      },
                      // 40 list items
                      childCount: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //},
        body: GoogleMap(
          rotateGesturesEnabled: false,
          //myLocationEnabled: true,
          //myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(-6.1512628884473175, 106.89188416785417),
            zoom: 14,
          ),
          //markers: Set<Marker>.of(_markers),
          //padding: EdgeInsets.only(bottom: _pad, top: _pad1),
          onMapCreated: (controller) async {},
        ),
      ),
    );
  }
}

class HomeMainOrderSearchDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color.fromARGB(255, 250, 251, 251),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const HomeMainOrderSearch()
        ],
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class HomeMainOrderSearch extends StatefulWidget {
  const HomeMainOrderSearch({Key? key}) : super(key: key);

  @override
  State<HomeMainOrderSearch> createState() => _HomeMainOrderSearchState();
}

class _HomeMainOrderSearchState extends State<HomeMainOrderSearch> {
  late TextEditingController _controller;
  bool _textFilled = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[50],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.00),
                  topLeft: Radius.circular(40.00))),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_outlined,
                size: 25.0,
              ),
              // SizedBox(
              //   width: 2.0,
              // ),
              Expanded(
                //flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      focusNode: _focusNode,
                      onChanged: ((value) {
                        if (value.isNotEmpty) {
                          if (_textFilled == false) {
                            setState(() {
                              _textFilled = true;
                            });
                          }
                        } else {
                          if (_textFilled == true) {
                            setState(() {
                              _textFilled = false;
                            });
                          }
                        }
                      }),
                      onTap: () async {},
                      controller: _controller,
                      //autofocus: true,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        suffixIcon: _textFilled
                            ? GestureDetector(
                                onTap: () {
                                  _controller.text = "";
                                  FocusScope.of(context)
                                      .requestFocus(_focusNode);
                                  setState(() {
                                    _textFilled = false;
                                  });
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 23,
                                ))
                            : null,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search Our Shops...",
                        //hintTextDirection: TextDirection.ltr,
                        alignLabelWithHint: true,
                        hintStyle: const TextStyle(
                            fontSize: 13.0,
                            color: Color.fromARGB(255, 174, 173, 224)),
                        isDense: true,
                        contentPadding: const EdgeInsets.only(
                            top: 15), // control your hints text size
                        //contentPadding: const EdgeInsets.symmetric(vertical: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: AppColors.searchBorderSideColor,
                              width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.searchBorderSideColor,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: AppColors.searchBorderSideColor,
                              width: 0.5),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 12, top: 10),
                          child: Icon(Icons.search_outlined

                              // SvgPicture.asset(
                              //   "assets/icons/Search.svg",
                              // ),
                              ),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
