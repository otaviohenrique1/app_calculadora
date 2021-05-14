import 'dart:math';

class Calculadora {
  static num calculaMedida({
    required num campoA,
    required num campoB,
    required num campoC,
  }) {
    // a-b
    // c-x
    // x = (b*c)/a
    return num.parse(((campoB * campoC) / campoA).toStringAsFixed(2));
  }

  static String formataCalculoEmString({
    required num valor,
    required num resultado,
  }) {
    List<String> listaTextoNaoFormatado = [
      valor.toString(),
      resultado.toString(),
      resultado.round().toString()
    ];
    String textoFormatado = listaTextoNaoFormatado.join(' -> ');
    return textoFormatado;
  }

  static num stringParaNum(String valorString) {
    return num.parse(valorString);
  }

  static num perimetroCirculo(num valor) {
    return (2 * pi * valor);
  }
}

class TeoremaDePitagoras {
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

class CalculadoraAjuda {
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
}
