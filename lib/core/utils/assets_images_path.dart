const String imageAssetsRoot = "assets/images/";
const String iconAssetsRoot = "assets/icons/";

String down = _getAssetsImagePath('World Down Syndrome day-bro.png');
String west = _getAssetsImagePath('west.png');
String shalal = _getAssetsImagePath('Head.png');
String ret = _getAssetsImagePath('ret.png');
String marakis = _getAssetsImagePath('location.png');
String practice = _getAssetsImagePath('practice_Healthy_habit.png');
String cold = _getAssetsImagePath('cold.png');
String colding = _getAssetsImagePath('cool.png');
String heart = _getAssetsImagePath('heart.jpeg');

String _getAssetsImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

String _getAssetsIconPath(String fileName) {
  return iconAssetsRoot + fileName;
}
