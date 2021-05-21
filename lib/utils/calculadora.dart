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

class EquacacaoCalculadora {
  static Map<String, dynamic> equacao2Grau({
    required num a,
    required num b,
    required num c,
  }) {
    num delta = pow(b, 2) - (4 * a * c);

    if (delta < 0) {
      /* Se Δ < 0, a equacao do segundo grau nao possui raizes reais; */
      return {
        "r": "nao possui raizes reais",
      };
    } else if (delta == 0) {
      /* Se Δ = 0, a equacao do segundo grau possui uma raiz real; */
      num x = (-b + 0) / (2 * a);
      return {
        "x": x,
      };
    } else if (delta > 0) {
      /* Se Δ > 0, a equacao do segundo grau possui duas raizes reais. */
      num x1 = (-b + sqrt(delta)) / (2 * a);
      num x2 = (-b - sqrt(delta)) / (2 * a);
      return {
        "x1": x1,
        "x2": x2,
      };
    }
    return {"r": "Valor invalido"};
  }
}
