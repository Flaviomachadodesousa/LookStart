// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

class Gameinfomodel {
  int id;
  String slug;
  String name;
  String nameOriginal;
  String description;
  int metacritic;
  String released;
  String updated;
  String backgroundImage;
  String backgroundImageAdditional;
  String website;
  double rating;
  int ratingTop;
  int added;
  int playtime;
  int screenshotsCount;
  int moviesCount;
  int creatorsCount;
  int achievementsCount;
  int parentAchievementsCount;
  String redditUrl;
  String redditName;
  String redditDescription;
  String redditLogo;
  int redditCount;
  int twitchCount;
  int youtubeCount;
  int reviewsTextCount;
  int ratingsCount;
  int suggestionsCount;
  String metacriticUrl;
  int parentsCount;
  int additionsCount;
  int gameSeriesCount;
  int reviewsCount;
  String saturatedColor;
  String dominantColor;
  String descriptionRaw;

  Gameinfomodel(
      {this.id,
      this.slug,
      this.name,
      this.nameOriginal,
      this.description,
      this.metacritic,
      this.released,
      this.updated,
      this.backgroundImage,
      this.backgroundImageAdditional,
      this.website,
      this.rating,
      this.ratingTop,
      this.added,
      this.playtime,
      this.screenshotsCount,
      this.moviesCount,
      this.creatorsCount,
      this.achievementsCount,
      this.parentAchievementsCount,
      this.redditUrl,
      this.redditName,
      this.redditDescription,
      this.redditLogo,
      this.redditCount,
      this.twitchCount,
      this.youtubeCount,
      this.reviewsTextCount,
      this.ratingsCount,
      this.suggestionsCount,
      this.metacriticUrl,
      this.parentsCount,
      this.additionsCount,
      this.gameSeriesCount,
      this.reviewsCount,
      this.saturatedColor,
      this.dominantColor,
      this.descriptionRaw});

  Gameinfomodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    nameOriginal = json['name_original'];
    description = json['description'];
    metacritic = json['metacritic'];
    released = json['released'];
    updated = json['updated'];
    backgroundImage = json['background_image'];
    backgroundImageAdditional = json['background_image_additional'];
    website = json['website'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    added = json['added'];
    playtime = json['playtime'];
    screenshotsCount = json['screenshots_count'];
    moviesCount = json['movies_count'];
    creatorsCount = json['creators_count'];
    achievementsCount = json['achievements_count'];
    parentAchievementsCount = json['parent_achievements_count'];
    redditUrl = json['reddit_url'];
    redditName = json['reddit_name'];
    redditDescription = json['reddit_description'];
    redditLogo = json['reddit_logo'];
    redditCount = json['reddit_count'];
    twitchCount = json['twitch_count'];
    youtubeCount = json['youtube_count'];
    reviewsTextCount = json['reviews_text_count'];
    ratingsCount = json['ratings_count'];
    suggestionsCount = json['suggestions_count'];
    metacriticUrl = json['metacritic_url'];
    parentsCount = json['parents_count'];
    additionsCount = json['additions_count'];
    gameSeriesCount = json['game_series_count'];
    reviewsCount = json['reviews_count'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    descriptionRaw = json['description_raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['name_original'] = this.nameOriginal;
    data['description'] = this.description;
    data['metacritic'] = this.metacritic;
    data['released'] = this.released;
    data['updated'] = this.updated;
    data['background_image'] = this.backgroundImage;
    data['background_image_additional'] = this.backgroundImageAdditional;
    data['website'] = this.website;
    data['rating'] = this.rating;
    data['rating_top'] = this.ratingTop;
    data['added'] = this.added;
    data['playtime'] = this.playtime;
    data['screenshots_count'] = this.screenshotsCount;
    data['movies_count'] = this.moviesCount;
    data['creators_count'] = this.creatorsCount;
    data['achievements_count'] = this.achievementsCount;
    data['parent_achievements_count'] = this.parentAchievementsCount;
    data['reddit_url'] = this.redditUrl;
    data['reddit_name'] = this.redditName;
    data['reddit_description'] = this.redditDescription;
    data['reddit_logo'] = this.redditLogo;
    data['reddit_count'] = this.redditCount;
    data['twitch_count'] = this.twitchCount;
    data['youtube_count'] = this.youtubeCount;
    data['reviews_text_count'] = this.reviewsTextCount;
    data['ratings_count'] = this.ratingsCount;
    data['suggestions_count'] = this.suggestionsCount;
    data['metacritic_url'] = this.metacriticUrl;
    data['parents_count'] = this.parentsCount;
    data['additions_count'] = this.additionsCount;
    data['game_series_count'] = this.gameSeriesCount;
    data['reviews_count'] = this.reviewsCount;
    data['saturated_color'] = this.saturatedColor;
    data['dominant_color'] = this.dominantColor;
    data['description_raw'] = this.descriptionRaw;
    return data;
  }
}
