import 'dart:convert';
import 'package:covid_19/Panels/FAQ.dart';
import 'package:covid_19/colorsource.dart';
import 'package:covid_19/regional_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Panels/mostaffected.dart';
import 'Panels/worldWidepanel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget
{
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{

  Map dataset;
  fetchWorldWideData()async{

    http.Response response= await http.get('https://corona.lmao.ninja/v2/all');

    setState(() {
      dataset= json.decode(response.body);
    });
  }

  List country_data;
  fetchCountryeData()async{

    http.Response response= await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');

    setState(() {
      country_data= json.decode(response.body);
    });
  }




  void initState()
  {
    fetchWorldWideData();
    fetchCountryeData();
    super.initState();
  }



  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Tracker App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Container(
              height: 75,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(DataSource.note, style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold, fontSize: 16)),

            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                SizedBox(width: 10.0),
                Text("Worldwide",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25.0,
                ),
                ),
                SizedBox(width: 150.0),

                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>regional_data() ));
                },
                  child: Text("Region", style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  ),
                ),
              ],
            ),

            Divider(height: 20.0,color: Colors.black,thickness: 1.5),

            dataset==null? CircularProgressIndicator():worldWidepanel(Dataset: dataset ),

            SizedBox(height: 10.0,),
            Padding(padding: EdgeInsets.all(10.0),

              child: Text('Most Affected Contries',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25.0,),
              ),
            ),

            country_data==null ?Container():MostAffected(mostaffected: country_data),

            SizedBox(height: 20.0,),
            faq_info(),
            SizedBox(height: 20.0,),

            Center(child: Text("We Fight COVID-19 Together.",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 15.0),),)
          ],
        ),
      ),
    );
  }
}
