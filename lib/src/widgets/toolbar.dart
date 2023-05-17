import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/core/stores/auth_store.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final AuthStore controller = Get.find();
  final bool canOpenProfilePage;

  Toolbar({super.key, this.canOpenProfilePage = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (Navigator.canPop(context)) ...[
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white10),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
              const Text(
                'KYL',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (canOpenProfilePage) Get.toNamed('/profile');
            },
            child: Obx(
              () {
                final picture = controller.user$.value?.picture;
                return ClipOval(
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.teal[500],
                    child: picture != null
                        ? Image.network(picture)
                        : const Text(''),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(82);
}
