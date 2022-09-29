import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/domain/exception/failure/failure_exceptions.dart';
import 'package:flutter_map/presentation/partner/list/cubit/partner_list_cubit.dart';
import 'package:flutter_map/presentation/partner/sliding_panel/widget/partner_sliding_panel_widget.dart';

class PartnerMainWidget extends StatefulWidget {
  const PartnerMainWidget({Key? key}) : super(key: key);

  @override
  State<PartnerMainWidget> createState() => _PartnerMainWidgetState();
}

class _PartnerMainWidgetState extends State<PartnerMainWidget> {
  @override
  void initState() {
    context.read<PartnerListCubit>()..onStarted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<PartnerListCubit, PartnerListState>(
          builder: ((context, state) {
        return state.status.when(
            initial: () => Container(),
            success: (data) => PartnerSlidingPanelWidget(),
            loading: () => Align(
                    child: Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.blue,
                  ),
                )),
            failure: (failure) => Align(
                    child: Text(
                  "Terjadi Kesalahan, ${FailureExceptions.getErrorMessage(failure)}",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.blue,
                  ),
                )));
      })),
    );
  }
}
