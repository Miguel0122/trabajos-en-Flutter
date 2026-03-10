import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(App002());
}

class App002 extends StatelessWidget {
  const App002({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Uso Scaffold",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lista de Animales"),
          backgroundColor: Colors.amber,
        ),

        body: ListView(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Perro"),
                    subtitle: Text("Animal doméstico muy fiel"),
                  ),

                  Image.network(
                    "https://images.unsplash.com/photo-1543466835-00a7907e9de1",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Gato"),
                    subtitle: Text("Animal independiente y curioso"),
                  ),

                  Image.network(
                    "https://images.unsplash.com/photo-1518791841217-8f162f1e1131",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Tigre"),
                    subtitle: Text("Felino salvaje muy poderoso"),
                  ),

                  Image.network(
                    "https://images.unsplash.com/photo-1549480017-d76466a4b7e8",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Oso"),
                    subtitle: Text("Mamífero grande y fuerte"),
                  ),

                  Image.network(
                    "https://images.unsplash.com/photo-1589656966895-2f33e7653819",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Zorro"),
                    subtitle: Text("Animal muy inteligente y rápido"),
                  ),

                  Image.network(
                    "https://images.unsplash.com/photo-1474511320723-9a56873867b5",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Panda"),
                    subtitle: Text("Oso originario de China"),
                  ),

                  Image.network(
                    "https://images.unsplash.com/photo-1564349683136-77e08dba1ef7",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Lobo"),
                    subtitle: Text("Animal salvaje que vive en manadas"),
                  ),

                  Image.network(
                    "https://source.unsplash.com/600x400/?white-wolf",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Caballo"),
                    subtitle: Text(
                      "Animal fuerte y veloz usado por el ser humano",
                    ),
                  ),

                  Image.network(
                    "https://source.unsplash.com/600x400/?horse",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
