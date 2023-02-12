import 'package:gdsc_mobile_template/controllers/auth_controller.dart';
import 'package:gdsc_mobile_template/services/post_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  AuthController authCtrl = Get.find<AuthController>();
  final PostService postService = PostService();

  Future<bool> writePost({required String title, required String description}) async {}
}
