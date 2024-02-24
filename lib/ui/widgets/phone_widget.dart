import 'package:flutter/material.dart';

import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<PhoneProvider>(context, listen: false);
    return Container(
        color: const Color(0xfff4f8fc),
        child: Center(
            child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/svg/phone.svg",
              height: 627,
              width: 299.74,
            ),
            Positioned(
              top: 28,
              left: 9.80,
              child: Container(
                width: 278.74,
                height: 576,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        )));
  }
}
