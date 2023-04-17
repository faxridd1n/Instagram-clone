import 'package:flutter/material.dart';
import 'package:instagram_clone/Bloc/MainView/bottom_cubit.dart';
import 'package:instagram_clone/View/Pages/bottom_pages/Favorite/favorite_page.dart';
import 'package:instagram_clone/View/Pages/bottom_pages/Home/home_page.dart';
import 'bottom_pages/Profile/profile_page.dart';
import 'bottom_pages/Search/search_page.dart';
import 'bottom_pages/Upload/upload_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

//nb=
//B
class _MainPageState extends State<MainPage> {
  var list = [
    const HomePage(),
    const SearchPage(),
    const UploadPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
              body: list[state],
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: state,
                  onTap: (index) {
                    BlocProvider.of<BottomNavigationCubit>(context)
                        .updateTab(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: Colors.black,
                  items: const [
                    BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      label: 'Home',
                      icon: Icon(
                        Icons.home,
                        size: 32,
                      ),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      label: 'Search',
                      icon: Icon(
                        Icons.search,
                        size: 32,
                      ),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      label: 'Upload',
                      icon: Icon(
                        Icons.add_box,
                        size: 32,
                      ),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      label: 'Favorite',
                      icon: Icon(
                        Icons.favorite,
                        size: 32,
                      ),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      label: 'Profile',
                      icon: Icon(
                        Icons.account_circle,
                        size: 32,
                      ),
                    )
                  ]));
        },
      ),
    );
  }
}
