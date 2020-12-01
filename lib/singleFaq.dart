import 'package:covid_19/colorsource.dart';
import 'package:flutter/material.dart';

class single_faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQ"),),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context,index){
            return (ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(
              fontSize: 19.0,fontWeight: FontWeight.bold,
            ),),children: [
              Text(DataSource.questionAnswers[index]['answer'],style: TextStyle(
                fontSize: 17.0, letterSpacing: 1.5,color: Colors.black,
              ),),
            ],));
          }
      ),
    );
  }
}
