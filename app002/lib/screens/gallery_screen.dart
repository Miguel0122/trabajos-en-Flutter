import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  static const List<Map<String, String>> animales = [
    {
      'nombre': 'Perro',
      'descripcion': 'Animal doméstico muy fiel',
      'url': 'https://images.unsplash.com/photo-1543466835-00a7907e9de1',
    },
    {
      'nombre': 'Gato',
      'descripcion': 'Animal independiente y curioso',
      'url': 'https://images.unsplash.com/photo-1518791841217-8f162f1e1131',
    },
    {
      'nombre': 'Tigre',
      'descripcion': 'Felino salvaje muy poderoso',
      'url': 'https://images.unsplash.com/photo-1549480017-d76466a4b7e8',
    },
    {
      'nombre': 'Oso Polar',
      'descripcion': 'Mamífero grande y fuerte',
      'url': 'https://images.unsplash.com/photo-1589656966895-2f33e7653819',
    },
    {
      'nombre': 'Zorro',
      'descripcion': 'Animal muy inteligente y rápido',
      'url': 'https://images.unsplash.com/photo-1474511320723-9a56873867b5',
    },
    {
      'nombre': 'Panda',
      'descripcion': 'Oso originario de China',
      'url': 'https://images.unsplash.com/photo-1564349683136-77e08dba1ef7',
    },
    {
      'nombre': 'Lobo',
      'descripcion': 'Animal salvaje que vive en manadas',
      'url': 'https://images.unsplash.com/photo-1641392924934-17fd6c260a24',
    },
    {
      'nombre': 'Caballo',
      'descripcion': 'Animal fuerte y veloz usado por el ser humano',
      'url': 'https://images.unsplash.com/photo-1553284965-83fd3e82fa5a?w=800',
    },
    {
      'nombre': 'León',
      'descripcion': 'Rey de la selva, fuerte y veloz',
      'url': 'https://images.unsplash.com/photo-1546182990-dffeafbe841d',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Animales'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: animales.length,
        itemBuilder: (context, index) {
          final a = animales[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(a['nombre']!),
                  subtitle: Text(a['descripcion']!),
                ),
                Image.network(
                  a['url']!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, prog) => prog == null
                      ? child
                      : const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}