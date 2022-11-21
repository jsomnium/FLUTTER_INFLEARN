class Book {
  String title;
  String subtitle;
  String thumbnail;
  String previewLink;

  Book({
    required this.title,
    required this.subtitle,
    required this.thumbnail,
    required this.previewLink,
  });

  factory Book.fromJson(Map<String, dynamic> volumeInfo) {
    return Book(
      // title이 없는 경우 빈 문자열 할당
      title: volumeInfo["title"] ?? "",
      // subtitle이 없는 경우 빈 문자열 할당
      subtitle: volumeInfo["subtitle"] ?? "",
      // imageLisks 또는 thumbnail이 없을 때 빈 이미지 추가
      thumbnail: volumeInfo["imageLinks"]?["thumbnail"] ??
          "https://i.ibb.co/2ypYwdr/no-photo.png",
      // previewLink가 없는 경우 빈 문자열 할당
      previewLink: volumeInfo["previewLink"] ?? "",
    );
  }
}
