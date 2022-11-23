class PokemonModel {
  List<Abilities>? abilities;
  int? baseExperience;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  String? name;
  int? order;
  Sprites? sprites;
  List<PokemonStats>? stats;
  List<Types>? types;
  int? weight;

  PokemonModel(
      {this.abilities,
      this.baseExperience,
      this.height,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.name,
      this.order,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    name = json['name'];
    order = json['order'];
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = <PokemonStats>[];
      json['stats'].forEach((v) {
        stats!.add(PokemonStats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = baseExperience;
    data['height'] = height;
    data['id'] = id;
    data['is_default'] = isDefault;
    data['location_area_encounters'] = locationAreaEncounters;
    data['name'] = name;
    data['order'] = order;
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? Ability.fromJson(json['ability']) : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ability != null) {
      data['ability'] = ability!.toJson();
    }
    data['is_hidden'] = isHidden;
    data['slot'] = slot;
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Sprites {
  Other? other;

  Sprites({this.other});

  Sprites.fromJson(Map<String, dynamic> json) {
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (other != null) {
      data['other'] = other!.toJson();
    }
    return data;
  }
}

class Other {
  OfficialArtwork? officialArtwork;

  Other({this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    officialArtwork = json['official-artwork'] != null
        ? OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (officialArtwork != null) {
      data['official-artwork'] = officialArtwork!.toJson();
    }
    return data;
  }
}

class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    return data;
  }
}

class PokemonStats {
  int? baseStat;
  int? effort;
  Ability? stat;

  PokemonStats({this.baseStat, this.effort, this.stat});

  PokemonStats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? Ability.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
