import 'package:blocmodules/src/post_app/models/post_model.dart';
import 'package:blocmodules/src/post_app/utils.dart';

class PostState {
  PostStatus postStatus;
  List<PostModel> posts;
  String errorMessage;
  PostState({
    this.postStatus = PostStatus.loading,
    this.posts = const [],
    this.errorMessage = '',
  });
}
