import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_apps/layout/shop_layout/shop_layout.dart';

// import 'package:new_apps/layout/shop_layout/shop_layout.dart';
// import 'package:new_apps/models/shop_model/shop_user_model.dart';
import 'package:new_apps/modules/shop_app/login/cubit/cubit.dart';
import 'package:new_apps/modules/shop_app/login/cubit/states.dart';
import 'package:new_apps/modules/shop_app/register/shop_register_screen.dart';
import 'package:new_apps/shared/component/constant.dart';
import 'package:new_apps/shared/component/default_component.dart';
import 'package:new_apps/shared/network/local/cached_helper.dart';

import '../page_view/on_boarding_screen.dart';

class ShopLoginScreen extends StatelessWidget {
  ShopLoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopSuccessUserLoginState) {
            if (state.loginModel.status)
            {
              print(state.loginModel.message);
              CachedHelper.saveData(key: 'token', value: state.loginModel.data.token).then
                ((value) {
                  token = state.loginModel.data.token;
                  print(state.loginModel.data.token);
                navigateAndFinish(context, const ShopLayoutScreen());
              });

            }
            else
            {
              print(' ${state.loginModel.message}');
              toastBuilder(message: state.loginModel.message, state: ToastState.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('LOGIN'),
              actions: [
                IconButton(onPressed: (){
                  CachedHelper.removeDate(key: 'onBoarding').then((value) {
                    navigateTo(context, OnBoardingScreen());
                  });
                }, icon: const Icon(Icons.arrow_back))
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Welcome To our Shop App , enjoy with our service',
                          style: TextStyle(
                            color: Colors.lightBlue.shade900,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        defaultTextFormField2(
                          type: TextInputType.text,
                          controller: emailController,
                          prefix: Icons.email_outlined,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please fill this field';
                            }
                            return null;
                          },
                          label: 'Email Address',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField2(
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          prefix: Icons.lock,
                          suffix: ShopLoginCubit.get(context).suffix,
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          onPressedState: () {
                            ShopLoginCubit.get(context)
                                .changeSuffixVisibility();
                          },
                          function: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              //   navigateTo(context,ShopLayoutScreen(),);
                            }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please fill this field';
                            }
                            return null;
                          },
                          label: 'Email Address',
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopUserLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'LOG IN',
                            radius: 20,
                            background: Colors.blue,
                            width: double.infinity,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              ' Don\'t have an account,',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigateTo(
                                    context,
                                    ShopRegisterScreen(),
                                  );
                                },
                                child: const Text(
                                  'Register now!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
