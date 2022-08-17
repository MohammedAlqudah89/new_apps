import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/shop_layout/cubit/cubit.dart';
import 'package:new_apps/shared/component/default_component.dart';

import '../../../../layout/shop_layout/cubit/states.dart';

class ShopSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var formKey =GlobalKey<FormState>();
    var nameController=TextEditingController();
    var emailController=TextEditingController();
    var phoneController=TextEditingController();

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var model = ShopCubit.get(context);
        nameController.text= model.userSettingDataModel!.data!.name;
        emailController.text= model.userSettingDataModel!.data!.email;
        phoneController.text= model.userSettingDataModel!.data!.phone;

        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Personal Data: '),
                    const Divider(),
                    defaultTextFormField(
                        type: TextInputType.text,
                        controller: nameController,
                        prefix: Icons.person,
                        validate: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return 'Name must not be empty';
                          }
                          return null;
                        },
                        label: 'Name'
                    ),
                    const SizedBox(height: 20.0,),
                    defaultTextFormField(
                      type: TextInputType.emailAddress,
                      controller: emailController,
                      prefix: Icons.email,
                      validate: (value)
                      {
                        if (value!.isEmpty)
                        {
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                      label: 'Email Address',
                    ),

                    const SizedBox(height: 20.0,),
                    defaultTextFormField(
                      type: TextInputType.phone,
                      controller: phoneController,
                      prefix: Icons.phone,
                      validate: (value)
                      {
                        if (value!.isEmpty)
                        {
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                      label: 'Phone Number',
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    defaultButton(
                        function: ()
                        {
                          if(formKey.currentState!.validate())
                            {
                              ShopCubit.get(context).userUpdateData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                              );
                            }
                        },
                        text: 'update',
                        radius: 15,
                    ),


                  ],
                ),
              ),
            ),
          ),
        );
      }

    );
  }

}