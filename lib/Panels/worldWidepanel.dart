import 'package:flutter/material.dart';

class worldWidepanel extends StatelessWidget
{
  final Map Dataset;

  const worldWidepanel({Key key, this.Dataset}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          statuspanel(title: 'Confirmed',count: Dataset['cases'].toString(),text_color: Colors.red[100],back_color: Colors.red),
          statuspanel(title: 'Active',count:Dataset['active'].toString(),text_color: Colors.blue[100],back_color: Colors.blue[900]),
          statuspanel(title: 'Recovered',count:Dataset['recovered'].toString(),text_color: Colors.greenAccent[100],back_color: Colors.green),
          statuspanel(title: 'Deaths',count: Dataset['deaths'].toString(),text_color: Colors.orange[50],back_color: Colors.orange),
          statuspanel(title: 'Today Cases',count: Dataset['todayCases'].toString(),text_color: Colors.grey[800],back_color: Colors.grey[400]),
          statuspanel(title: 'Today Recovered',count: Dataset['todayRecovered'].toString(),text_color: Colors.purple[100],back_color: Colors.purple),
          statuspanel(title: 'Today Deaths',count:Dataset['todayDeaths'].toString(),text_color: Colors.teal[100],back_color: Colors.teal[600]),
          statuspanel(title: 'Tests',count: Dataset['tests'].toString(),text_color: Colors.lightBlue,back_color: Colors.lightBlue[100]),

        ],
      ),
    );
  }
}

class statuspanel extends StatelessWidget
{

  final Color back_color;
  final Color text_color;
  final String title;
  final String count;

  const statuspanel({Key key, this.back_color, this.text_color, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10.0),
      height: 80.0,width: width/2,
      color: back_color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: text_color,
          ),),
          Text(count,style: TextStyle(
            fontSize: 18.0,
            color: text_color,
          ),),
        ],
      ),
    );
  }
}
