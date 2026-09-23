import 'package:covid19app/View/world_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String img;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered;

  DetailScreen(
    {required this.name,
    required this.img,  
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,}
    );

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( widget.name,),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
            child: Card(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .06,),
                  ReusableRow(title: 'Total Cases', value: widget.totalCases.toString()),
                  ReusableRow(title: 'Total Deaths', value: widget.totalDeaths.toString()),
                  ReusableRow(title: 'Total Recovered', value: widget.totalRecovered.toString()),
                  ReusableRow(title: 'Active', value: widget.active.toString()),
                  ReusableRow(title: 'Critical', value: widget.critical.toString()),
                  ReusableRow(title: 'Today Recovered', value: widget.todayRecovered.toString()),
                ],
              ),
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(widget.img),
          ),
          ],
      
          ),
        ],
      ),
      
    );
  }
}