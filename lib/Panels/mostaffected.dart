
import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget {

  final List mostaffected;

  const MostAffected({Key key, this.mostaffected}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index)
        {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            child: Row(
              children: <Widget>[

                Image.network(mostaffected[index]['countryInfo']['flag'],height: 45.0,),
                SizedBox(width: 20.0,),
                Text(mostaffected[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                SizedBox(width: 10.0,),
                Text("Deaths: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                Text( mostaffected[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.red),),

              ],
            ),
          );
        },
        itemCount:5,
      ),
    );
  }
}



