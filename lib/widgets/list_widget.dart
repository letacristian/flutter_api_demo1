import 'package:flutter/material.dart';
import 'package:flutter_api_demo1/addUser.dart';
import 'package:flutter_api_demo1/profile_page.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool condition = false;
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child: ElevatedButton(
                    onPressed: () {
                      if (condition == false) {
                        Navigator.pop(context, 'Perfil');
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                                  content: SizedBox(
                                    width: 1000,

                                    child: ProfilePage(),
                                    // condition == true
                                    //     ? InputPage()
                                    //     : ProfilePage(),
                                  ),
                                ));
                      }

                      // Close the screen and return "Nope." as the result.
                    },
                    child: const Text('Perfil'),
                  ),
                ),
              );
            },
            itemCount: 15),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InputPage()),
          );
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
