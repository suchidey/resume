import 'package:cv/data/expertise.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/data.dart';
import '../misc/custom_theme.dart';
import '../misc/ui.dart';
import '../widget/page_title.dart';
import 'base_page.dart';

class ExpertisePage extends StatefulWidget {
  ExpertisePage(GlobalKey key) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ExpertisePageState();
  }
}

class ExpertisePageState extends State<ExpertisePage> {
  List<Expertise> _items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = allExpertise.all();
    });
  }

  TableRow _buildTableRow(Expertise item) {
    return TableRow(
        key: ValueKey(item.id),
        decoration: BoxDecoration(
          color: item.id == 0 ? theme.cellColor : theme.primaryColor,
        ),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              height: item.id == 0 ? constant.cellHeaderHeight : constant.cellHeight,
              child: Center(
                child: item.id == 0 ? ui.getH9b(item.level) : ui.getH9i(item.level),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              height: item.id == 0 ? constant.cellHeaderHeight : constant.cellHeight,
              child: Center(
                child: item.id == 0
                    ? ui.getH9b(item.header)
                    : Wrap(alignment: WrapAlignment.center, children: <Widget>[
                        Row(children: [
                          ...item.skills.expand((value) => [
                                SizedBox(height: 4.0),
                                // ui.getCard(
                                Row(
                                  children: [
                                    SizedBox(width: 4.0),
                                    ui.getH9bChip(value),
                                  ],
                                ),
                                // borderRadius: constant.radius6),
                                SizedBox(height: 4.0),
                              ])
                        ])
                      ]),
              ),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Padding(
        padding: constant.paddingSymmetric,
        child: LayoutBuilder(
          builder: (_, constrain) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[PageTitle(data.expertise), SizedBox(height: constant.padding18), getTable()],
            );
          },
        ),
      ),
    );
  }

  Widget getTable() {
    return Table(
      border: TableBorder.symmetric(
          //inside: BorderSide(color: theme.tertiaryColor, width: constant.border1),
          //outside: BorderSide(color: theme.tertiaryColor, width: constant.border1),
          ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      defaultColumnWidth: IntrinsicColumnWidth(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1), //FixedColumnWidth(constant.i128),
        1: MaxColumnWidth(FlexColumnWidth(3), FractionColumnWidth(0.8)),
      },
      // textDirection: TextDirection.rtl,
      textBaseline: TextBaseline.alphabetic, // Pass this argument when using [TableCellVerticalAlignment.fill]
      children: _items.map((item) => _buildTableRow(item)).toList(),
    );
  }
}
