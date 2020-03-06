import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email  = '';
  String _fecha  = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Caminar', 'Viajar' , 'Correr'];
  TextEditingController _inputFieldDateController = new TextEditingController();
  Locale swissFrench = Locale('es', 'PE');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la Persona',
        labelText: 'Nombre',
        helperText: 'Solo ingrese el nombre',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
        _nombre= valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Ingrese el Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor){
        setState(() {
        _email= valor;
        });
      },
    );
  }
  

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Ingrese el Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock_outline)
      ),
      onChanged: (valor){
        setState(() {
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  }

  _selectDate (BuildContext context) async{ 

    DateTime picked =await showDatePicker(
      context: context,
      initialDate : new DateTime.now(),
      firstDate : new DateTime(2018),
      lastDate : new DateTime(2021), 
      locale: new Locale('es')
    );

    if(picked !=null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    
    List<DropdownMenuItem<String>> lista =new List();
    
    _poderes.forEach((poder){
      lista.add( DropdownMenuItem(
        child: Text(poder),
        value: poder,
      )
      );
    });

    return lista;
  }

  Widget _crearDropDown(){
    return  Row(
      children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0,),
      Expanded(
              child: DropdownButton(
        value: _opcionSeleccionada,
        items: getOpcionesDropdown(),
        onChanged: (opt){
          setState(() {
            _opcionSeleccionada =opt;
          });
                       } 
        ),
      )
      ],
    );

     
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('El email es : $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
  
}