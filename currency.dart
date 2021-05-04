import 'dart:io';
void main() {
  stdout.write(
      'Выберите действие:\n1) сомы в другую валюту?\n2) другую валюту в сомы?\n');
  int numb = int.parse(stdin.readLineSync());
  switch (numb) {
    case 1:
      som_to_other();
      break;
    case 2:
      other_to_som();
      break;
    default:
      print('Ошибка');
  }
}

class Value {
  var usd;
  var euro;
  var rub;
  var tr;
}

class Buy extends Value {
  course() {
    usd = 85;
    euro = 102;
    rub = 1.12;
    tr = 11;
    print("Доллар:$usd\n Евро:$euro \n Рубль:$rub\n Лира:$tr");
  }
}

class Sell extends Value {
  course() {
    usd = 84;
    euro = 102;
    rub = 1.10;
    tr = 10.53;
    print("Доллар:$usd\n Евро:$euro \n Рубль:$rub\n Лира:$tr");
  }
}

som_to_other() {
  var value = new Buy();
  value.course();
  stdout.write(
      'Выберите валюту,в которую хотите перевести сомы:\n 1)USD \n 2) Euro \n 3) Rub \n 4) Lira\n');
  int val = int.parse(stdin.readLineSync());
  stdout.write('Введите сумму в сомах:');
  int sum = int.parse(stdin.readLineSync());
  switch (val) {
    case 1:
      print("${sum / value.usd}");
      break;
    case 2:
      print("${sum / value.euro}");
      break;
    case 3:
      print("${sum / value.rub}");
      break;
    case 4:
      print("${sum / value.tr}");
      break;
    default:
      print("Ошибка");
  }
}

other_to_som() {
  var value = new Sell();
  value.course();
  stdout.write(
      'Выберите валюту, в которую хотите перевести сомы: \n 1)USD \n 2) Euro \n 3) Rub \n 4) Lira\n');
  int val = int.parse(stdin.readLineSync());
  switch (val) {
    case 1:
      stdout.write('Введите доллары: ');
      int summa = int.parse(stdin.readLineSync());
      print('${value.usd * summa}');
      break;
    case 2:
      stdout.write('Введите евро: ');
      int summa = int.parse(stdin.readLineSync());
      print(value.euro * summa);
      break;
    case 3:
      stdout.write('Введите рубли: ');
      int summa = int.parse(stdin.readLineSync());
      print(value.rub * summa);
      break;
    case 4:
      stdout.write('Введите лиры: ');
      int summa = int.parse(stdin.readLineSync());
      print(value.tr * summa);
      break;
    default:
      print('Ошибка');
  }
}

