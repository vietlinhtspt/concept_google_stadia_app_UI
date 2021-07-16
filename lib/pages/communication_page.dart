import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/cubits/communication_cubit.dart';
import 'package:stadia_app/states/communication_state.dart';
import 'package:stadia_app/widgets/communication_page/chat_item.dart';
import 'package:stadia_app/widgets/communication_page/communication_tabbar.dart';
import 'package:stadia_app/theme/colors.dart';

class CommunicationPage extends StatefulWidget {
  const CommunicationPage({Key key}) : super(key: key);

  @override
  _CommunicationPageState createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<CommunicationCubit>(context).getListMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CommunicationTabbarWidget(),
      Expanded(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: appGradient),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),

            // child: Column(
            //   children: [ChatItemWidget()],
            // ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .limit(100)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  // if (communicationState is CommunicationStateSuccess)
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return new ChatItemWidget(snapshot.data.docs[index]);
                      });
                  // if (communicationState is CommunicationStateFailure)
                  //   return Center(
                  //     child: Text(
                  //         "Some thing wrong with our server. Try in minutes or contact vietlinhtspt@gmail.com"),
                  //   );
                  // if (communicationState is CommunicationStateInitial)
                  //   return Center(
                  //     child: Text("Search someone by username"),
                  //   );
                  // if (communicationState is CommunicationStateLoading)
                  //   return Center(
                  //     child: Text("Loading"),
                  //   );
                  // return Center(
                  //   child: Text("Can not handle this state."),
                  // );
                }
              },
            ),
          )
        ],
      ))
    ]);
  }
}
