import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/common/colors.dart';
import 'package:flutter_map/presentation/product/detail/widget/product_dettail_header_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/infrastructure/product/data/product_fake_1.dart';
import 'package:flutter_map/presentation/component/show_up_text_animation.dart';
import 'package:flutter_map/presentation/partner/detail/cubit/partner_detail_transition_app_bar_cubit.dart';
import 'package:flutter_map/presentation/partner/detail/widget/partner_dettail_header_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductDetaiWidget extends StatefulWidget {
  const ProductDetaiWidget(
      {Key? key, required this.index, required this.controller})
      : super(key: key);

  final int index;
  final ScrollController controller;

  @override
  State<ProductDetaiWidget> createState() => _ProductDetaiWidgetState();
}

class _ProductDetaiWidgetState extends State<ProductDetaiWidget>
    with WidgetsBindingObserver {
  double? _heightImage;
  double? _heightAppBar;
  double? _heightStatusBar;
  double? _heightIconBackArrow;
  List<Widget> _widgets = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    iterateJson();

    super.initState();
  }

  @override
  void didChangeMetrics() {
    orientationChanged();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  iterateJson() {
    (PRODUCT_FAKE_DATA_00001[widget.index]["description"]
            as Map<String, dynamic>)
        .forEach((key, value) {
      _widgets.add(Text(
        key,
        style: TextStyle(fontSize: 15, color: Colors.blue),
      ));

      _widgets.add(SizedBox(
        height: 10,
      ));

      (value as Map<String, dynamic>).forEach((key2, value2) {
        _widgets.add(Container(
          //color: Color.fromARGB(255, 231, 230, 227),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                key2,
                style: TextStyle(fontSize: 13),
              ),
              // SizedBox(
              //   width: 10.0,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  value2,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ));
      });
      _widgets.add(SizedBox(
        height: 10,
      ));
    });
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
  // void didUpdateWidget(covariant ProductDetaiWidget oldWidget) {
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
                              PRODUCT_FAKE_DATA_00001[widget.index]["name"]
                                  .toString(),
                              key: const Key('product_detail'),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ),
                        )
                      : Container(),
                );
              },
            )),
        bottomSheet: Container(
          color: Colors.white,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 1,
              child: Icon(
                Icons.favorite_outline_outlined,
                //color: Colors.pink,
                size: 24.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.shopping_cart_outlined,
                //color: Colors.pink,
                size: 30.0,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(59, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: AppColors.itemCardBuyButtonColor,
                    ),
                    onPressed: () async {
                      _controller.text = "1";
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          context: context,
                          isScrollControlled: true, // Important
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min, // Important
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/products/" +
                                            PRODUCT_FAKE_DATA_00001[
                                                    widget.index]["itemId"]
                                                .toString() +
                                            ".jpg",
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          PRODUCT_FAKE_DATA_00001[widget.index]
                                                  ["name"]
                                              .toString(),
                                          key: const Key('product_detail'),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: 30.0,
                                            height: 30.0,
                                            child: const Text(
                                              "Jumlah",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScopeNode
                                                        currentFocus =
                                                        FocusScope.of(context);

                                                    if (!currentFocus
                                                        .hasPrimaryFocus) {
                                                      currentFocus.unfocus();
                                                    }
                                                    if (int.parse(_controller
                                                                .text) >
                                                            1 &&
                                                        _controller.text !=
                                                            "") {
                                                      _controller.text =
                                                          (int.parse(_controller
                                                                      .text) -
                                                                  1)
                                                              .toString();
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    //color: Colors.pink,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 30.0,
                                                  height: 50.0,
                                                  child: TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: _controller,
                                                    // obscureText: true,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScopeNode
                                                        currentFocus =
                                                        FocusScope.of(context);

                                                    if (!currentFocus
                                                        .hasPrimaryFocus) {
                                                      currentFocus.unfocus();
                                                    }
                                                    if (_controller.text !=
                                                        "") {
                                                      _controller.text =
                                                          (int.parse(_controller
                                                                      .text) +
                                                                  1)
                                                              .toString();
                                                    } else {
                                                      _controller.text = "1";
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    //color: Colors.pink,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(size.width, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          primary:
                                              AppColors.itemCardBuyButtonColor,
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "B e l i",
                                          style: TextStyle(fontSize: 17.0),
                                        )),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: const Text(
                      "B e l i",
                      style: TextStyle(fontSize: 17.0),
                    )),
              ),
            )
          ]),
          height: 60,
          width: MediaQuery.of(context).size.width,
        ),
        body: CustomScrollView(
          controller: widget.controller,
          slivers: [
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  "assets/images/products/" +
                      PRODUCT_FAKE_DATA_00001[widget.index]["itemId"]
                          .toString() +
                      ".jpg",
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
              child: ProductDetailHeaderWidget(
                index: widget.index,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _widgets,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 60),
            ),
          ],
        ));
  }
}
