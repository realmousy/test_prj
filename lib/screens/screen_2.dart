import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_prj/constant/dimensions.dart';
import 'package:test_prj/constant/theme.dart';
import 'package:test_prj/constant/theme/colors.dart';

import '../providers/horizontal_items.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  HorizontalItemsProvider horizontalItemsProvider;
  VerticalItemsProvider verticalItemsProvider;
  @override
  void initState() {
    horizontalItemsProvider = HorizontalItemsProvider();
    verticalItemsProvider = VerticalItemsProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ProjectColor.white,
      child: Column(
        children: [
          const Gap(30, color: ProjectColor.backgroundColor),
          Padding(
            padding: ProjectDimensions.pagePadding,
            child: Material(
              color: ProjectColor.backgroundColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: ProjectColor.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          ChangeNotifierProvider.value(
              value: horizontalItemsProvider,
              builder: (_, child) {
                return Flexible(
                  flex: 2,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: ProjectDimensions.containerPadding,
                            child: Text(
                              """Section 1 (${horizontalItemsProvider.itemsCount})""",
                              style: theme.textTheme.headline6,
                            )),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: ProjectColor.white,
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: ProjectDimensions.pagePadding,
                                  child: Material(
                                    color: ProjectColor.white,
                                    borderRadius:
                                        ProjectDimensions.borderRadius,
                                    elevation: 5,
                                    child: Center(
                                      child: Text(
                                          horizontalItemsProvider
                                              .generateItemAt(index),
                                          style: theme.textTheme.headline6),
                                    ),
                                  ),
                                );
                              },
                              itemCount: horizontalItemsProvider.itemsCount,
                            ),
                          ),
                        ),
                      ]),
                );
              }),
          ChangeNotifierProvider.value(
            value: verticalItemsProvider,
            builder: (_, child) {
              return child;
            },
            child: Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: ProjectDimensions.containerPadding,
                    child: Text(
                      """Section 2 (${verticalItemsProvider.itemsCount})""",
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            return Container(
                              padding: ProjectDimensions.containerPadding,
                              constraints: BoxConstraints(
                                  maxHeight: constraints.maxHeight / 2.5),
                              child: Material(
                                color: ProjectColor.white,
                                borderRadius: ProjectDimensions.borderRadius,
                                elevation: 5,
                                child: Center(
                                  child: Text(
                                      verticalItemsProvider
                                          .generateItemAt(index),
                                      style: theme.textTheme.headline6),
                                ),
                              ),
                            );
                          },
                          itemCount: verticalItemsProvider.itemsCount,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
