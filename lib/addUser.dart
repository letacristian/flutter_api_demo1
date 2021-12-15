import 'package:flutter/material.dart';
import 'package:flutter_api_demo1/widgets/list_widget.dart';

String? nombre;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: SizedBox(
                width: 1000,
                height: 700,
                child: ListWidget(),
                // condition == true
                //     ? InputPage()
                //     : ProfilePage(),
              ),
            ));

    setState(() {
      nombre = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cargar Usuario'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _addUser(),
        ],
      ),
    );
  }

  Widget _addUser() {
    return ElevatedButton(
      child: const Text('Open route'),
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      onChanged: (_nombre) {
        setState(() {
          nombre = _nombre;
        });
      },
      controller: TextEditingController(text: nombre),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {});
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: const Icon(Icons.lock_open),
        icon: const Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {});
      },
    );
  }
}
