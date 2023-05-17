import 'package:know_your_language/src/core/models/response.dart';
import 'package:know_your_language/src/core/models/user_model.dart';

abstract class IUsersProvider {
  Future<ListResponse<UserModel>?> getAllUsers();

  Future<SingleResponse<UserModel>?> currentUser();
}
