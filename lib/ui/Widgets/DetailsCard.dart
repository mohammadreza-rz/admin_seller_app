import 'package:flutter/material.dart';
import 'package:object_oriented_design_app/ui/shared/CustomCard.dart';

class DetailsCard extends StatefulWidget {
  DetailsCard(
    this.profit,
    this.income,
  );
  final String profit;
  final String income;
  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.profit == null || widget.income == null) return Container();
    return CustomCard(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _SalesDetailsCard(widget.income),
              _ProfitDetailsCard(widget.profit),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfitDetailsCard extends StatelessWidget {
  _ProfitDetailsCard(
    this.profit,
  );
  final String profit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Text(
              'سود',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 18,
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ریال ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$profit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesDetailsCard extends StatelessWidget {
  _SalesDetailsCard(
    this.income,
  );
  final String income;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Text(
              'فروش',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ریال ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$income',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
