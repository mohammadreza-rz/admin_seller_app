import 'package:flutter/material.dart';
import 'package:oop/ui/shared/CustomCard.dart';

class DetailsCard extends StatefulWidget {
  DetailsCard(
    this.profit,
    this.income,
  );
  final int profit;
  final int income;
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
  final int profit;

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
            Text(
              '$profit',
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
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
  final int income;

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
            Text(
              '$income',
              style: TextStyle(
                letterSpacing: 1,
                // shadows: [globalBoxShadow],
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
