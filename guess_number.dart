import 'dart:io';
import 'dart:math';

void main() {
  choose_func();
}

choose_func() {
  stdout.write(
      'Выберите режим игры: \n 1) Угадывает компьютер\n 2) Угадываете вы\n');
  int mode = int.parse(stdin.readLineSync());
  switch (mode) {
    case 1:
      comp_func();
      break;
    case 2:
      print("Вы будете угадывать число:");
      me_func();
      break;
    default:
      print("Ошибка такого режима нет");
      choose_func();
      break;
  }
}

me_func() {
  var rnd = new Random();
  int randomNumber = rnd.nextInt(100);
  var easy;
  // print(randomNumber);
  while (randomNumber != easy) {
    int easy = int.parse(stdin.readLineSync());
    if (easy == randomNumber) {
      print("Вы угадали число");
      restart_func();
    } else if (easy < randomNumber)
      print("Число больше");
    else if (easy > randomNumber) print("Число меньше");
  }
}

comp_func() {
  print(
      'Загадайте число от 0 до 100. Выберите уровень сложности:\n1 - легкий;\n2 - cложный');
  int level = int.parse(stdin.readLineSync());
  stdout.write("Введите число(компьютер не видит его): ");
  int.parse(stdin.readLineSync());
  switch (level) {
    case 1:
      rec_func(50, 0, 100);
      newrand_func();
      break;
    case 2:
      rec_func(50, 0, 100);
  }
}

newrand_func() {
  var rand = new Random();
  int randomNum = rand.nextInt(100);
  print(randomNum);
  stdout.write('Это число?\n1) да\n2) нет\n');
  int choose = int.parse(stdin.readLineSync());
  switch (choose) {
    case 1:
      print('Компьютер угадал ваше число...');
      break;
    case 2:
      newrand_func();
  }
}

rec_func(int mid, min, max) {
  print(mid);
  print('1) верно\n2) больше\n3) меньше');
  int answer = int.parse(stdin.readLineSync());
  if (answer == 1)
    restart_func();
  else if (answer == 2) {
    rec_func((mid + (max - mid) / 2).round(), min = mid, max);
  } else if (answer == 3) {
    rec_func((mid - (mid - min) / 2).round(), min, max = mid);
  }
}

restart_func() {
  stdout.write(
      "Поздравляем вы угадали число!Вы хотели бы еще раз сыграть ? \n 1)да \n 2) нет\n");
  int restart = int.parse(stdin.readLineSync());
  switch (restart) {
    case 1:
      choose_func();
      break;
    case 2:
      print("До свидания!");
      break;
    default:
      print("Что-то пошло не так попрбуйте еще раз...");
      restart_func();
      break;
  }
}
