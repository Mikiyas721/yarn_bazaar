import 'package:flutter/material.dart';

class InputSelectionPage extends StatelessWidget {
  const InputSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text((arguments as Map)["title"]),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${arguments["list"][index]}'),
              onTap: () {
                //TODO move logic to controller
                Navigator.pop(context, arguments["list"][index]);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: arguments["list"].length),
    );
  }
}
