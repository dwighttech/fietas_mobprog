import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Dwight Steven Fietas',
          postContent: 'Testing dynamic NewsFeedCard without an image.',
          numOfLikes: 100,
          date: 'November 28',
          hasImage: false,
          profileImagePath: 'assets/images/avatar.jpg',
        ),
        NewsFeedCard(
          userName: 'Dwight Steven Fietas',
          postContent: 'Chasing golden hour sunsets. #GoldenHour #SunsetVibes',
          numOfLikes: 200,
          hasImage: true,
          imagePath: 'assets/images/post.jpg',
          profileImagePath: 'assets/images/avatar.jpg',
          date: 'November 28',
        ),
      ],
    );
  }
}