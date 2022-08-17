import 'package:flutter/material.dart';
import 'package:new_apps/modules/shop_app/login/login_screen.dart';
import 'package:new_apps/shared/component/default_component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/network/local/cached_helper.dart';
import '../../../shared/styles/colors.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel (
  {
   required this.title,
   required this.body,
   required this.image,
});
}

class OnBoardingScreen extends StatefulWidget
{

  @override
  State<OnBoardingScreen> createState() => _onBoardingState();
}

class _onBoardingState extends State<OnBoardingScreen> {
  var pageController= PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        image:'assets/img/onBoard.jpg',
        title: 'First Screen', body: 'First Body'),
    BoardingModel(
        image:'assets/img/onboard2.jpg',
        title: 'Second Screen', body: 'Second Body'),
    BoardingModel(
        image:'assets/img/onboard3.jpg',
        title: 'Third Screen', body: 'Third Body')
  ];
  bool isLast= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(onPressed: submit,
            child: const Text('SKIP'), )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(

                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (int index)
                {
                  if (index == boarding.length-1)
                    {
                      print( 'last');
                      setState(() {
                        isLast=true;
                      });
                    }
                  else
                  {
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 40.0,),
            Row(
              children:
              [
                SmoothPageIndicator(
                  controller: pageController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 4,
                    dotHeight: 10,
                    activeDotColor: defaultColor,
                    dotColor: Colors.grey,
                    dotWidth: 10,
                    spacing: 5.0,

                  ),
                  //  effect: const WormEffect(
                  //   dotHeight: 16,
                  //   dotWidth: 16,
                  //   type: WormType.thin,
                  //    strokeWidth: 5,
                  // ),
                ),
                const Spacer(),
                FloatingActionButton(onPressed: ()
                {
                  if (isLast)
                    {
                      submit();
                    }else {
                    pageController.nextPage(duration: const Duration(
                      microseconds: 850,
                      //seconds: 1,
                    ),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }

                },
                    child:  const Icon(Icons.arrow_forward_outlined,),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
     [
      Expanded(
        child:  Image(
          image: AssetImage(model.image),
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Text(model.title),
     const SizedBox(
        height: 10.0,
      ),
      Text(model.body),
      
    ],
  );
  
  void submit()
  {
    CachedHelper.saveData(key: 'onBoarding', value: true).then((value)
    {
      if (value)
        {
          navigateAndFinish(context, ShopLoginScreen());
        }

    });

  }
}