import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api/authentication_api.dart';
import 'package:news/screens/home_screen.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  AuthenticationAPI authenticationAPI = AuthenticationAPI();
  bool isLoading = false;
   bool loginError =false;
   TextEditingController _usernameController;
   TextEditingController _passwordController;
   @override
   String username;
  String password;
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

@override
  void dispose() {
    // TODO: implement dispose
  _usernameController.dispose();
  _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('login'),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child:(isLoading) ? _drawLoading() : _drawLoginForm()
      )
    );
  }
  Widget _drawLoginForm(){
    if(loginError){
      return Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('login failed'),
              RaisedButton(onPressed: (){
                setState(() {
                  loginError = false;
                });
              },child: Text('try again',style: TextStyle(
              color:  Colors.black
              ),) ,)
            ],
          ),
        ) ,
      );
    }
return Form(
    key: _formKey,
    child: Column(
      children: <Widget>[
        TextFormField(
          controller: _usernameController,
          decoration: InputDecoration(

              labelText: 'username'
          ),
          validator: (value){
            if(value.isEmpty){
              return 'please enter your username';
            }
            return null;
          },
        ),
        SizedBox(height: 48,),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              labelText: 'password'
          ),
          validator: (value){
            if(value.isEmpty){
              return 'please enter your username';
            }
            return null;
          },
        ),
        SizedBox(

          width: double.infinity,

          child: RaisedButton(

            child: Text('login',style:TextStyle(color: Colors.black) ,),
            onPressed: ()async {
              if(_formKey.currentState.validate()){
                //TODO : CALL API
                setState(() {
                  isLoading =true;
                });

                username = _usernameController.value.text;
                password = _passwordController.value.text;
             var response = await  authenticationAPI.login(
                 username, password);
            if(response){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeScreen();
              }));
            }else{
               loginError ==true;
            }
            setState(() {
                  isLoading =false;
                });
              }else{
                setState(() {
                  isLoading =false;
                });
              }
            },

          ),
        )

      ],
    ));
  }
  Widget _drawLoading(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ) ,
    );

  }

}
