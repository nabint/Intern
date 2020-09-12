class Album {
  final int userId;
  final int id;
  final String albumTitle;
  Album(
    this.userId,
    this.id,
    this.albumTitle,
  );
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(json['userId'], json['id'], json['title']);
  }
}
