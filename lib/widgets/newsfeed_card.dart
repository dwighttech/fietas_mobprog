import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_font.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? imagePath;
  final String? profileImagePath;
  final int numOfComments;
  final int numOfShares;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imagePath,
    this.profileImagePath,
    this.numOfComments = 42,
    this.numOfShares = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row (Enhancement 2: Profile Avatar)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(18),
                  backgroundColor: FB_LIGHT_PRIMARY,
                  backgroundImage: profileImagePath != null
                      ? AssetImage(profileImagePath!)
                      : null,
                  child: profileImagePath == null
                      ? const Icon(Icons.person, color: FB_DARK_PRIMARY)
                      : null,
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomFont(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),

            // Post Content
            CustomFont(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),

            // Enhancement 1: Dynamic Post Image
            if (hasImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
                child: imagePath != null
                    ? Image.asset(
                        imagePath!,
                        width: double.infinity,
                        height: ScreenUtil().setHeight(200),
                        fit: BoxFit.cover,
                      )
                    : SizedBox(
                        height: ScreenUtil().setHeight(200),
                        child: const Placeholder(),
                      ),
              ),
            SizedBox(height: ScreenUtil().setHeight(8)),

            // Likes, Comments, and Shares Summary Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      size: ScreenUtil().setSp(14),
                      color: FB_PRIMARY,
                    ),
                    SizedBox(width: ScreenUtil().setWidth(4)),
                    CustomFont(
                      text: numOfLikes.toString(),
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ],
                ),
                CustomFont(
                  text: '$numOfComments Comments  $numOfShares Shares',
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.grey,
                ),
              ],
            ),
            const Divider(),

            // Enhancement 3: Widget-based Like, Comment, and Share Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionWidget(
                  icon: Icons.thumb_up_outlined,
                  label: 'Like',
                  onTap: () => debugPrint('Liked $userName\'s post'),
                ),
                _buildActionWidget(
                  icon: Icons.comment_outlined,
                  label: 'Comment',
                  onTap: () => debugPrint('Commented on $userName\'s post'),
                ),
                _buildActionWidget(
                  icon: Icons.redo_outlined,
                  label: 'Share',
                  onTap: () => debugPrint('Shared $userName\'s post'),
                ),
              ],
            ),
            const Divider(),

            // Write a comment row (with Avatar)
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(14),
                  backgroundColor: FB_LIGHT_PRIMARY,
                  backgroundImage: profileImagePath != null
                      ? AssetImage(profileImagePath!)
                      : null,
                  child: profileImagePath == null
                      ? Icon(
                          Icons.person,
                          size: ScreenUtil().setSp(16),
                          color: FB_DARK_PRIMARY,
                        )
                      : null,
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                    ),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(28),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(12),
                      ),
                    ),
                    child: CustomFont(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            CustomFont(
              text: 'View comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionWidget({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(ScreenUtil().setSp(6)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(6),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: ScreenUtil().setSp(18),
              color: FB_DARK_PRIMARY,
            ),
            SizedBox(width: ScreenUtil().setWidth(6)),
            CustomFont(
              text: label,
              fontSize: ScreenUtil().setSp(12),
              color: FB_DARK_PRIMARY,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}