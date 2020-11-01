class Carro {
  final int velocidadeMaxima;
  int _velocidadeAtual = 0;

  // o metodo get tem a função de retornar um valor para o
  int get velocidadeAtual => this._velocidadeAtual;

  void set velocidadeAtual(novaVelocidade) {
    if (novaVelocidade < velocidadeMaxima &&
        novaVelocidade > 0 &&
        (this._velocidadeAtual + 5) >= novaVelocidade &&
        (this._velocidadeAtual - 5) <= novaVelocidade) {
      this._velocidadeAtual = novaVelocidade;
    }
  }

  //define velocidade maxima
  Carro([this.velocidadeMaxima = 100]);

  int acelerar() =>
      this._velocidadeAtual = (_velocidadeAtual + 5) > velocidadeMaxima
          ? velocidadeMaxima
          : _velocidadeAtual + 5;

  int frear() => this._velocidadeAtual -=
      (_velocidadeAtual - 5) >= 0 ? 5 : _velocidadeAtual;

  bool estaNoLimite() => this._velocidadeAtual == this.velocidadeMaxima;

  String toString() {
    return "Velocidade Atual: $_velocidadeAtual, Velocidade Maxima: $velocidadeMaxima";
  }
}
