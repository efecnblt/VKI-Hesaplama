import 'dart:math';

class Calculate {
  Calculate({required this.height, required this.weight});

  final int height;
  final int weight;
  double bmi = 0.0;

  double calculate_bmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  String getBodyType() {
    if (bmi >= 40) {
      return "Aşırı Obez";
    } else if (bmi >= 30) {
      return "Obez";
    } else if (bmi >= 25) {
      return "Aşırı kilolu";
    } else if (bmi >= 20) {
      return "Normal";
    } else {
      return "Düşük Kilolu";
    }
  }

  String getDescription() {
    if (bmi >= 40) {
      return "Obezite; kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna başvurup, hekim ve diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir.";
    } else if (bmi >= 30) {
      return "Obezite; kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna başvurup, hekim ve diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir.";
    } else if (bmi >= 25) {
      return "Fazla kilolu olmak, sağlıklı beslenmediğinizin işareti olabilir ve kronik hastalıklara yakalanma riskini arttırır. Önemli olan sağlıklı kiloda olup, bu kiloyu korumak ve dinç kalabilmeyi sağlamaktır.";
    } else if (bmi >= 20) {
      return "Sağlıklı kilo aralığında olmak, öncelikle hastalıklara yakalanma riskini azaltır ve yaşam kalitesi için önemlidir.";
    } else {
      return "VKİ değerine göre zayıf olmanız sağlıklı beslenmediğinizin işaret olabilir. Önemli olan sağlıklı kiloda olup, bu kiloyu korumak ve dinç kalabilmeyi sağlamaktır.";
    }
  }
}
