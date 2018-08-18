import 'package:banklist/model/bankmodel.dart';
import 'package:banklist/ui/bankitem_page.dart';
import 'package:banklist/utils/theme.dart';
import 'package:flutter/material.dart';


class BankListPage extends StatefulWidget {
  List<Bank> bankLists = [
    Bank(
        id: "1",
        name: "Kotal Mahindra Bank",
        loanAmount: "₹ 250000",
        emi: "₹11732",
        intrestRate: "11.69 % ",
        processing_fee: "1.30 %",
        tenure: "2 years",
        gradientcolor: gradientBankCard(Color.fromRGBO(160, 71, 45, 1.0), Color.fromRGBO(221, 132, 58, 0.90))),
    Bank(
        id: "2",
        name: "Tata Capital",
        loanAmount: "₹ 250000",
        emi: "₹10552",
        intrestRate: "11.70 % ",
        processing_fee: "1.34 %",
        tenure: "2 years",
        gradientcolor: gradientBankCard(Color.fromRGBO(62, 130, 160, 1.0), Color.fromRGBO(70, 174, 232, 0.80))),
    Bank(
        id: "2",
        name: "RBL Bank",
        loanAmount: "₹ 250000",
        emi: "₹11037",
        intrestRate: "11.63 % ",
        processing_fee: "1.22 %",
        tenure: "2 years",
        gradientcolor: gradientBankCard(Color.fromRGBO(230, 79, 149, 1.0),  Color.fromRGBO(229, 79, 140, 0.80))),
  ];

  static LinearGradient gradientBankCard(Color startColor, Color endColor) {
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [startColor, endColor],
        stops: [0.0, 0.7]);
  }

  @override
  _BankListPageState createState() => _BankListPageState();
}

class _BankListPageState extends State<BankListPage> {

  List<Bank> bankLists;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bankLists =this.widget.bankLists;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Bank List"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: bankLists.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            margin: new EdgeInsets.all(8.0),
            child: Container(
              constraints: BoxConstraints.expand(height: 160.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(gradient: bankLists[index].gradientcolor,),
              height: 100.0,
              child: Container(

                child: Stack(
                  alignment:AlignmentDirectional.center ,
                  children: <Widget>[

                    //This Widget is for Bank Title (Top Start)
                    Align(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text(bankLists[index].name, style: TextStyles.bankTitle),
                          SizedBox(height: 50.0,),
                          Text("Loan Amount", style: TextStyles.loanAmountTitle),
                          SizedBox(height: 10.0,),
                          Text(bankLists[index].loanAmount, style: TextStyles.bankTitle),

                        ],
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),


                    //This Widget is for Apply button (Bottom End)
                    Align(
                      child: new RaisedButton(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0.0),
                          color: Colors.white,
                          elevation: 4.0,
                          child: new Text("Apply",style: TextStyles.applyButton,),
                          onPressed: (){

                            Navigator.push(context, new MaterialPageRoute(
                                builder: (BuildContext context) =>  BankListItem(bankLists[index]),
                            ));

                          },
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))
                      ),
                      alignment: AlignmentDirectional.bottomEnd,
                    ),

                    //This Widget is for LoanAmount Title and Loan Amount (Bottom Start)

                  ],

                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
