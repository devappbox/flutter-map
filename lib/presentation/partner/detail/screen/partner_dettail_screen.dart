import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/presentation/partner/detail/cubit/partner_detail_transition_app_bar_cubit.dart';
import 'package:flutter_map/presentation/partner/detail/widget/partner_dettail_widget.dart';

class PartnerDetaiScreen extends StatefulWidget {
  const PartnerDetaiScreen({Key? key, required this.partner}) : super(key: key);

  final Partner partner;

  @override
  State<PartnerDetaiScreen> createState() => _PartnerDetaiScreenState();
}

class _PartnerDetaiScreenState extends State<PartnerDetaiScreen> {
  final ScrollController controller = ScrollController();
  double? _heightImage;
  double? _heightAppBar;
  double? _heightStatusBar;
  double? _heightIconBackArrow;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _heightImage = MediaQuery.of(context).size.height * 0.3;
    _heightStatusBar = MediaQuery.of(context).viewPadding.top;
    _heightAppBar = 50;
    _heightIconBackArrow = 5;

    return BlocProvider(
      create: ((context) => PartnerDetailTransititonAppBarCubit(
            scrollController: controller,
          )..onRestarted(_heightImage ?? 0, _heightStatusBar ?? 0,
              _heightAppBar ?? 0, _heightIconBackArrow ?? 0)),
      child: PartnerDetaiWidget(
        partner: widget.partner,
        controller: controller,
      ),
    );
  }
}
