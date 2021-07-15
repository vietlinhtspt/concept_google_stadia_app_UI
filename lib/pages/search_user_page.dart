import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/commons/text_field_custom.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/communication_cubit.dart';
import 'package:stadia_app/cubits/searching_cubit.dart';
import 'package:stadia_app/states/searching_state.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({Key key}) : super(key: key);

  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // loginCubit = BlocProvider.of<LoginCubit>(context);

    _textEditingController.addListener(() {
      print(this._textEditingController.text);
      // loginCubit.emailChanged(this._textEditingController.text);
    });
  }

  void _searchUserByUsername() {
    BlocProvider.of<SearchingCubit>(context)
        .searchUserByUsername(this._textEditingController.text);
  }

  void addFriend(String uid) {
    BlocProvider.of<CommunicationCubit>(context).addFriend(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).hintColor,
                  ),
                  margin: EdgeInsets.only(left: 20),
                ),
              ),
              Expanded(
                child: TextFieldCustom(
                  passwordController: _textEditingController,
                  isValidInput: true,
                  labelText: 'Username',
                ),
              ),
              InkWell(
                onTap: () {
                  this._searchUserByUsername();
                },
                child: Container(
                  child: ImageIcon(
                    AssetImage(icon_search),
                    color: Theme.of(context).hintColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
            ]),
            BlocBuilder<SearchingCubit, SearchingState>(
                builder: (context, searchingState) {
              if (searchingState is SearchingStateFailure)
                return Center(
                  child: Text(
                      "Some thing wrong with our server. Try in minutes or contact vietlinhtspt@gmail.com"),
                );
              if (searchingState is SearchingStateInitial)
                return Center(
                  child: Text("Search someone by username"),
                );
              if (searchingState is SearchingStateLoading)
                return Center(
                  child: Text("Loading"),
                );
              if (searchingState is SearchingStateSuccess) if (searchingState
                      .searchData !=
                  null)
                return InkWell(
                  onTap: () {
                    this.addFriend(searchingState.searchData);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.person_add),
                          ),
                          Text(
                            this._textEditingController.text,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              else
                return Center(
                  child: Text("Can not find this user"),
                );
            })
          ],
        ),
      ),
    );
  }
}
