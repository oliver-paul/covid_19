
import 'package:covid_19/singleFaq.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class faq_info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>single_faq()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                color: Colors.black,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("FAQ ",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white),),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                )),
          ),
          GestureDetector(
            onTap: (){
              launch("https://covid19responsefund.org/");
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                color: Colors.black,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("DONATE ",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white),),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                )),
          ),
          GestureDetector(
            onTap: (){
              launch("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                color: Colors.black,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("MYTH BUSTERS ",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white),),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
