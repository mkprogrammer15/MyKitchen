import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/widgets/admin_appbar.dart';
import 'package:profi_neon/src/features/admin_orders/domain/entities/request_entity.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/blocs/bloc/requests_bloc.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/pages/document_details_screen.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/widgets/requests_counter.dart';

class AdminAccountScreen extends StatefulWidget {
  static const routeName = 'admin_account_screen';

  @override
  _AdminAccountScreenState createState() => _AdminAccountScreenState();
}

class _AdminAccountScreenState extends State<AdminAccountScreen> {
  void navigateToDetail(RequestEntity doc) {
    Navigator.push<void>(
        context,
        MaterialPageRoute(
            builder: (context) => DocumentDetailsScreen(re: doc)));
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RequestsBloc>(context).add(GetRequestsEvent());
    return Scaffold(
        appBar: AdminAppBar(
          onpress: () {
            setState(() {});
          },
          info: 'Hallo Administrator!',
          appIcon: const Icon(Icons.login_rounded),
        ),
        body: Container(
          decoration: const BoxDecoration(color: inkDark),
          child: BlocBuilder<RequestsBloc, RequestsState>(
              builder: (context, state) {
            if (state is GetRequestsState) {
              return Column(children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, 'admin_chat_screen'),
                    child: Text(
                      'Chat',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: cherry),
                    ),
                  ),
                )),
                const SizedBox(
                  width: 100, //all Sizes better to manage with MediaQuery.of...
                  child: Divider(
                    thickness: 1,
                    color: corp,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(),
                          Text(
                            'Anfragen',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: apple),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RequestsCounter(
                              text: state.documentList.length.toString())
                        ],
                      ),
                    )),
                Expanded(
                    flex: 6,
                    child: SafeArea(
                      child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: state.documentList.length,
                          itemBuilder: (_, index) {
                            return Padding(
                                padding: userCalcPad1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: corp,
                                      ),
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Card(
                                    color: ink,
                                    child: ListTile(
                                      trailing: const Icon(
                                        Icons.person,
                                        color: snow,
                                      ),
                                      onTap: () {
                                        navigateToDetail(
                                            state.documentList[index]);
                                      },
                                      title: Text(
                                          state.documentList[index].userName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(color: snow)),
                                      subtitle: Text(
                                        state.documentList[index].requestDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(color: snow),
                                      ),
                                    ),
                                  ),
                                ));
                          }),
                    ))
              ]);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }
}
