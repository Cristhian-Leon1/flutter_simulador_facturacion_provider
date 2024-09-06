import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/fracturacion_provider.dart';
import '../widgets/textfield.dart';

class Columna2 extends StatelessWidget {
  const Columna2({super.key});

  @override
  Widget build(BuildContext context) {
    final facturacionProvider = Provider.of<FacturacionProvider>(context);
    var width = MediaQuery.of(context).size.width;

    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(
            child: Text(
              '',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFieldPersonalizable(
                      hintText: '0',
                      controller: facturacionProvider.controllerIva,
                      keyboard: 'text',
                      focusNode: facturacionProvider.focusNodeIva,
                      type: 'num',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    '%',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Text(
              '',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFieldPersonalizable(
                      hintText: '0',
                      controller: facturacionProvider.controllerReteiva,
                      keyboard: 'text',
                      focusNode: facturacionProvider.focusNodeReteiva,
                      type: 'num',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    '%',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: width > 480 ? const EdgeInsets.only(bottom: 10) : const EdgeInsets.only(bottom: 20),
              child: DropdownButton<String>(
                value: facturacionProvider.porcentaje4X1000,
                items: <String>['Si', 'No'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 13)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    facturacionProvider.set4X1000(newValue);
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: width > 480 ? const EdgeInsets.only(bottom: 10) : const EdgeInsets.only(bottom: 20),
              child: DropdownButton<String>(
                value: facturacionProvider.porcentajeICA,
                items: <String>['Si', 'No'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 13)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    facturacionProvider.setICA(newValue);
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFieldPersonalizable(
                      hintText: '0',
                      controller: facturacionProvider.controllerEstampillas,
                      keyboard: 'text',
                      focusNode: facturacionProvider.focusNodeEstampillas,
                      type: 'num',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    '%',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: width > 480 ? const EdgeInsets.only(bottom: 10) : const EdgeInsets.only(bottom: 20),
              child: DropdownButton<String>(
                value: facturacionProvider.porcentajeRetefuente,
                items: <String>['2.5%', '3.5%', '10%'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 13)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    facturacionProvider.setPorcentajeRetefuente(newValue);
                  }
                },
              ),
            ),
          ),
          const Expanded(
            child: Text(
              '',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFieldPersonalizable(
                      hintText: '0',
                      controller: facturacionProvider.controllerComision,
                      keyboard: 'text',
                      focusNode: facturacionProvider.focusNode2,
                      type: 'num',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    '%',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}