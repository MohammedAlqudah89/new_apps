import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/shared/component/default_component.dart';

import '../../../layout/shop_layout/cubit/cubit.dart';
import '../../../layout/shop_layout/cubit/states.dart';
import '../../../layout/shop_layout/shop_layout.dart';
import '../../../shared/component/constant.dart';
import '../../../shared/network/local/cached_helper.dart';
import '../login/login_screen.dart';

class ShopRegisterScreen extends StatelessWidget
{

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer <ShopCubit, ShopStates>(
      listener: (context, state)
      {
        if (state is ShopSuccessRegisterState) {
          if (state.model.status)
          {
            print(state.model.message);
            CachedHelper.saveData(key: 'token', value: state.model.data!.token).then
              ((value) {
              token = state.model.data!.token;
              toastBuilder(message: state.model.message!, state: ToastState.SUCCESS);
              print(state.model.data!.token);
              navigateAndFinish(context,  ShopLoginScreen());
            });

          }
          else
          {
            print(' ${state.model.message}');
            toastBuilder(message: state.model.message!, state: ToastState.ERROR);
          }
        }


      } ,
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Register Screen'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    defaultTextFormField(
                        type: TextInputType.text,
                        controller: nameController,
                        prefix: Icons.person_pin,
                        validate: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return 'required!';
                          }
                          return null;
                        },
                        label: 'Name'),
                    const SizedBox(height: 20.0,),
                    defaultTextFormField(
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        prefix: Icons.email,
                        validate: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return 'required!';
                          }
                          return null;
                        },
                        label: 'Email Address'),
                    const SizedBox(height: 20.0,),
                    defaultTextFormField(
                        type: TextInputType.visiblePassword,
                        controller: passwordController,
                        prefix: Icons.lock,
                        isPassword: true,
                        validate: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return 'required!';
                          }
                          return null;
                        },
                        label: 'Password'),
                    const SizedBox(height: 20.0,),
                    defaultTextFormField(
                        type: TextInputType.phone,
                        controller: phoneController,
                        prefix: Icons.phone,
                        validate: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return 'required!';
                          }
                          return null;
                        },
                        label: 'Phone number'),
                    const SizedBox(height: 20.0,),
                    defaultButton(
                      radius: 20.0,
                      function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          ShopCubit.get(context).postRegisterData(
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              password: passwordController.text,
                          );
                        }
                      },
                      text: 'Register Now',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } ,

    );
  }

}