import 'dart:io';
//จงเขียนโปรแกรม มีความต้องการดังนี้ ต้องการรับข้อมูลยอดซื้อของลูกค้า 20 คน และต้องการนับจำนวนว่าคนที่ซื้อสินค้ายอดขายเกิน 1 ล้านบาทกี่คน ต่ำกว่า 1 ล้านบาท แต่มากกว่าหรือเท่ากับ 3 แสนบาทกี่คน และน้อยกว่า 3 แสนบาทกี่คน และ หายอดรวมของลูกค้าแต่ละกลุ่ม

//รับค่าจากแป้นพิมพ์และแปลงค่าเป็นตัวเลข
List<int> inputList(List<int> x) {
  for (int i = 0; i < x.length; i++) {
    stdout.write("Enter input[${i + 1}]: ");//แสดงข้อความ
    var s = stdin.readLineSync();//รับค่าจากแป้นพิมพ์
    x[i] = int.parse(s);//แปลงค่าเป็นตัวเลข
  }
  return x;//ส่งค่ากลับ
}

//นับจำนวน
int count(int x) {
  x = x + 1;//บวกค่าทีละ 1
  return x;//ส่งค่ากลับ
}

//บวกค่าของแต่ล่ะกลุ่ม
int sum(List<int> x, int i, int sum) {
  sum = sum + x[i];//นำมากบวกกัน
  return sum;//ส่งค่ากลับ
}

void main() {
  int c1 = 0; //นับจำนวนค่าที่มากกว่า1000000
  int sum1 = 0; //ผลรวมกลุ่มที่มากกว่า1000000
  int c2 = 0; //นับจำนวนค่าที่น้อยกว่า1000000 และ มากกว่า300000
  int sum2 = 0; //ผลรวมกลุ่มที่น้อยกว่า1000000 และ มากกว่า300000
  int c3 = 0; //นับจำนวนค่าที่น้อยกว่า300000
  int sum3 = 0; //ผลรวมกลุ่มที่น้อยกว่า300000
  List<int> n = new List(20);//จอง List 20ค่า
  n = inputList(n);//นำค่าที่รับเข้ามาเก็บไว้

  //แบ่งกลุ่ม
  for (int i = 0; i < n.length; i++) {
    if (n[i] >= 1000000) {//กลุ่มมากกว่า1000000
      c1 = count(c1);//นับจำนวน
      sum1 = sum(n, i, sum1);//นำค่าใน List มาบวกกัน
    } 
    else if (n[i] >= 300000 && n[i] < 1000000) {//กลุ่มน้อยกว่า1000000 และ มากกว่า300000
      c2 = count(c2);//นับจำนวน
      sum2 = sum(n, i, sum2);//นำค่าใน List มาบวกกัน
    } 
    else if (n[i] < 300000) {//กลุ่มน้อยกว่า300000
      c3 = count(c3);//นับจำนวน
      sum3 = sum(n, i, sum3);//นำค่าใน List มาบวกกัน
    }
  }

  //แสดงผล
  stdout.write('จำนวนผู้ที่มียอดซื้อเกิน 1ล้านบาท มีจำนวน $c1 คน');
  print(' มียอดรวมเท่ากับ $sum1 บาท');

  stdout.write('จำนวนผู้ที่มียอดซื้อน้อยกว่า 1ล้านบาทและมียอดซื้อเกิน 3แสนบาท มีจำนวน $c2 คน');
  print(' มียอดรวมเท่ากับ $sum2 บาท');

  stdout.write('จำนวนผู้ที่มียอดซื้อน้อยกว่า 3แสนบาท มีจำนวน $c3 คน');
  print(' มียอดรวมเท่ากับ $sum3 บาท');
}