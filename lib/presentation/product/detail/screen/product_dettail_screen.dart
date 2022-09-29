import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/presentation/partner/detail/cubit/partner_detail_transition_app_bar_cubit.dart';
import 'package:flutter_map/presentation/partner/detail/widget/partner_dettail_widget.dart';
import 'package:flutter_map/presentation/product/detail/widget/product_dettail_widget.dart';

class ProductDetaiScreen extends StatefulWidget {
  const ProductDetaiScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<ProductDetaiScreen> createState() => _ProductDetaiScreenState();
}

class _ProductDetaiScreenState extends State<ProductDetaiScreen> {
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
      child: ProductDetaiWidget(
        index: widget.index,
        controller: controller,
      ),
    );
  }
}
