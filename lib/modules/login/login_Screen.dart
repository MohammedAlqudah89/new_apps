import 'package:flutter/material.dart';

import '../../shared/component/default_component.dart';

class LoginScreeen extends StatefulWidget
{
  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  var emailController= TextEditingController();

  var passController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,),
        title:  const Text(
          'Login Page',
          style: TextStyle(
            fontWeight: FontWeight.w200,
          ),
        ),
        actions: [

          IconButton(
              onPressed: (){
                print('Notifications');
              },
              icon:Icon(Icons.notification_important,)),
          IconButton(onPressed: (){
            print('Search');

          }, icon: Icon(Icons.search,),)
        ],

      ),
      body:Center(
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
               children:[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                  'Welcome to Login Page',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  ),
                ),
                 defaultTextFormField(
                   controller: emailController,
                   prefix: Icons.email_outlined,
                     type: TextInputType.emailAddress,
                     label: 'Email Address',

                     validate: (value)
                     {
                     if (value!.isEmpty)
                       {
                         return 'email must not be empty';
                       }
                     return '';
                     }


                 ),
                SizedBox(
                  height: 20.0,
                ),
                 defaultTextFormField(
                   controller: passController,
                   isPassword: isPassword,
                   type: TextInputType.visiblePassword,
                   prefix: Icons.lock,
                   suffix: isPassword ?Icons.visibility : Icons.visibility_off,
                   label: 'Password',
                   onPressedState: ()
                     {
                       setState(()
                       {

                           isPassword = !isPassword;

                       });
                     },
                   validate: ( value)
                     {
                       if(value!.isEmpty)
                         {
                           return 'password must not be empty';
                         }
                       return '';
                     }

                 ),
                SizedBox(
                  height: 10.0,
                ),
                 defaultButton(
                   radius: 5,
                   text: 'login',
                   function: ()
                     {
                       if(formKey.currentState!.validate()) {
                         print(emailController.text);
                         print(passController.text);
                       }
                     },
                 ),
                SizedBox(
                  height: 10.0,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('don\'t have an account,'
                      ),
                      TextButton(onPressed: (){
                        print('register');
                      },
                          child: Text('Register Now!'),
                      )
                    ],
                  ),
              ]
        ),
            ),
          ),
      ),
    )
    );
  }
}