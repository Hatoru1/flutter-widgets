import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  final opciones =["uno","dos","tres","cuatro","cinco"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        // children: _crearItems()
        children: _crearItemsCorta(), 
      ),
    );
  }

  List<Widget> _crearItems(){
    
    List<Widget> lista =new List<Widget>();
    
    for(var opt in opciones){
      
      final tempWidget=ListTile(
        title: Text( opt ),
      );
      lista..add(tempWidget) 
      ..add(Divider(color: Colors.orange,));

    }
    
    return lista;
  }

  List<Widget> _crearItemsCorta(){
    
    return opciones.map( ( item ){
        return Column(
          children: <Widget>[
            ListTile(
              title: Text( item + ' ! '),
              subtitle: Text('Cualquier cosa'),
              leading: Icon(Icons.accessibility_new),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                
              },
            ),
            Divider(
              color: Colors.purpleAccent
            ),
          ],
        );
    }).toList();

  }
}