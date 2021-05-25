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
      'H²=C1²+C2²',
      'H => Hipotenusa',
      'C1 => Cateto1',
      'C2 => Cateto2',
    ];
    return mensagemTeoremaDePitagorasAjuda;
  }

  static List<String> equacaoSegundoGrauAjuda() {
    List<String> mensagemEquacaoSegundoGrauAjuda = [
      'ax² + bx + c = 0',
      'Δ = b² - 4ac',
      'x1 = (-b + √Δ)/(2a)',
      'x2 = (-b - √Δ)/(2a)',
    ];
    return mensagemEquacaoSegundoGrauAjuda;
  }

  static List<String> equacaoPrimeiroGrauAjuda() {
    List<String> mensagemEquacaoPrimeiroGrauAjuda = [
      'ax + b = 0',
    ];
    return mensagemEquacaoPrimeiroGrauAjuda;
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
