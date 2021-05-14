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
