import 'package:flutter/material.dart';

// Clase Materia similar a la clase Todo del ejemplo
class Materia {
  final String nombre;
  final String profesor;
  final String horarios;
  final String clave;
  final String creditos;
  final String semestre;

  const Materia({
    required this.nombre, 
    required this.profesor, 
    required this.horarios,
    required this.clave,
    required this.creditos,
    required this.semestre,
  });
}

void main() {
  runApp(
    MaterialApp(
      title: 'Mi Horario',
      home: HorarioScreen(
        materias: [
          Materia(
            nombre: 'Taller de Investigación I',
            profesor: 'PEDRO ALFONSO GUADALUPE',
            horarios: 'Martes 12-14 H6\nJueves 12-14 H6',
            clave: 'ACA0909 8SA',
            creditos: '04',
            semestre: '08',
          ),
          Materia(
            nombre: 'Programación Móvil',
            profesor: 'SARA NELLY MORENO CIMÉ',
            horarios: 'Martes 14-17 HP2\nJueves 14-16 H8',
            clave: 'DWB2402 8SC',
            creditos: '05',
            semestre: '08',
          ),
          Materia(
            nombre: 'Gestión Ágil Proyectos',
            profesor: 'MARIO RENÁN MORENO SABIDO',
            horarios: 'Miércoles 13-16 H11\nViernes 13-15 H11',
            clave: 'DWB2403 8SC',
            creditos: '05',
            semestre: '08',
          ),
          Materia(
            nombre: 'Administración de Redes',
            profesor: 'JOSÉ ANTONIO ESPINOSA ATOCHE',
            horarios: 'Lunes 8-10 H2\nJueves 7-9 H12',
            clave: 'SCA1002 8SA',
            creditos: '04',
            semestre: '08',
          ),
          Materia(
            nombre: 'Sistemas Programables',
            profesor: 'RAÚL ALBERTO DUARTE ACHACH',
            horarios: 'Miércoles 11-13 H5\nViernes 11-13 H1',
            clave: 'SCC1023 7SA',
            creditos: '04',
            semestre: '07',
          ),
          Materia(
            nombre: 'Gestión Proyectos Software',
            profesor: 'GRELTY DEL SOCORRO CANUL',
            horarios: 'Lunes 11-14 H5\nMiércoles 8-11 H5',
            clave: 'SCG1009 7SA',
            creditos: '06',
            semestre: '07',
          ),
        ],
      ),
    ),
  );
}

// Pantalla principal que muestra la lista de materias (similar a TodosScreen)
class HorarioScreen extends StatelessWidget {
  const HorarioScreen({super.key, required this.materias});

  final List<Materia> materias;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Horario de Clases'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: materias.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                materias[index].nombre,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Semestre ${materias[index].semestre}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // PASO DE DATOS: Aquí enviamos la materia seleccionada a la pantalla de detalles
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => DetalleMateriaScreen(materia: materias[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Pantalla de detalles que recibe y muestra los datos de la materia (similar a DetailScreen)
class DetalleMateriaScreen extends StatelessWidget {
  const DetalleMateriaScreen({super.key, required this.materia});

  // RECEPCIÓN DE DATOS: Declaramos el campo que recibe la materia
  final Materia materia;

  @override
  Widget build(BuildContext context) {
    // USO DE DATOS: Usamos la materia recibida para construir la UI
    return Scaffold(
      appBar: AppBar(
        title: Text(materia.nombre),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información de la materia usando los datos recibidos
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Clave:', materia.clave),
                    const Divider(),
                    _buildInfoRow('Profesor:', materia.profesor),
                    const Divider(),
                    _buildInfoRow('Semestre:', materia.semestre),
                    const Divider(),
                    _buildInfoRow('Créditos:', materia.creditos),
                    const Divider(),
                    const Text(
                      'Horarios:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(materia.horarios),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Regresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}