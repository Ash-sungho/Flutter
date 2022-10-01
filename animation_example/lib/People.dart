class People {

  People({required this.name,required this.height,required this.weight}){
    bmi = weight / (height/100) * (height / 100);
  }

  String name;
  double height;
  double weight;
  double? bmi;
}