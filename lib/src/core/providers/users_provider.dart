import '../../../environment.dart';
import '../models/response.dart';
import '../models/user_model.dart';
import '../contracts/providers/abstracts/with_auth_provider.dart';
import '../contracts/providers/iusers_provider.dart';

class UsersProvider extends WithAuthProvider implements IUsersProvider {
  UsersProvider();

  @override
  Future<ListResponse<UserModel>?> getAllUsers() async {
    final response = await get<ListResponse<UserModel>>(
      'users/profile',
    );

    if (!response.isOk) {
      return null;
    }

    return response.body;
  }

  @override
  Future<SingleResponse<UserModel>?> currentUser() async {
    try {
      final response = await get<SingleResponse<UserModel>?>(
        '${Environment.apiUrl}users/profile',
        decoder: (response) {
          return SingleResponse<UserModel>.fromJson(
            response,
            (data) {
              if (data == null) {
                return null;
              }
              return UserModel(
                id: data['id'],
                name: data['name'],
                email: data['email'],
                picture: data['picture'],
                provider: data['provider'],
              );
            },
          );
        },
      );

      if (!response.isOk) {
        return null;
      }

      return response.body;
    } catch (e) {
      return null;
    }
  }
}
