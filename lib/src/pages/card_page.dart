import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body :
        ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
            SizedBox(height: 30.0,),
            _cardTipo1(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
            SizedBox(height: 30.0,),
            _cardTipo1(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
            SizedBox(height: 30.0,),
            _cardTipo1(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
            SizedBox(height: 30.0,),
            _cardTipo1(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
            SizedBox(height: 30.0,),
          ],
        ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo,color: Colors.black,),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Traineando para la entrevista ,aunque solo es modo ui xd :v'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                 child: Text('Cancelar'),
                 onPressed: (){

                 },
                 ),
              FlatButton(
                 child: Text('Okey'),
                 onPressed: (){

                 },
                 )
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo2(){
    final card= Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://community.adobe.com/legacyfs/online/1229106_landscape-16.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://community.adobe.com/legacyfs/online/1229106_landscape-16.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('I dont have idea ,what poner here')
            ),
        ],
      ),
    );

    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset( 2.0,10.0 )
          )
        ]
      ),
      //ClipRRect corta todo lo que sale del card o container
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );
  }
}