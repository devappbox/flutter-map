import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/infrastructure/product/data/product_fake_1.dart';
import 'package:flutter_map/presentation/partner/detail/screen/partner_dettail_screen.dart';
import 'package:flutter_map/presentation/partner/sliding_panel/bloc/partner_sliding_panel_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailHeaderWidget extends StatefulWidget {
  final int index;
  ProductDetailHeaderWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ProductDetailHeaderWidget> createState() =>
      _ProductDetailHeaderWidgetState();
}

class _ProductDetailHeaderWidgetState extends State<ProductDetailHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    String photo =
        PRODUCT_FAKE_DATA_00001[widget.index]["itemId"].toString() + ".jpg";
    String name = PRODUCT_FAKE_DATA_00001[widget.index]["name"].toString();

    int price =
        int.parse(PRODUCT_FAKE_DATA_00001[widget.index]["price"].toString());

    int stock =
        int.parse(PRODUCT_FAKE_DATA_00001[widget.index]["stock"].toString());

    final disc = PRODUCT_FAKE_DATA_00001[widget.index]["disc"];
    debugPrint("$disc $name");
    double price1 = 0;
    if (disc != null) {
      int d =
          int.parse(PRODUCT_FAKE_DATA_00001[widget.index]["disc"].toString());
      price1 = price - ((d / 100) * price);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () async {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 17.0),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),

                              Wrap(children: [
                                const Text("Stok ",
                                    style: TextStyle(height: 1.2)),
                                Text("$stock",
                                    style: const TextStyle(
                                        color: Colors.blue, height: 1.2))
                              ]),

                              Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(price),
                                  style: TextStyle(
                                      decoration: disc != null
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                      color: disc == null
                                          ? Colors.blue
                                          : Colors.black38)),
                              disc != null
                                  ? Wrap(children: [
                                      const Text("Disc ",
                                          style: TextStyle(height: 1.2)),
                                      Text("$disc%",
                                          style: const TextStyle(
                                              color: Colors.blue, height: 1.2))
                                    ])
                                  : Container(),
                              disc != null
                                  ? Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(price1),
                                      style: TextStyle(color: Colors.blue))
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
              const SizedBox(height: 20),
              // PosCatalogListCardButtonWidget(
              //   item: widget.item,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
