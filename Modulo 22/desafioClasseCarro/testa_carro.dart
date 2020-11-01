import './Carro.dart';

main() {
  var car = Carro(19);

  while (!car.estaNoLimite()) {
    car.acelerar();
    print(car);
  }

  print("\n\nFim velocidade maxima que o carro " +
      "Alcançou foi de ${car.velocidadeMaxima}\n\n");

  while (true) {
    car.frear();
    print(car);
    if (car.velocidadeAtual == 0) break;
  }

  car.velocidadeAtual = 20;

  print("\n\nFim velocidade atual do carro " +
      "foi de ${car.velocidadeAtual}\n\n");
}
