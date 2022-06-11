import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/data.dart';
import '../data/education.dart';
import '../misc/custom_theme.dart';
import '../misc/ui.dart';
import '../widget/page_title.dart';
import 'base_page.dart';

class EducationPage extends StatefulWidget {
  EducationPage(GlobalKey key) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return EducationPageState();
  }
}

class EducationPageState extends State<EducationPage> {
  List<Education> _items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = allEducation.all();
    });
  }

  TableRow _buildTableRow(Education item) {
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
                child: item.id == 0 ? ui.getH9b(item.university) : ui.getH9i(item.university),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              height: item.id == 0 ? constant.cellHeaderHeight : constant.cellHeight,
              child: Center(
                child: item.id == 0 ? ui.getH9b(item.degree) : ui.getH9i(item.degree),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              height: item.id == 0 ? constant.cellHeaderHeight : constant.cellHeight,
              child: Center(
                child: item.id == 0 ? ui.getH9b(item.duration) : ui.getH9i(item.duration),
              ),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: LayoutBuilder(
        builder: (_, constrain) {
          return Padding(
            padding: constant.getPaddingPage(isTablet: constant.isTablet(constrain)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[PageTitle(data.education), SizedBox(height: constant.padding18), getTable()],
            ),
          );
        },
      ),
    );
  }

  Widget getTable() {
    return Table(
      border: TableBorder.symmetric(
        inside: BorderSide(color: theme.tertiaryColor, width: constant.border1),
        outside: BorderSide(color: theme.tertiaryColor, width: constant.border1),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      defaultColumnWidth: IntrinsicColumnWidth(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(3), //FixedColumnWidth(constant.i128),
        1: FlexColumnWidth(3),
        2: MaxColumnWidth(FlexColumnWidth(2), FractionColumnWidth(0.3)),
        3: FlexColumnWidth(2) //FixedColumnWidth(150),
      },
      // textDirection: TextDirection.rtl,
      textBaseline: TextBaseline.alphabetic, // Pass this argument when using [TableCellVerticalAlignment.fill]
      children: _items.map((item) => _buildTableRow(item)).toList(),
    );
  }
}
