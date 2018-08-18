import 'package:banklist/model/bankmodel.dart';
import 'package:banklist/utils/theme.dart';
import 'package:flutter/material.dart';


class BankListItem extends StatelessWidget {
  final Bank bank;

  BankListItem(this.bank);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(bank.name),
        ),
        body: Column(
          children: <Widget>[
            Container(
                child: bankCard()
            ),
            SizedBox(
              height: 20.0,
            ),

            subCard(type: "EMI", pinColor: Colors.pinkAccent, amount: bank.emi),
            subCard(
                type: "Interest Rate",
                pinColor: Colors.blue,
                amount: bank.intrestRate),
            subCard(
                type: "Processing Fee",
                pinColor: Colors.deepOrange,
                 amount: bank.processing_fee),
            subCard(
                type: "Tenure", pinColor: Colors.green, amount: bank.tenure),
            SizedBox(height: 30.0,),
            RaisedButton(
                padding: const EdgeInsets.symmetric(horizontal: 36.0,vertical: 0.0),
                color:  Color.fromRGBO(95, 212, 104, 1.0),
                elevation: 4.0,
                child: new Text("Apply",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),),
                onPressed: (){},
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))
            )
            //Tenure Card
          ],
        ));
  }

  Widget bankCard(){
    return Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)),
        margin: new EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints.expand(height: 180.0),
          padding: EdgeInsets.all(16.0),
          height: 180.0,
          decoration: BoxDecoration(
            gradient: bank.gradientcolor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(bank.name, style: TextStyles.bankTitle),
              SizedBox(
                height: 50.0,
              ),
              Text("Loan Amount",
                  style: TextStyles.loanAmountTitle),
              SizedBox(
                height: 10.0,
              ),
              Text(bank.loanAmount, style: TextStyles.bankTitle),
            ],
          ),
        ));
  }


  Widget subCard({String type, String amount, Color pinColor}) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: new EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 12.0,
                    backgroundColor: pinColor,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(type,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0)),
                ],
              ),
            ),

            new Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(amount,
                    style: TextStyle(
                        color: Colors.blueGrey.shade700,
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
