import 'post.dart';
import 'user_profile.dart';

final UserProfile user = UserProfile(
  id: 1,
  profileName: "Admin",
  userName: "@admin",
  followers: 10,
  following: 100,
  joinDate: 'January 2021',
  bornDate: 'January 2000',
);

final List<Post> postsExamples = [
  Post(
    id: "1",
    author: user,
    createdAt: DateTime.now(),
    description: 'Really funny post',
    commentCount: 6,
    reposts: 66,
    likes: 66,
    views: 666,
  ),
  Post(
    id: "2",
    author: user,
    createdAt: DateTime.now(),
    description: 'Really funny post',
    commentCount: 1,
    reposts: 66,
    likes: 36,
    views: 646,
  ),
  Post(
    id: "3",
    author: user,
    createdAt: DateTime.now(),
    description: 'Really funny post',
    commentCount: 5,
    reposts: 768,
    likes: 67,
    views: 1000,
  ),
  Post(
    id: "4",
    author: user,
    createdAt: DateTime.now(),
    description: 'Really funny post',
    commentCount: 7,
    reposts: 4,
    likes: 10,
    views: 145,
  ),
];
