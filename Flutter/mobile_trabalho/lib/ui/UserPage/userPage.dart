import 'package:flutter/material.dart';
import 'package:mobile_trabalho/fetch/UserApi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_trabalho/ui/UserPage/userDetailsPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UsersApi coursesApi = new UsersApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: coursesApi.fetchById("me"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
                child: Center(
              child: Text(AppLocalizations.of(context)!.loading),
            ));
          } else {
            return UserDetailsPage(
              user: snapshot.data,
            );
          }
        });
  }
}
