class Photo {
  final int albumId;
  final int id;
  final String photoTitle;
  final String photoUrl;
  final String thumbnailUrl;
  Photo(
    this.albumId,
    this.id,
    this.photoTitle,
    this.photoUrl,
    this.thumbnailUrl,
  );
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      json['albumId'],
      json['id'],
      json['title'],
      json['url'],
      json['thumbnailUrl'],
    );
  }
}
