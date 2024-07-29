import 'package:banana/features/auth_user/presentation/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Stack(alignment: Alignment.topRight, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            width: double.infinity,
            child: Image.network(
              user.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton.filled(
                onPressed: () {
                  userProvider.clearUser();
                  context.go('/login');
                },
                icon: const Icon(Icons.logout)),
          ),
        ]),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4.0,
                            )),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user.image),
                          child: Image.network(
                            user.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        user.username,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Email: ${user.email}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    'Name: ${user.firstName} ${user.lastName}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
