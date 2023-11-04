class AutoGenerate {
  AutoGenerate({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });
  late final int id;
  late final int sol;
  late final Camera camera;
  late final String imgSrc;
  late final String earthDate;
  late final Rover rover;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera = Camera.fromJson(json['camera']);
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
    rover = Rover.fromJson(json['rover']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sol'] = sol;
    _data['camera'] = camera.toJson();
    _data['img_src'] = imgSrc;
    _data['earth_date'] = earthDate;
    _data['rover'] = rover.toJson();
    return _data;
  }
}

class Camera {
  Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });
  late final int id;
  late final String name;
  late final int roverId;
  late final String fullName;

  Camera.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roverId = json['rover_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['rover_id'] = roverId;
    _data['full_name'] = fullName;
    return _data;
  }
}

class Rover {
  Rover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
    required this.cameras,
  });
  late final int id;
  late final String name;
  late final String landingDate;
  late final String launchDate;
  late final String status;
  late final int maxSol;
  late final String maxDate;
  late final int totalPhotos;
  late final List<Cameras> cameras;

  Rover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
    maxSol = json['max_sol'];
    maxDate = json['max_date'];
    totalPhotos = json['total_photos'];
    cameras =
        List.from(json['cameras']).map((e) => Cameras.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['landing_date'] = landingDate;
    _data['launch_date'] = launchDate;
    _data['status'] = status;
    _data['max_sol'] = maxSol;
    _data['max_date'] = maxDate;
    _data['total_photos'] = totalPhotos;
    _data['cameras'] = cameras.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Cameras {
  Cameras({
    required this.name,
    required this.fullName,
  });
  late final String name;
  late final String fullName;

  Cameras.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['full_name'] = fullName;
    return _data;
  }
}
