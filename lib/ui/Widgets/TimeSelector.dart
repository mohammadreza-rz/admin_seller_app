import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:object_oriented_design_app/ui/shared/CustomCard.dart';

const timePeriods = <String>['Recent', 'Today', 'Week', 'Month', 'Custom'];

class TimePeriodSelector extends StatefulWidget {
  const TimePeriodSelector(
      {Key key,
      this.defaultTimePeriodSelected: 'Recent',
      this.startDate,
      this.endDate,
      this.onChanged})
      : super(key: key);
  final String defaultTimePeriodSelected;
  final DateTime startDate;
  final DateTime endDate;
  final void Function(
    DateTime startDate,
    DateTime endData,
    String selecteOption,
  ) onChanged;
  @override
  _TimePeriodSelectorState createState() => _TimePeriodSelectorState();
}

class _TimePeriodSelectorState extends State<TimePeriodSelector> {
  String selectedTimePeriod;
  @override
  void initState() {
    super.initState();
    selectedTimePeriod = widget.defaultTimePeriodSelected;
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            underline: SizedBox(),
            value: selectedTimePeriod,
            onChanged: (String value) {
              DateTime start, end;
              DateTime now = DateTime.now();
              DateTime today = DateTime(now.year, now.month, now.day + 1);
              setState(() => selectedTimePeriod = value);
              switch (value) {
                case 'Recent':
                  start = DateTime(now.year - 300, now.month, now.day);
                  end = today;
                  break;
                case 'Today':
                  start = DateTime(now.year, now.month, now.day);
                  end = start.add(Duration(days: 1));
                  break;
                case 'Week':
                  int days = now.weekday - 1;
                  start = now.subtract(Duration(days: days));
                  end = today;
                  break;
                case 'Month':
                  int days = now.day - 1;
                  start = today.subtract(Duration(days: days));
                  end = today;
                  break;
                default:
                  start = widget.startDate;
                  end = widget.endDate;
              }
              List<DateTime> list = new List();
              list.add(widget.startDate);
              list.add(widget.endDate);
              widget.onChanged(start, end, selectedTimePeriod);
            },
            items: timePeriods
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        textAlign: TextAlign.right,
                        // textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          if (selectedTimePeriod == 'Custom') SizedBox(width: 15),
          if (selectedTimePeriod == 'Custom')
            DatePickerButton(
              title: 'From',
              selectedDate: widget.startDate,
              onChanged: (date) {
                setState(() {
                  List<DateTime> list = new List();
                  list.add(date);
                  list.add(widget.endDate);
                  widget.onChanged(date, widget.endDate, selectedTimePeriod);
                });
              },
            ),
          if (selectedTimePeriod == 'Custom') SizedBox(width: 15),
          if (selectedTimePeriod == 'Custom')
            DatePickerButton(
              title: 'To',
              selectedDate: widget.endDate,
              onChanged: (date) {
                setState(() {
                  List<DateTime> list = new List();
                  list.add(widget.startDate);
                  list.add(date);
                  widget.onChanged(widget.startDate, date, selectedTimePeriod);
                });
              },
            ),
        ],
      ),
    );
  }
}

class DatePickerButton extends StatelessWidget {
  DatePickerButton({
    this.title,
    this.selectedDate,
    this.onChanged,
  });
  final String title;
  final DateTime selectedDate;
  final void Function(DateTime) onChanged;
  final dateFormat = DateFormat("yyyy/MM/dd");

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text('$title: ${dateFormat.format(selectedDate)}'),
      onPressed: () async {
        final DateTime date = await popDatePicker(context);
        if (date != null) onChanged(date);
      },
    );
  }

  popDatePicker(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
  }
}
