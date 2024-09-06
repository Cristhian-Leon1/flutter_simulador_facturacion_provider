import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FacturacionProvider extends ChangeNotifier {
  final NumberFormat numberFormat = NumberFormat('#,##0', 'en_US');

  final TextEditingController controllerValor = TextEditingController();
  final TextEditingController controllerComision = TextEditingController();
  final TextEditingController controllerDropdown = TextEditingController();
  final TextEditingController controllerDropdown4X1000 = TextEditingController();
  final TextEditingController controllerDropdownICA = TextEditingController();
  final TextEditingController controllerIva = TextEditingController();
  final TextEditingController controllerReteiva = TextEditingController();
  final TextEditingController controllerEstampillas = TextEditingController();


  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode = FocusNode();
  final FocusNode focusNodeIva = FocusNode();
  final FocusNode focusNodeReteiva = FocusNode();
  final FocusNode focusNodeEstampillas = FocusNode();


  double iva = 0.0;
  double comision = 2.5;
  double totalFacturado = 0.0;
  double reteiva = 0.0;
  double cuatroXmil = 0.0;
  double ica = 0.0;
  double estampillas = 0.0;
  String porcentajeRetefuente = '2.5%';
  String porcentaje4X1000 = 'No';
  String porcentajeICA = 'No';
  double retefuente = 0.0;
  double saldo = 0.0;
  double comisionVendedor = 0.0;

  FacturacionProvider() {
    controllerValor.addListener(_calculateValues);
    controllerComision.addListener(_calculateValues);
    controllerDropdown.addListener(_calculateValues);
    controllerDropdown4X1000.addListener(_calculateValues);
    controllerDropdownICA.addListener(_calculateValues);
    controllerIva.addListener(_calculateValues);
    controllerReteiva.addListener(_calculateValues);
    controllerEstampillas.addListener(_calculateValues);
  }

  void _calculateValues() {
    String rawValue = controllerValor.text.replaceAll(',', '');
    double valor = double.tryParse(rawValue) ?? 0.0;
    String porcentajeRetefuenteStr = porcentajeRetefuente.replaceAll('%', '');
    double porcentajeRetefuenteS = double.tryParse(porcentajeRetefuenteStr) ?? 0.0;
    double comision = double.tryParse(controllerComision.text) ?? 0.0;
    double ivaPercentage = double.tryParse(controllerIva.text) ?? 0;
    double reteivaPercentage = double.tryParse(controllerReteiva.text) ?? 0;
    double estampillasPercentage = double.tryParse(controllerEstampillas.text) ?? 0;

    iva = valor * (ivaPercentage / 100);
    totalFacturado = valor + iva;
    reteiva = iva * (reteivaPercentage / 100);
    cuatroXmil = (porcentaje4X1000 == 'Si') ? totalFacturado / (4 * 1000) : 0;
    ica = (porcentajeICA == 'Si') ? valor * (10 / 1000) : 0;
    estampillas = valor * (estampillasPercentage / 100);
    retefuente = valor * (porcentajeRetefuenteS / 100);
    saldo = totalFacturado - reteiva - cuatroXmil - ica - estampillas - retefuente;
    comisionVendedor = saldo * (comision / 100);

    controllerValor.value = TextEditingValue(
      text: numberFormat.format(valor),
      selection: TextSelection.collapsed(offset: numberFormat.format(valor).length),
    );
    notifyListeners();
  }

  void setPorcentajeRetefuente(String porcentaje) {
    porcentajeRetefuente = porcentaje;
    controllerDropdown.text = porcentaje;
    notifyListeners();
  }

  void set4X1000(String opcion) {
    porcentaje4X1000 = opcion;
    controllerDropdown4X1000.text = opcion;
    notifyListeners();
  }

  void setICA(String opcion) {
    porcentajeICA = opcion;
    controllerDropdownICA.text = opcion;
    notifyListeners();
  }

  @override
  void dispose() {
    controllerValor.removeListener(_calculateValues);
    controllerComision.removeListener(_calculateValues);
    controllerDropdown.removeListener(_calculateValues);
    controllerDropdown4X1000.removeListener(_calculateValues);
    controllerDropdownICA.removeListener(_calculateValues);
    controllerIva.removeListener(_calculateValues);
    controllerReteiva.removeListener(_calculateValues);
    controllerEstampillas.removeListener(_calculateValues);
    controllerValor.dispose();
    focusNode.dispose();
    controllerComision.dispose();
    focusNode2.dispose();
    controllerDropdown.dispose();
    controllerDropdown4X1000.dispose();
    controllerDropdownICA.dispose();
    controllerIva.dispose();
    focusNodeIva.dispose();
    controllerReteiva.dispose();
    focusNodeReteiva.dispose();
    controllerEstampillas.dispose();
    focusNodeEstampillas.dispose();
    super.dispose();
  }
}