import 'dart:convert';

TournamentModel tournamentModelFromJson(String str) => TournamentModel.fromJson(json.decode(str));

String tournamentModelToJson(TournamentModel data) => json.encode(data.toJson());

class TournamentModel {
  TournamentModel({
    this.code,
    this.data,
    this.success,
  });

  int? code;
  Data? data;
  bool? success;

  factory TournamentModel.fromJson(Map<String, dynamic> json) => TournamentModel(
    code: json["code"] == null ? null : json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "data": data == null ? null : data!.toJson(),
    "success": success == null ? null : success,
  };
}

class Data {
  Data({
    this.cursor,
    this.tournamentCount,
    this.tournaments,
    this.isLastBatch,
  });

  String? cursor;
  dynamic? tournamentCount;
  List<Tournament>? tournaments;
  bool? isLastBatch;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cursor: json["cursor"] == null ? null : json["cursor"],
    tournamentCount: json["tournament_count"],
    tournaments: json["tournaments"] == null ? null : List<Tournament>.from(json["tournaments"].map((x) => Tournament.fromJson(x))),
    isLastBatch: json["is_last_batch"] == null ? null : json["is_last_batch"],
  );

  Map<String, dynamic> toJson() => {
    "cursor": cursor == null ? null : cursor,
    "tournament_count": tournamentCount,
    "tournaments": tournaments == null ? null : List<dynamic>.from(tournaments!.map((x) => x.toJson())),
    "is_last_batch": isLastBatch == null ? null : isLastBatch,
  };
}

class Tournament {
  Tournament({
    this.isCheckInRequired,
    this.tournamentId,
    this.tournamentEnded,
    this.tournamentEndDate,
    this.areRandomTeamsAllowed,
    this.registeredTeams,
    this.adminLocale,
    this.regEndDate,
    this.startDate,
    this.rules,
    this.maxTeams,
    this.tournamentUrl,
    this.prizes,
    this.matchStyleType,
    this.pwaUrl,
    this.tournamentType,
    this.geo,
    this.maxLevelId,
    this.isPasswordRequired,
    this.name,
    this.matchStyle,
    this.registrationUrl,
    this.gamePkg,
    this.isRegistrationOpen,
    this.isWaitlistEnabled,
    this.incompleteTeamsAllowed,
    this.isAutoResultAllowed,
    this.teamSize,
    this.status,
    this.isLevelsEnabled,
    this.indexPage,
    this.dynamicAppUrl,
    this.minLevelId,
    this.gameFormat,
    this.details,
    this.gameIconUrl,
    this.regStartDate,
    this.winnersCount,
    this.coverUrl,
    this.bracketsUrl,
    this.tournamentSlug,
    this.discordUrl,
    this.gameId,
    this.resultSubmissionByAdmin,
    this.country,
    this.adminUsername,
    this.gameName,
    this.streamUrl,
  });

  bool? isCheckInRequired;
  String? tournamentId;
  bool? tournamentEnded;
  String? tournamentEndDate;
  bool? areRandomTeamsAllowed;
  int? registeredTeams;
  String? adminLocale;
  String? regEndDate;
  String? startDate;
  String? rules;
  int? maxTeams;
  String? tournamentUrl;
  String? prizes;
  MatchStyleType? matchStyleType;
  String? pwaUrl;
  TournamentType? tournamentType;
  String? geo;
  String? maxLevelId;
  bool? isPasswordRequired;
  String? name;
  MatchStyle? matchStyle;
  String? registrationUrl;
  dynamic? gamePkg;
  bool? isRegistrationOpen;
  bool? isWaitlistEnabled;
  bool? incompleteTeamsAllowed;
  bool? isAutoResultAllowed;
  int? teamSize;
  Status? status;
  bool? isLevelsEnabled;
  bool? indexPage;
  String? dynamicAppUrl;
  String? minLevelId;
  String? gameFormat;
  String? details;
  String? gameIconUrl;
  String? regStartDate;
  int? winnersCount;
  String? coverUrl;
  dynamic? bracketsUrl;
  String? tournamentSlug;
  String? discordUrl;
  String? gameId;
  bool? resultSubmissionByAdmin;
  String? country;
  String? adminUsername;
  String? gameName;
  String? streamUrl;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
    isCheckInRequired: json["is_check_in_required"] == null ? null : json["is_check_in_required"],
    tournamentId: json["tournament_id"] == null ? null : json["tournament_id"],
    tournamentEnded: json["tournament_ended"] == null ? null : json["tournament_ended"],
    tournamentEndDate: json["tournament_end_date"] == null ? null : json["tournament_end_date"],
    areRandomTeamsAllowed: json["are_random_teams_allowed"] == null ? null : json["are_random_teams_allowed"],
    registeredTeams: json["registered_teams"] == null ? null : json["registered_teams"],
    adminLocale: json["admin_locale"] == null ? null : json["admin_locale"],
    regEndDate: json["reg_end_date"] == null ? null : json["reg_end_date"],
    startDate: json["start_date"] == null ? null : json["start_date"],
    rules: json["rules"] == null ? null : json["rules"],
    maxTeams: json["max_teams"] == null ? null : json["max_teams"],
    tournamentUrl: json["tournament_url"] == null ? null : json["tournament_url"],
    prizes: json["prizes"] == null ? null : json["prizes"],
    matchStyleType: json["match_style_type"] == null ? null : matchStyleTypeValues.map![json["match_style_type"]],
    pwaUrl: json["pwa_url"] == null ? null : json["pwa_url"],
    tournamentType: json["tournament_type"] == null ? null : tournamentTypeValues.map![json["tournament_type"]],
    geo: json["geo"] == null ? null : json["geo"],
    maxLevelId: json["max_level_id"] == null ? null : json["max_level_id"],
    isPasswordRequired: json["is_password_required"] == null ? null : json["is_password_required"],
    name: json["name"] == null ? null : json["name"],
    matchStyle: json["match_style"] == null ? null : matchStyleValues.map![json["match_style"]],
    registrationUrl: json["registration_url"] == null ? null : json["registration_url"],
    gamePkg: json["game_pkg"],
    isRegistrationOpen: json["is_registration_open"] == null ? null : json["is_registration_open"],
    isWaitlistEnabled: json["is_waitlist_enabled"] == null ? null : json["is_waitlist_enabled"],
    incompleteTeamsAllowed: json["incomplete_teams_allowed"] == null ? null : json["incomplete_teams_allowed"],
    isAutoResultAllowed: json["is_auto_result_allowed"] == null ? null : json["is_auto_result_allowed"],
    teamSize: json["team_size"] == null ? null : json["team_size"],
    status: json["status"] == null ? null : statusValues.map![json["status"]],
    isLevelsEnabled: json["is_levels_enabled"] == null ? null : json["is_levels_enabled"],
    indexPage: json["index_page"] == null ? null : json["index_page"],
    dynamicAppUrl: json["dynamic_app_url"] == null ? null : json["dynamic_app_url"],
    minLevelId: json["min_level_id"] == null ? null : json["min_level_id"],
    gameFormat: json["game_format"] == null ? null : json["game_format"],
    details: json["details"] == null ? null : json["details"],
    gameIconUrl: json["game_icon_url"] == null ? null : json["game_icon_url"],
    regStartDate: json["reg_start_date"] == null ? null : json["reg_start_date"],
    winnersCount: json["winners_count"] == null ? null : json["winners_count"],
    coverUrl: json["cover_url"] == null ? null : json["cover_url"],
    bracketsUrl: json["brackets_url"],
    tournamentSlug: json["tournament_slug"] == null ? null : json["tournament_slug"],
    discordUrl: json["discord_url"] == null ? null : json["discord_url"],
    gameId: json["game_id"] == null ? null : json["game_id"],
    resultSubmissionByAdmin: json["result_submission_by_admin"] == null ? null : json["result_submission_by_admin"],
    country: json["country"] == null ? null : json["country"],
    adminUsername: json["admin_username"] == null ? null : json["admin_username"],
    gameName: json["game_name"] == null ? null : json["game_name"],
    streamUrl: json["stream_url"] == null ? null : json["stream_url"],
  );

  Map<String, dynamic> toJson() => {
    "is_check_in_required": isCheckInRequired == null ? null : isCheckInRequired,
    "tournament_id": tournamentId == null ? null : tournamentId,
    "tournament_ended": tournamentEnded == null ? null : tournamentEnded,
    "tournament_end_date": tournamentEndDate == null ? null : tournamentEndDate,
    "are_random_teams_allowed": areRandomTeamsAllowed == null ? null : areRandomTeamsAllowed,
    "registered_teams": registeredTeams == null ? null : registeredTeams,
    "admin_locale": adminLocale == null ? null : adminLocale,
    "reg_end_date": regEndDate == null ? null : regEndDate,
    "start_date": startDate == null ? null : startDate,
    "rules": rules == null ? null : rules,
    "max_teams": maxTeams == null ? null : maxTeams,
    "tournament_url": tournamentUrl == null ? null : tournamentUrl,
    "prizes": prizes == null ? null : prizes,
    "match_style_type": matchStyleType == null ? null : matchStyleTypeValues.reverse![matchStyleType],
    "pwa_url": pwaUrl == null ? null : pwaUrl,
    "tournament_type": tournamentType == null ? null : tournamentTypeValues.reverse![tournamentType],
    "geo": geo == null ? null : geo,
    "max_level_id": maxLevelId == null ? null : maxLevelId,
    "is_password_required": isPasswordRequired == null ? null : isPasswordRequired,
    "name": name == null ? null : name,
    "match_style": matchStyle == null ? null : matchStyleValues.reverse![matchStyle],
    "registration_url": registrationUrl == null ? null : registrationUrl,
    "game_pkg": gamePkg,
    "is_registration_open": isRegistrationOpen == null ? null : isRegistrationOpen,
    "is_waitlist_enabled": isWaitlistEnabled == null ? null : isWaitlistEnabled,
    "incomplete_teams_allowed": incompleteTeamsAllowed == null ? null : incompleteTeamsAllowed,
    "is_auto_result_allowed": isAutoResultAllowed == null ? null : isAutoResultAllowed,
    "team_size": teamSize == null ? null : teamSize,
    "status": status == null ? null : statusValues.reverse![status],
    "is_levels_enabled": isLevelsEnabled == null ? null : isLevelsEnabled,
    "index_page": indexPage == null ? null : indexPage,
    "dynamic_app_url": dynamicAppUrl == null ? null : dynamicAppUrl,
    "min_level_id": minLevelId == null ? null : minLevelId,
    "game_format": gameFormat == null ? null : gameFormat,
    "details": details == null ? null : details,
    "game_icon_url": gameIconUrl == null ? null : gameIconUrl,
    "reg_start_date": regStartDate == null ? null : regStartDate,
    "winners_count": winnersCount == null ? null : winnersCount,
    "cover_url": coverUrl == null ? null : coverUrl,
    "brackets_url": bracketsUrl,
    "tournament_slug": tournamentSlug == null ? null : tournamentSlug,
    "discord_url": discordUrl == null ? null : discordUrl,
    "game_id": gameId == null ? null : gameId,
    "result_submission_by_admin": resultSubmissionByAdmin == null ? null : resultSubmissionByAdmin,
    "country": country == null ? null : country,
    "admin_username": adminUsername == null ? null : adminUsername,
    "game_name": gameName == null ? null : gameName,
    "stream_url": streamUrl == null ? null : streamUrl,
  };
}

enum MatchStyle { BRACKETS, LOBBY }

final matchStyleValues = EnumValues({
  "brackets": MatchStyle.BRACKETS,
  "lobby": MatchStyle.LOBBY
});

enum MatchStyleType { SINGLE_ELIMINATION, SINGLE_LOBBY, MULTIPLE_LOBBIES }

final matchStyleTypeValues = EnumValues({
  "multiple_lobbies": MatchStyleType.MULTIPLE_LOBBIES,
  "single_elimination": MatchStyleType.SINGLE_ELIMINATION,
  "single_lobby": MatchStyleType.SINGLE_LOBBY
});

enum Status { PUBLISHED }

final statusValues = EnumValues({
  "published": Status.PUBLISHED
});

enum TournamentType { WEB, DISCORD }

final tournamentTypeValues = EnumValues({
  "discord": TournamentType.DISCORD,
  "web": TournamentType.WEB
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
