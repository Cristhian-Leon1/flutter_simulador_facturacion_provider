import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simulador_factura/vistas/columnas/columna_1.dart';
import 'package:simulador_factura/vistas/columnas/columna_2.dart';
import 'package:simulador_factura/vistas/columnas/columna_3.dart';
import 'package:simulador_factura/provider/fracturacion_provider.dart';

class SimuladorFacturaScreen extends StatelessWidget {
  const SimuladorFacturaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(width);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff4b86b4),
        body: Center(
          child: Container(
            height: height * 0.9,
            width: 420,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      'SIMULADOR DE FACTURA',
                      maxLines: 3,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        letterSpacing: 2,
                        height: 1.03,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Columna1(),
                        Columna2(),
                        Columna3(),
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17, right: 15, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                        ),
                        border: Border.all(
                          color: Colors.grey[500]!,
                          width: 0.5,
                        ),
                      ),
                      child: Consumer<FacturacionProvider>(
                        builder: (context, facturacionProvider, child) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 10,
                                child: Center(
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Retefuente: ',
                                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: 'Productos 2.5% - Servicios 3.5% - Servivios profesionales 10%',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Opacity(
                                    opacity: 0.2,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  )
                                ),
                              ),
                              const Expanded(
                                flex: 10,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'El % de impuestos puede cambiar según el caso. (Regimen simplificado, Común).',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      )
    );
  }
}
