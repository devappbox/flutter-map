import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/presentation/partner/detail/screen/partner_dettail_screen.dart';
import 'package:flutter_map/presentation/partner/sliding_panel/bloc/partner_sliding_panel_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnerdetailHeaderWidget extends StatefulWidget {
  final Partner partner;
  PartnerdetailHeaderWidget({
    Key? key,
    required this.partner,
  }) : super(key: key);

  @override
  State<PartnerdetailHeaderWidget> createState() =>
      _PartnerdetailHeaderWidgetState();
}

class _PartnerdetailHeaderWidgetState extends State<PartnerdetailHeaderWidget> {
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

    double distanceInMeters = Geolocator.distanceBetween(
                me, me1, widget.partner.latitude, widget.partner.longitude)
            .round() /
        1000;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      style: TextStyle(fontSize: 20.0, color: Colors.blue),
                    ),
                  ),
                  //Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _openwhatsapp(widget.partner.phoneNumber),
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
                        onTap: () => launchUrl(
                            Uri.parse("tel:/" + widget.partner.phoneNumber)),
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
              height: 15.0,
            ),
            Text(
              widget.partner.address,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
            SizedBox(
              height: 5.0,
            ),
            Wrap(
              children: [
                Text(
                  "Distance",
                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                ),
                Text(
                  " $distanceInMeters Km",
                  style: TextStyle(fontSize: 13.0, color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              widget.partner.phoneNumber,
              style: TextStyle(fontSize: 13.0, color: Colors.blue),
            ),
            SizedBox(
              height: 0.0,
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
                                color: Color.fromARGB(255, 33, 243, 121)),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "-",
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Close",
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.black),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text(
                            widget.partner.openAt,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "-",
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            widget.partner.closeAt,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
