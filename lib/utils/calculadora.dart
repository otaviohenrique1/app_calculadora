import 'dart:math';

class Calculadora {
  static num calculaMedida(
      {required num campoA, required num campoB, required num campoC}) {
    // a-b
    // c-x
    // x = (b*c)/a
    return num.parse(((campoB * campoC) / campoA).toStringAsFixed(2));
  }

  static List<String> calculadoraAjuda() {
    List<String> mensagemCalculadoraAjuda = [
      'A----B',
      'C----X',
      'X=(B*C)/A',
    ];
    return mensagemCalculadoraAjuda;
  }

  static List<String> perimeroCirculoAjuda() {
    List<String> mensagemPerimeroCirculoAjuda = [
      'P=2*pi*r',
      'P => Perimero',
      'pi => Medida do arco do circulo (3,1415)',
      'r => Raio do circulo',
    ];
    return mensagemPerimeroCirculoAjuda;
  }

  static List<String> teoremaDePitagorasAjuda() {
    List<String> mensagemTeoremaDePitagorasAjuda = [
      'H^2=C1^2+C2^2',
      'H => Hipotenusa',
      'C1 => Cateto1',
      'C2 => Cateto2',
    ];
    return mensagemTeoremaDePitagorasAjuda;
  }

  /*
  static String calculadoraAjuda() {
    String mensagemCalculadoraAjuda = '''
      A----B
      C----X
      X=(B*C)/A''';
    return mensagemCalculadoraAjuda;
  }
  */

  static String formataCalculo(List<String> valor) {
    var resultado = valor.join(' -> ');
    return resultado;
  }

  static String formatadorFinal(num valor, num resultado, String nomeMedida) {
    return formataCalculo([
      nomeMedida,
      valor.toString(),
      resultado.toString(),
      resultado.round().toString()
    ]);
  }

  static void calculaListaMedidas(
    Map<String, num> listaMedidas,
    num valorCampoA,
    num valorCampoB,
  ) {
    listaMedidas.forEach((key, valor) {
      print(Calculadora.formatadorFinal(
        valor,
        Calculadora.calculaMedida(
          campoA: valorCampoA,
          campoB: valorCampoB,
          campoC: valor,
        ),
        // Calculadora.calculaMedida(a, b, value),
        key,
      ));
    });
  }

  static num perimetroCirculo(num valor) {
    return (2 * pi * valor);
  }

  static Map<dynamic, dynamic> teoremaDePitagoras({
    num cateto1 = 0,
    num cateto2 = 0,
    num hipotenusa = 0,
  }) {
    num resultado = 0;
    String nomeCampo = '';

    if (cateto1 == 0) {
      nomeCampo = 'Cateto 1';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto2, 2));
      return {
        'nomeCampo': nomeCampo,
        'resultado': resultado,
      };
    } else if (cateto2 == 0) {
      nomeCampo = 'Cateto 2';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto1, 2));
      return {
        'nomeCampo': nomeCampo,
        'resultado': resultado,
      };
    } else if (hipotenusa == 0) {
      nomeCampo = 'Hipotenusa';
      resultado = sqrt(pow(cateto1, 2) + pow(cateto2, 2));
      return {
        'nomeCampo': nomeCampo,
        'resultado': resultado,
      };
    }
    return {
      'nomeCampo': '',
      'resultado': 0,
    };
  }

  static List<dynamic> teoremaDePitagoras2({
    num cateto1 = 0,
    num cateto2 = 0,
    num hipotenusa = 0,
  }) {
    num resultado = 0;
    String nomeCampo = '';

    if (cateto1 == 0) {
      nomeCampo = 'Cateto 1';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto2, 2));
      return [nomeCampo, resultado];
    } else if (cateto2 == 0) {
      nomeCampo = 'Cateto 2';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto1, 2));
      return [nomeCampo, resultado];
    } else if (hipotenusa == 0) {
      nomeCampo = 'Hipotenusa';
      resultado = sqrt(pow(cateto1, 2) + pow(cateto2, 2));
      return [nomeCampo, resultado];
    }
    return ['', 0];
  }

  static num teoremaDePitagoras3({
    num cateto1 = 0,
    num cateto2 = 0,
    num hipotenusa = 0,
  }) {
    num resultado = 0;

    if (cateto1 == 0) {
      // nomeCampo = 'Cateto 1';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto2, 2));
      return resultado;
    } else if (cateto2 == 0) {
      // nomeCampo = 'Cateto 2';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto1, 2));
      return resultado;
    } else if (hipotenusa == 0) {
      // nomeCampo = 'Hipotenusa';
      resultado = sqrt(pow(cateto1, 2) + pow(cateto2, 2));
      return resultado;
    }
    // nomeCampo = '';
    return resultado;
  }

  static List<dynamic> teoremaDePitagoras4({
    num cateto1 = 0,
    num cateto2 = 0,
    num hipotenusa = 0,
  }) {
    num resultado = 0;
    String nomeCampo = '';

    if (cateto1 == 0) {
      nomeCampo = 'Cateto 1';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto2, 2));
      return [nomeCampo, resultado];
    } else if (cateto2 == 0) {
      nomeCampo = 'Cateto 2';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto1, 2));
      return [nomeCampo, resultado];
    } else if (hipotenusa == 0) {
      nomeCampo = 'Hipotenusa';
      resultado = sqrt(pow(cateto1, 2) + pow(cateto2, 2));
      return [nomeCampo, resultado];
    }
    return ['', 0];
  }
}

// main(List<String> args) {
// num x = Calculadora.teoremaDePitagoras(cateto1: 3, cateto2: 4);
// print(x);
// }
