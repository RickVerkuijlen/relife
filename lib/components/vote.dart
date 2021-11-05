class Vote{
  late String title;
  late String numberOfVotes;

  Vote(this.title, this.numberOfVotes);

  Vote.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    numberOfVotes = json['numberOfVotes'];
  }
}