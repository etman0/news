import 'package:flutter/material.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController messageController;

  final _formKey= GlobalKey<FormState>();
  bool isLoading= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(16),
        child:(isLoading)? _loading():_contactForm()
      )
    );
  }
  Widget _contactForm(){
    return Form(
      key: _formKey ,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'your name',

            ),
            validator: (value){
              if(value.isEmpty){
                return 'please enter your name ';
              }else{
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'your email'
            ),
            validator: (value){
              if(value.isEmpty){
                return 'please enter your email ';
              }else{
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: messageController,
            decoration:InputDecoration(
                labelText: 'message'
            ) ,
            maxLines: 4,
            validator: (value){
              if(value.isEmpty){
                return 'write your message';
              }else{
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child:RaisedButton(child : Text('send message',
              style: TextStyle(color: Colors.redAccent),),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    String name = nameController.text;
                    String email = emailController.text;
                    String message= messageController.text;
                      setState(() {
                        isLoading = true;
                      });
                  }else{
                    setState(() {
                      isLoading = false;
                    });
                  }
                }) ,
          )
        ],
      ),
    );
  }
  Widget _loading(){
    return Container(
child: Center(
  child: CircularProgressIndicator()
),
    );
  }
}
