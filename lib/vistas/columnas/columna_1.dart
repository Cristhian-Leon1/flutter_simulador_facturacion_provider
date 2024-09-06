import 'package:flutter/material.dart';

class Columna1 extends StatelessWidget {
  const Columna1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(left: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'SUBTOTAL FACTURADO',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                'IVA',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                'TOTAL FACTURADO',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                'Menos reteiva',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                'Menos 4x1000',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                'Menos ICA',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                'Menos estampillas',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                'Retefuente',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                'SALDO',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                'COMISION VENDEDOR',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
