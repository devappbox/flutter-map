import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/product/detail/screen/product_dettail_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/infrastructure/product/data/product_fake_1.dart';
import 'package:flutter_map/presentation/component/show_up_text_animation.dart';
import 'package:flutter_map/presentation/partner/detail/cubit/partner_detail_transition_app_bar_cubit.dart';
import 'package:flutter_map/presentation/partner/detail/widget/partner_dettail_header_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PartnerDetaiWidget extends StatefulWidget {
  const PartnerDetaiWidget(
      {Key? key, required this.partner, required this.controller})
      : super(key: key);

  final Partner partner;
  final ScrollController controller;

  @override
  State<PartnerDetaiWidget> createState() => _PartnerDetaiWidgetState();
}

class _PartnerDetaiWidgetState extends State<PartnerDetaiWidget>
    with WidgetsBindingObserver {
  double? _heightImage;
  double? _heightAppBar;
  double? _heightStatusBar;
  double? _heightIconBackArrow;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void didChangeMetrics() {
    orientationChanged();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  orientationChanged() async {
    final mq = MediaQuery.of(context);
    _heightImage = mq.size.height * 0.3;
    _heightStatusBar = mq.viewPadding.top;
    _heightAppBar = 50;
    _heightIconBackArrow = 5;

    BlocProvider.of<PartnerDetailTransititonAppBarCubit>(context).onRestarted(
        _heightImage ?? 0,
        _heightStatusBar ?? 0,
        _heightAppBar ?? 0,
        _heightIconBackArrow ?? 0);

    await Future.delayed(const Duration(milliseconds: 100));
    if (!mounted) return;
    BlocProvider.of<PartnerDetailTransititonAppBarCubit>(context).onScroll();
  }

  // @override
  // void didUpdateWidget(covariant PartnerDetaiWidget oldWidget) {
  //   int? index = BlocProvider.of<CartBloc>(context)
  //       .state
  //       .carts
  //       ?.indexWhere((_cart) => _cart.item.id == widget.item.id);
  //   if (index != null) {
  //     if (index >= 0) {
  //       cart = BlocProvider.of<CartBloc>(context).state.carts![index];
  //     }
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = MediaQuery.of(context).size;
    final ort = MediaQuery.of(context).orientation;
    int? exp;
    if (ort == Orientation.portrait) {
      if (size.shortestSide < 600) {
        exp = 2;
      } else {
        exp = 4;
      }
    } else if (ort == Orientation.landscape) {
      if (size.shortestSide < 1200) {
        exp = 4;
      } else {
        exp = 6;
      }
    }

    double? exp1;
    if (ort == Orientation.portrait) {
      if (size.width < 600) {
        exp1 = size.width / 2.5;
      } else {
        exp1 = size.width / 4.5;
      }
    } else if (ort == Orientation.landscape) {
      if (size.width < 1200) {
        exp1 = size.width / 4.5;
      } else {
        exp1 = size.width / 6.5;
      }
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        //backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: PreferredSize(
            preferredSize:
                const Size.fromHeight(50.0), // here the desired height
            child: BlocBuilder<PartnerDetailTransititonAppBarCubit,
                PartnerDetailTransititonAppBarState>(
              buildWhen: ((p, c) {
                return p.builder != c.builder ||
                    p.builder1 != c.builder1 ||
                    p.builder2 != c.builder2;
              }),
              builder: (context, state) {
                return AppBar(
                  titleSpacing: 0.0,
                  toolbarOpacity: 1.0,
                  bottomOpacity: 0.5,
                  backgroundColor: state.builder == true
                      ? Color(0xFFFFFFFF)
                      : Color(0x00000000),
                  // systemOverlayStyle: SystemUiOverlayStyleApp.setSystemUIOverlayStyle(
                  //     _rebuild == true ? const Color(0xFFFFFFFF) : Colors.transparent,
                  //     Brightness.dark,
                  //     Brightness.dark),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: state.builder == true
                        ? Colors.white
                        : Colors.transparent,
                    //systemNavigationBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.dark,
                    systemNavigationBarIconBrightness: Brightness.dark,
                  ),
                  elevation: 0,
                  leading: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 0, top: 5, bottom: 5),
                    child: Container(
                      alignment: Alignment.center,
                      //height: 30,
                      //width: 30,
                      decoration: BoxDecoration(
                        color: state.builder2 == true
                            ? Color(0x00000000)
                            : Color(0xFFFFFFFF),
                        borderRadius: state.builder2 == true
                            ? null
                            : const BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.black, size: 25.0),
                        ),
                      ),
                    ),
                  ),
                  //actions: [],
                  title: state.builder1 == true
                      ? ShowUpAnimation(
                          curve: Curves.decelerate,
                          fadeBegin: 0.5,
                          offset: 0.3,
                          //delayStart: const Duration(milliseconds: 0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Text(
                              widget.partner.name,
                              key: const Key('partner_detail'),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ),
                        )
                      : Container(),
                );
              },
            )),
        //bottomSheet: PosCatalogItemDetailBottomSheetWidget(item: widget.item),
        body: CustomScrollView(
          controller: widget.controller,
          slivers: [
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  "assets/images/partners/merchant.jpg",
                  width: mq.size.width,
                  height: mq.size.height * 0.3,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            SliverToBoxAdapter(
              child: PartnerdetailHeaderWidget(
                partner: widget.partner,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 15.0),
                //height: 1000,
                child: Text(
                  "Produk Yang Ada Di Toko",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverAlignedGrid.count(
                crossAxisCount: exp ?? 2,
                itemCount: PRODUCT_FAKE_DATA_00001.length,
                itemBuilder: (context, index) {
                  String photo =
                      PRODUCT_FAKE_DATA_00001[index]["itemId"].toString() +
                          ".jpg";
                  String name =
                      PRODUCT_FAKE_DATA_00001[index]["name"].toString();

                  int price = int.parse(
                      PRODUCT_FAKE_DATA_00001[index]["price"].toString());

                  int stock = int.parse(
                      PRODUCT_FAKE_DATA_00001[index]["stock"].toString());

                  final disc = PRODUCT_FAKE_DATA_00001[index]["disc"];
                  double price1 = 0;
                  if (disc != null) {
                    int d = int.parse(
                        PRODUCT_FAKE_DATA_00001[index]["disc"].toString());
                    price1 = price - ((d / 100) * price);
                  }

                  // debugPrint(
                  //     "POS CATALOG LIST WIDGET VVVV ${state.items![index].id} ${state.items![index].name}");
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetaiScreen(
                                                  index: index,
                                                )),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Align(
                                                  child: Image.asset(
                                                    "assets/images/products/$photo",
                                                    gaplessPlayback: true,
                                                    fit: BoxFit.fill,
                                                    height: exp1,

                                                    // mq.orientation == Orientation.portrait
                                                    //     ? mq.size.width / 2.5
                                                    //     : mq.size.width / 4.5,
                                                    // width: mq.size.width / 2.1,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  name,
                                                  style: const TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 13.0),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),

                                                Wrap(children: [
                                                  const Text("Stok ",
                                                      style: TextStyle(
                                                          height: 1.2)),
                                                  Text("$stock",
                                                      style: const TextStyle(
                                                          color: Colors.blue,
                                                          height: 1.2))
                                                ]),

                                                Text(
                                                    NumberFormat.currency(
                                                            locale: 'id',
                                                            symbol: 'Rp ',
                                                            decimalDigits: 0)
                                                        .format(price),
                                                    style: TextStyle(
                                                        decoration: disc != null
                                                            ? TextDecoration
                                                                .lineThrough
                                                            : TextDecoration
                                                                .none,
                                                        color: disc == null
                                                            ? Colors.blue
                                                            : Colors.black38)),
                                                disc != null
                                                    ? Wrap(children: [
                                                        const Text("Disc ",
                                                            style: TextStyle(
                                                                height: 1.2)),
                                                        Text("$disc%",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    height:
                                                                        1.2))
                                                      ])
                                                    : Container(),
                                                disc != null
                                                    ? Text(
                                                        NumberFormat.currency(
                                                                locale: 'id',
                                                                symbol: 'Rp ',
                                                                decimalDigits:
                                                                    0)
                                                            .format(price1),
                                                        style: TextStyle(
                                                            color: Colors.blue))
                                                    : Container()

                                                // Wrap(
                                                //   children: [
                                                //     Wrap(
                                                //       children: [
                                                //         const Text("Disc ",
                                                //             style: TextStyle(
                                                //                 decoration: TextDecoration.underline,
                                                //                 height: 1.2)),
                                                //         (widget.item.sellDisc ?? 0)
                                                //                         .toString()
                                                //                         .split('.')[1]
                                                //                         .length ==
                                                //                     1 &&
                                                //                 (widget.item.sellDisc ?? 0)
                                                //                         .toString()
                                                //                         .split('.')[1] ==
                                                //                     '0'
                                                //             ? Text(
                                                //                 "${(widget.item.sellDisc ?? 0).toString().split('.')[0]}%",
                                                //                 style: const TextStyle(
                                                //                     color: Colors.blue, height: 1.2))
                                                //             : Text("${widget.item.sellDisc ?? 0}%",
                                                //                 style: const TextStyle(
                                                //                     color: Colors.blue, height: 1.2)),
                                                //       ],
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 10.0,
                                                //     ),
                                                //     const Text(
                                                //       "|",
                                                //       style: TextStyle(height: 1.2),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 10.0,
                                                //     ),
                                                //     Wrap(children: [
                                                //       const Text("Stok ",
                                                //           style: TextStyle(
                                                //               decoration: TextDecoration.underline,
                                                //               height: 1.2)),
                                                //       ((widget.item.stock ?? 0) - (pos?.qty ?? 0))
                                                //                       .toString()
                                                //                       .split('.')[1]
                                                //                       .length ==
                                                //                   1 &&
                                                //               ((widget.item.stock ?? 0) - (pos?.qty ?? 0))
                                                //                       .toString()
                                                //                       .split('.')[1] ==
                                                //                   '0'
                                                //           ? Text(
                                                //               ((widget.item.stock ?? 0) - (pos?.qty ?? 0))
                                                //                   .toString()
                                                //                   .split('.')[0],
                                                //               style: const TextStyle(
                                                //                   decoration: TextDecoration.underline,
                                                //                   height: 1.2,
                                                //                   color: Colors.blue))
                                                //           : Text(
                                                //               "${(widget.item.stock ?? 0) - (pos?.qty ?? 0)}",
                                                //               style: const TextStyle(
                                                //                   decoration: TextDecoration.underline,
                                                //                   height: 1.2,
                                                //                   color: Colors.blue)),
                                                //     ])
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // PosCatalogListCardButtonWidget(
                                //   item: widget.item,
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      disc != null
                          ? Positioned(
                              top: 15,
                              right: 15,
                              child: Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 195, 74, 98),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.withOpacity(0.5),
                                        offset: const Offset(0, 25),
                                        blurRadius: 3,
                                        spreadRadius: -10)
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Disc $disc%',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  );
                },
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 0.0,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
          ],
        ));
  }
}
