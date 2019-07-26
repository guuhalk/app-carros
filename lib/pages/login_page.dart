import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  
  final _loginController = TextEditingController( text: "");
  final _passwordController = TextEditingController(text: "");

  final GlobalKey<FormState> _formKey  = GlobalKey<FormState> ();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );  
  }


_body(BuildContext context){
  return Form(
    key: _formKey,
    child:Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 40, left: 40, right: 40 ),
      child: ListView(
        children: <Widget>[
          
         SizedBox(
            width: 130,
            height: 130,
            child:_img("logo"),
          ),

          SizedBox(
            height: 30,
          ),

          TextFormField(
            
            controller: _loginController,
            validator: _validaLogin,
            keyboardType: TextInputType.emailAddress,

            decoration: InputDecoration(
              labelText: "Login",
              hintText: "Digite o login",
              labelStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                fontSize: 20
              )
            ),

            style: TextStyle(fontSize: 20),
          ),
        
          SizedBox(
            height: 30,
          ),

          TextFormField(
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            validator: _validaSenha,

            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Digite o password",
              labelStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                fontSize: 20
              )
            ),

            style: TextStyle(fontSize: 20),
          ),

          SizedBox(
            height: 30,
          ),

          Container(
            height: 60,
            alignment: Alignment.center,
            //color: Colors.blueGrey,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.15, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2196F3),
                  Color(0xFF0D47A1)
                ]
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),

            child: SizedBox.expand(
              child: FlatButton(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                
                onPressed: () =>_onClickLogin(context),
              ),
            )

          ),


          SizedBox(
            height: 20,
          ),

          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border(    
                bottom: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF))
              ),
              
            ),

            child:SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: <Widget>[
                    
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child:SizedBox( 
                        height: 20,
                        child:_img("google"),
                      ),
                    ),
                    
                      
                    Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),

                  ],
                ),

                onPressed: () => {},
              
              ),
            )
            
        ),

      ],
    ),
  )    
  );

}


  _img(String image){
    return Container (
      child: Image.asset("assets/images/"+image+".png"),
    );
  }


  String _validaLogin(String text){
    if(text.isEmpty){
      return "Informe o login";
    }
  }

  String _validaSenha(String text){
    if(text.isEmpty){
      return "Informe o password";
    }
    if(text.length <= 2){
      return "A senha precisa ter mais de 2 numeros";
    }

  }


  void _onClickLogin(BuildContext context){

    final login    = _loginController.text;
    final password = _passwordController.text; 

    if(!_formKey.currentState.validate()){
      return;
    }

    print("Login: $login  Senha: $password ");
  }

}