import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oop/ui/shared/CustomCard.dart';

const timePeriods = <String>['کل', 'روز', 'هفته', 'ماه', 'سفارشی'];

class TimePeriodSelector extends StatefulWidget {
  const TimePeriodSelector(
      {Key key,
      this.defaultTimePeriodSelected: 'کل',
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
                case 'کل':
                  start = DateTime(now.year - 300, now.month, now.day);
                  end = today;
                  break;
                case 'روز':
                  start = DateTime(now.year, now.month, now.day);
                  end = start.add(Duration(days: 1));
                  break;
                case 'هفته':
                  int days = now.weekday - 1;
                  start = now.subtract(Duration(days: days));
                  end = today;
                  break;
                case 'ماه':
                  int days = now.day - 1;
                  start = today.subtract(Duration(days: days));
                  end = today;
                  break;
                default:
                  start = widget.startDate;
                  end = widget.endDate;
              }

              widget.onChanged(start, end, selectedTimePeriod);
            },
            items: timePeriods
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                        // textDirection: TextDirection.RTL,
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
          if (selectedTimePeriod == 'سفارشی') SizedBox(width: 15),
          if (selectedTimePeriod == 'سفارشی')
            DatePickerButton(
              title: 'From',
              selectedDate: widget.startDate,
              onChanged: (date) {
                setState(() {
                  widget.onChanged(date, widget.endDate, selectedTimePeriod);
                });
              },
            ),
          if (selectedTimePeriod == 'سفارشی') SizedBox(width: 15),
          if (selectedTimePeriod == 'سفارشی')
            DatePickerButton(
              title: 'To',
              selectedDate: widget.endDate,
              onChanged: (date) {
                setState(() {
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
