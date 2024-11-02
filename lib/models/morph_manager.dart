import '../models/morph_models.dart';

class MorphManager {
  static final MorphManager _instance = MorphManager._internal(); //싱글톤
  final List<Morph> _morphs;

  factory MorphManager() { //항상 같은 인스턴스 반환
    return _instance;
  }

  MorphManager._internal()
      : _morphs = [
          Morph(name: "Normal", inheritanceType: InheritanceType.dominant),
          Morph(name: "Albino", inheritanceType: InheritanceType.recessive),
          Morph(name: "Snow", inheritanceType: InheritanceType.polygenic),
          Morph(name: "Tangerine", inheritanceType: InheritanceType.polygenic),
          // TODO: 모프 더 추가 하기
        ];

  List<Morph> getMorphs() => _morphs;
}