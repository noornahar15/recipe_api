import 'package:api_getdata/model/user.dart';
import 'package:flutter/material.dart';
import 'package:api_getdata/views/widgets/recipe_card.dart';

class HomePage extends StatelessWidget {
  final List<User> userList;
  final String cookTime;
  final double rating;
  final bool isLoading;

  const HomePage({
    Key? key,
    required this.userList,
    required this.cookTime,
    required this.rating,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Food Recipe",
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: isLoading == true ? userList.length : 1,
        itemBuilder: (BuildContext context, int index) {
          return RecipeCard(
            title: isLoading == true ? userList[index].name! : "Nahar",
            cookTime: isLoading == true ? userList[index].website! : "Web",
            rating: isLoading == true ? userList[index].phone! : "Phone",
            thumbnailUrl:
                "https://static01.nyt.com/images/2013/06/26/dining/26JPFLEX1/26JPFLEX1-articleLarge-v3.jpg",
          );
        },
      ),
    );
  }
}
