import 'package:flutter/material.dart';
import 'package:object_oriented_design_app/core/GetProfit.dart';
import 'package:object_oriented_design_app/ui/Widgets/DetailsCard.dart';
import 'package:object_oriented_design_app/ui/Widgets/TimeSelector.dart';

class ShowProfitPage extends StatefulWidget {
  final String token;
  const ShowProfitPage({Key key, this.token}) : super(key: key);
  @override
  _ShowProfitPageState createState() => _ShowProfitPageState();
}

class _ShowProfitPageState extends State<ShowProfitPage> {
  static DateTime now = DateTime.now();
  DateTime startDate = DateTime(now.year - 300, now.month, now.day);
  DateTime endDate = now;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 17),
            TimePeriodSelector(
                startDate: startDate,
                endDate: endDate,
                onChanged: (pStartDate, pEndDate, _) {
                  setState(() {
                    startDate = pStartDate;
                    endDate = pEndDate;
                  });
                }),
            FutureBuilder(
                future: Back().GetProfit(startDate, endDate, widget.token),
                builder: (context, snap) {
                  if (snap != null && snap.hasData) {
                    String string = " " + snap.data.toString();
                    return DetailsCard(string, string);
                  } else {
                    return DetailsCard("", "");
                  }
                })
          ],
        ),
      ),
    );
  }
}
