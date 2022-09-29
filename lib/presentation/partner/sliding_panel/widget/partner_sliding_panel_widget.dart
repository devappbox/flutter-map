import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_map/presentation/partner/list/bloc/partner_list_bloc.dart';
import 'package:flutter_map/presentation/partner/map/widget/partner_map_widget.dart';
import 'package:flutter_map/presentation/partner/sliding_panel/bloc/partner_sliding_panel_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../delegate/sliding_panel_search_delegate.dart';
import 'partner_sliding_panel_list_widget.dart';

class PartnerSlidingPanelWidget extends StatefulWidget {
  PartnerSlidingPanelWidget({Key? key}) : super(key: key);

  @override
  State<PartnerSlidingPanelWidget> createState() =>
      _PartnerSlidingPanelWidgetState();
}

class _PartnerSlidingPanelWidgetState extends State<PartnerSlidingPanelWidget> {
  PanelController _panelController = PanelController();
  final _scrollDirection = Axis.vertical;

  late AutoScrollController _autoScrollController;

  double _height = 355.0;

  double _width = 350.0;

  bool _expanded = false;

  bool _routeLocal = false;

  @override
  void initState() {
    super.initState();
    _autoScrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: _scrollDirection);
  }

  @override
  void dispose() {
    super.dispose();
    _autoScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PartnerSlidingPanelBloc, PartnerSlidingPanelState>(
            listenWhen: (p, c) => p.expand != c.expand,
            listener: (context, state) {
              if (state.expand == false) {
                _panelController.close();
              }
            }),
        BlocListener<PartnerSlidingPanelBloc, PartnerSlidingPanelState>(
            listenWhen: (p, c) => p.tapMarker != c.tapMarker,
            listener: (context, state) {
              context.read<PartnerListBloc>().state.status.maybeWhen(
                  success: (r) {
                    int? index = r?.indexWhere((e) => e.id == state.markerId);
                    if (index != null) {
                      if (index != -1) {
                        _autoScrollController.scrollToIndex(index,
                            preferPosition: AutoScrollPosition.begin);
                      }
                    }
                  },
                  orElse: () => null);
            })
      ],
      child: SlidingUpPanel(
        controller: _panelController,
        onPanelOpened: () => setState(() {
          _height = 700.0;
          _width = 350.0;
          _expanded = true;
          _routeLocal = true;
          ModalRoute.of(context)
              ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
            _routeLocal = false;
            _panelController.close();
          }));
        }),
        // context
        //     .read<PartnerSlidingPanelBloc>()
        //     .add(ExpandPartnerSlidingPanelEvent(expand: true)),
        onPanelClosed: () => setState(() {
          _height = 355.0;
          _width = 350.0;
          _expanded = false;
          if (_routeLocal == true) {
            _routeLocal = false;
            Navigator.of(context).pop();
          }
        }),
        //panelSnapping: true,
        //snapPoint: 0.5,
        // context
        //     .read<PartnerSlidingPanelBloc>()
        //     .add(ExpandPartnerSlidingPanelEvent(expand: false)),
        header: GestureDetector(
          onTap: () {
            if (_expanded == false)
              _panelController.open();
            else
              _panelController.close();
          },
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.00),
                        topLeft: Radius.circular(40.00))),
                width: MediaQuery.of(context).size.width,
                //height: 30,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 60,
                    child: ClipPath(
                      clipper: ArrowClipper(
                          30, 100, _expanded == false ? Edge.TOP : Edge.BOTTOM),
                      child: Container(
                        height: 30,
                        color: Color.fromARGB(255, 190, 185, 185),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isDraggable: true,
        minHeight: _width,
        maxHeight: _height,
        //MediaQuery.of(context).size.height - 50,
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
                controller: _autoScrollController,
                slivers: [
                  // SliverToBoxAdapter(
                  //   child: SizedBox(
                  //     height: 30,
                  //   ),
                  // ),
                  SliverPersistentHeader(
                      pinned: true,
                      //floating: true,
                      delegate: SlidingPanelSearchDelegate()),
                  PartnerSlidingPanelListWidget(
                      autoScrollController: _autoScrollController)
                ],
              ),
            ),
          ],
        ),
        //},
        body: PartnerMapWidget(),
      ),
    );
  }
}
