import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_apps/modules/webView_screen/webView_screen.dart';
import 'package:new_apps/shared/cubit/cubit.dart';

import '../../layout/shop_layout/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required VoidCallback function,
  required String text,
   required double radius,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: background,
    ),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}

Widget defaultTextFormField2({
  required TextInputType type,
  required TextEditingController controller,
  required IconData prefix,
  IconData? suffix,
  required  FormFieldValidator<String> validate,
  required String label,
  Function(String)? function,
  bool isPassword = false,
  VoidCallback? onPressedState,
  Null Function()? onTap,
}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText: isPassword,
    onFieldSubmitted: function,
    validator: validate,
    onTap: onTap,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null
          ? IconButton(
        icon: Icon(suffix),
        onPressed: onPressedState,
      )
          : null,
      border: const OutlineInputBorder(),
    ),
  );
}

Widget defaultTextFormField({
  required TextInputType type,
  required TextEditingController controller,
  final Function(String)? function,
  required IconData prefix,
  IconData? suffix,
  required  FormFieldValidator<String> validate,
  required String label,
  bool isPassword = false,
  VoidCallback? onPressedState,
  Null Function()? onTap,
}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText: isPassword,
    onChanged: function,
    validator: validate,
    onTap: onTap,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null
          ? IconButton(
        icon: Icon(suffix),
        onPressed: onPressedState,
      )
          : null,
      border: const OutlineInputBorder(),
    ),
  );
}



Widget todoListView(Map model, context) {
  return Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            child: Text(
              '${model['time']}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: const TextStyle(
                    fontSize: 17.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          IconButton(
            onPressed: () {
              TodoCubit.get(context)
                  .updateDate(status: 'done', id: model['id']);
            },
            icon: const Icon(
              Icons.check_box,
            ),
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () {
              TodoCubit.get(context)
                  .updateDate(status: 'archive', id: model['id']);
            },
            icon: const Icon(
              Icons.archive,
            ),
            color: Colors.black38,
          ),
        ],
      ),
    ),
    onDismissed: (direction) {
      TodoCubit.get(context).deleteDate(id: model['id']);
    },
  );
}

Widget taskBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => todoListView(tasks[index], context),
          separatorBuilder: (context, index) {
            return Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            );
          },
          itemCount: tasks.length),
      fallback: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.menu,
                size: 100.0,
                color: Colors.blueGrey,
              ),
              Text(
                "there are no tasks yet, please add some task",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        );
      },
    );



Widget newsListViewBuilder(articles, context) => InkWell(
  onTap: () {
    navigateTo(context, webViewScreen(articles['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(10.0),

    child: Row(

      children:  [


        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0,),

            image: DecorationImage(

              image: NetworkImage('${articles['urlToImage']}',),

              fit: BoxFit.cover,

            ),

          ),

        ),

        const SizedBox(

          width: 14.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children:  [

              Text('${articles['title']}',

            maxLines: 4,

            overflow: TextOverflow.ellipsis,

            style: Theme.of(context).textTheme.bodyMedium

          ),

               Text(' ${articles['publishedAt']}',

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 16.0,

                  color: Colors.black54,

                ),

              ),

            ],

          ),

        ),

      ],

    ),

  ),
);

Widget newsConditionalBuilder (list, context) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context,index) => newsListViewBuilder(list[index], context),
    separatorBuilder: (context, index)=> divider(),
    itemCount: list.length,
  ),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);

Widget divider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey,
);

void navigateTo (context, widget) => Navigator.push(
    context,
    MaterialPageRoute(builder:(context) => widget));

void navigateAndFinish (context, widget) => Navigator
    .pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context) => widget), (route) => false);

void toastBuilder (
{
  required String message,
  required ToastState state,
}
    )
{
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: ChooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastState {SUCCESS, ERROR, WARNING}

Color?  ChooseColor (ToastState state)
{
  Color? color;
  switch (state)
  {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;

      return color;
  }


}

// Widget buildIconFavoriteButton (context) =>
//   Icon(ShopCubit.get(context).isButtonShown? FluentSystemIcons.ic_fluent_favorites_filled:
//   FluentSystemIcons.ic_fluent_favorites_regular,
//     size: 25.0,);





