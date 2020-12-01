import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class regional_data extends StatefulWidget {
  @override
  _regional_dataState createState() => _regional_dataState();
}

class _regional_dataState extends State<regional_data> {

  List country_data;
  fetchCountryeData()async{

    http.Response response= await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');

    setState(() {
      country_data= json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Regional Statistics"),),
      body: country_data==null? Center(child: CircularProgressIndicator()):
      ListView.builder(
        itemBuilder: (context,index){
          return Card(
            child: Container(
                height: 150,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0, 10))]),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(horizontal:30.0 , vertical: 5.0),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            country_data[index]['country'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Image.network(
                            country_data[index]['countryInfo']['flag'],
                            height: 50,
                            width: 60,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(

                          child: Column(
                            children: <Widget>[
                              Text(
                                'Continent: ' +
                                    country_data[index]['continent'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                              Text(
                                'Population: ' +
                                    country_data[index]['population'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                              ),
                              Text(
                                'CONFIRMED: ' +
                                    country_data[index]['cases'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                'ACTIVE: ' +
                                    country_data[index]['active'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              Text(
                                'RECOVERED: ' +
                                    country_data[index]['recovered'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text(
                                'DEATHS: ' +
                                    country_data[index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                'TESTING: ' +
                                    country_data[index]['tests'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                            ],
                          ),
                        ))
                  ],
                )
            ),
          );
        },
        itemCount: country_data==null?0:country_data.length,
      ),
    );
  }
}
