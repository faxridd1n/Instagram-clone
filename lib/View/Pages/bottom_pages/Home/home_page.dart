import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:instagram_clone/Models/postModel.dart';
import 'package:instagram_clone/View/Widgets/bottom_widgets/Home_Wid/post_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//git init
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Instagram',style: TextStyle(fontFamily: 'Billabong'),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            itemOfPost(
              context,
              Post(
                'dsfd',
                'sdfsdf',
                [
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',
                  'https://media.istockphoto.com/id/1185397619/photo/in-nature-life-is-more-simple-yet-more-meaningful.jpg?s=170667a&w=0&k=20&c=3pXf6Gugs3T0o9Mr2l_pvp_D27g1Bn9Fy9k2h3CexHE=',
                ],
                'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
            ),
             itemOfPost(
              context,
              Post(
                'dsfd',
                'sdfsdf',
                [
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',
                  'https://media.istockphoto.com/id/1185397619/photo/in-nature-life-is-more-simple-yet-more-meaningful.jpg?s=170667a&w=0&k=20&c=3pXf6Gugs3T0o9Mr2l_pvp_D27g1Bn9Fy9k2h3CexHE=',
                ],
                'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
            ),
             itemOfPost(
              context,
              Post(
                'dsfd',
                'sdfsdf',
                [
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',
                  'https://media.istockphoto.com/id/1185397619/photo/in-nature-life-is-more-simple-yet-more-meaningful.jpg?s=170667a&w=0&k=20&c=3pXf6Gugs3T0o9Mr2l_pvp_D27g1Bn9Fy9k2h3CexHE=',
                ],
                'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
            ),
             itemOfPost(
              context,
              Post(
                'dsfd',
                'sdfsdf',
                [
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',
                  'https://media.istockphoto.com/id/1185397619/photo/in-nature-life-is-more-simple-yet-more-meaningful.jpg?s=170667a&w=0&k=20&c=3pXf6Gugs3T0o9Mr2l_pvp_D27g1Bn9Fy9k2h3CexHE=',
                ],
                'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
            )
          ],
        ),
      ),
    );
  }
}
