import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_factura/provider/fracturacion_provider.dart';
import 'package:simulador_factura/vistas/simulador_factura_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FacturacionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador de facturación',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SimuladorFacturaScreen(),
    );
  }
}

