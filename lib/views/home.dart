import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_flutter/bloc/contact_cubit.dart';
import 'package:praktikum_flutter/views/view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home")
      ),
      body: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state){
          if (state is ContactLoaded){
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.user.length,
                itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.greenAccent
                  ),
                  child: ListTile(
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text(state.user[index].name),
                    subtitle: Text(state.user[index].number.toString()),
                    trailing: IconButton(
                      onPressed: (){
                        context.read<ContactCubit>().removeUser(index: index);
                      },
                        icon: Icon(Icons.delete)),
                  ),
                );

            });
          }
          else if
            (state is ContactLoading){
              return Center (
                child: CircularProgressIndicator(),
              );

          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.group_outlined),
                Text('Your contact is empty'),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddContactScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
