import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/presentation/partner/detail/screen/partner_dettail_screen.dart';
import 'package:flutter_map/presentation/partner/sliding_panel/bloc/partner_sliding_panel_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnerSlidingPanelListCard extends StatefulWidget {
  final AutoScrollController autoScrollController;
  final Partner partner;
  final int index;
  PartnerSlidingPanelListCard(
      {Key? key,
      required this.autoScrollController,
      required this.partner,
      required this.index})
      : super(key: key);

  @override
  State<PartnerSlidingPanelListCard> createState() =>
      _PartnerSlidingPanelListCardState();
}

class _PartnerSlidingPanelListCardState
    extends State<PartnerSlidingPanelListCard> {
  _openwhatsapp(String n) async {
    var whatsapp = n;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";

    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      // if (await canLaunchUrl(Uri.parse(whatappURL_ios))) {
      await launchUrl(Uri.parse(whatappURL_ios));
      //} else {
      //ScaffoldMessenger.of(context)
      //  .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      //}
    } else {
      // android , web
      // if (await canLaunchUrl(Uri.parse(whatsappURl_android))) {
      await launchUrl(Uri.parse(whatsappURl_android));
      // } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      //}
    }
  }

  _openEmail() async {
    String email = Uri.encodeComponent("winnGasMerchant@gmail.com");
    String subject = Uri.encodeComponent("Hello Flutter");
    String body = Uri.encodeComponent("Hi! I'm Flutter Developer");
    print(subject); //output: Hello%20Flutter
    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (await launchUrl(mail)) {
      //email app opened
    } else {
      //email app is not opened
    }
  }

  _openPhoneCall(String n) async {}

  @override
  Widget build(BuildContext context) {
    final me = -6.1651366269863335;
    final me1 = 106.87359415250097;
    final mq = MediaQuery.of(context);

    double distanceInMeters = Geolocator.distanceBetween(
                me, me1, widget.partner.latitude, widget.partner.longitude)
            .round() /
        1000;
    return AutoScrollTag(
      controller: widget.autoScrollController,
      key: Key(widget.partner.id),
      index: widget.index,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            context.read<PartnerSlidingPanelBloc>().add(
                TapPartnerSlidingPanelEvent(
                    latitude: widget.partner.latitude,
                    longitude: widget.partner.longitude,
                    markerId: widget.partner.id));
          },
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.partner.name,
                          style: TextStyle(fontSize: 14.0, color: Colors.blue),
                        ),
                      ),
                      //Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                _openwhatsapp(widget.partner.phoneNumber),
                            child: Image.asset(
                              "assets/images/wa.png",
                              gaplessPlayback: true,
                              //fit: BoxFit.cover,
                              width: 35,
                              height: 35,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          GestureDetector(
                            onTap: () => launchUrl(Uri.parse(
                                "tel:/" + widget.partner.phoneNumber)),
                            child: Image.asset(
                              "assets/images/phone1.png",
                              gaplessPlayback: true,
                              //fit: BoxFit.cover,
                              width: 17,
                              height: 17,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          GestureDetector(
                            onTap: () => _openEmail(),
                            child: Image.asset(
                              "assets/images/email2.png",
                              gaplessPlayback: true,
                              //fit: BoxFit.cover,
                              width: 23,
                              height: 23,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              "assets/images/partners/merchant.jpg",
                              gaplessPlayback: true,
                              fit: BoxFit.fill,
                              width: mq.size.width / 4,
                              height: mq.size.width / 4,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.partner.address,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Wrap(
                            children: [
                              Text(
                                "Distance",
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.black),
                              ),
                              Text(
                                " $distanceInMeters Km",
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.blue),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            widget.partner.phoneNumber,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.blue),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: [
                                        Text(
                                          "Open",
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Color.fromARGB(
                                                  255, 33, 243, 121)),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "-",
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "Close",
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      children: [
                                        Text(
                                          widget.partner.openAt,
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "-",
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          widget.partner.closeAt,
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Spacer(),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PartnerDetaiScreen(
                                                  partner: widget.partner,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius: BorderRadius.circular(3),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                      255, 247, 250, 252)
                                                  .withOpacity(0.5),
                                              offset: const Offset(0, 25),
                                              blurRadius: 3,
                                              spreadRadius: -10)
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Detail',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
