import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
   
      ),
      home: Example9(),
    );
  }
}

class Example9 extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Search App"),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      drawer: Drawer(),
    );
  }
}
class DataSearch extends SearchDelegate<String> {
  final cities =[
    "Callao",
    "Bellavista",
    "Carmen de La Legua",
    "La Perla",
    "La Punta",
    "Mi Perú",
    "Ventanilla",
    "Lima",
    "Ancón",
    "Ate",
    "Barranco",
    "Breña",
    "Carabayllo",
    "Cieneguilla",
    "Chaclacayo",
    "Chorrillos",
    "Comas",
    "El Agustino",
    "Independencia",
    "Jesús María",
    "La Molina",
    "La Victoria",
    "Lince",
    "Los Olivos",
    "Lurigancho",
    "Lurín",
    "Magdalena del Mar",
    "Miraflores",
    "Pachacámac",
    "Pucusana",
    "Pueblo Libre",
    "Puente Piedra",
    "Punta Hermosa",
    "Punta Negra",
    "Rímac",
    "San Bartolo",
    "San Borja",
    "San Isidro",
    "San Juan de Lurigancho",
    "San Juan de Miraflores",
    "San Luis",
    "San Martín de Porres",
    "San Miguel",
    "Santa Anita",
    "Santa María del Mar",
    "Santa Rosa",
    "Santiago de Surco",
    "Surquillo",
    "Villa El Salvador",
    "Villa María del Triunfo",
  ];

  final recentCities = [
    "San Juan de Lurigancho",
    "Carabayllo",
    "Pueblo Libre",
    "Los Olivos",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
   //actions for app bar
    return [IconButton(
        icon: Icon(Icons.clear),
        onPressed:  () {
      query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    onPressed: (){
        close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
    return Center(
      child: Container (
        height: 100.0,
        width: 100.0,
        child: Card (
          color:Colors.red,
          //shape: StadiumBorder(),
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show whn some one searches for something
    final suggestionList = query.isEmpty?recentCities
        :cities.where((p)=>p.startsWith(query)).toList();// filtra la busqueda

    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      onTap: (){
        showResults(context);
      },
      leading: Icon(Icons.location_city),
      title: RichText(text: TextSpan(
        text: suggestionList[index].substring(0,query.length),
        style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold),
        children: [TextSpan(
          text: suggestionList[index].substring(query.length),
          style: TextStyle(color: Colors.grey)
        )],
      ),
      ),
      //Text(suggestionList[index]),
    ),
      itemCount: suggestionList.length,
    );

  }
}
