import 'package:flutter/material.dart';
import 'package:mobile_trabalho/db/entity/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDetailsPage extends StatefulWidget {
  final User user;
  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            // Course image and Course Headers
            height: 150,

            child: Row(
              children: [
                Container(
                  color: Colors.blue,
                  width: 150,
                  height: 150,
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.user.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Card(
            color: Colors.lightBlue,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.user_page_next_activity,
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.user_page_next_activity_date,),
                ],
              ),
            ),
          ),
          Container(
            height: 225,
            child: Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.user_page_last_activities,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.user_page_options,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.user_page_logout,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
