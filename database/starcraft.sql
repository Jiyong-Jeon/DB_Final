grant all privileges on  *.* to 'root'@'%' identified by 'mysql1234';
delete from mysql.user where host="localhost" and user="root";
flush privileges;
select host,user,plugin,authentication_string from mysql.user;

#####
DROP DATABASE IF EXISTS `stardb` ;

CREATE DATABASE IF NOT EXISTS `stardb` 
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

USE `stardb`;

CREATE TABLE `skill` (
    id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `mp` INT,
    `desc` VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `zergBuild` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `imagePath` VARCHAR(255),
    `name` VARCHAR(255) NOT NULL,
    `mineral` INT NOT NULL,
    `gas` INT NOT NULL,
    `time` INT NOT NULL,
    `health` VARCHAR(255) NOT NULL,
    `armor` VARCHAR(255) NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    `groundDamage` VARCHAR(255),
    `airDamage` VARCHAR(255),
    `groundRange` VARCHAR(255),
    `airRange` VARCHAR(255),
    `skill_1_ID` INT,
    PRIMARY KEY (id),
    FOREIGN KEY (skill_1_ID) REFERENCES skill(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `zergUnit` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `imagePath` VARCHAR(255),
    `name` VARCHAR(255) NOT NULL,
    `char` VARCHAR(255) NOT NULL,
    `mineral` INT NOT NULL,
    `gas` INT NOT NULL,
    `population` INT NOT NULL,
    `time` INT NOT NULL,
    `health` VARCHAR(255) NOT NULL,
    `armor` VARCHAR(255) NOT NULL,
    `speed` INT NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    `groundDamage` VARCHAR(255),
    `airDamage` VARCHAR(255),
    `groundRange` VARCHAR(255),
    `airRange` VARCHAR(255),
    `skill_1_ID` INT,
    `skill_2_ID` INT,
    `skill_3_ID` INT,
    `skill_4_ID` INT,
    `building_ID` INT,
    PRIMARY KEY (id),
    FOREIGN KEY (skill_1_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_2_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_3_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_4_ID) REFERENCES skill(id),
    FOREIGN KEY (building_ID) REFERENCES zergBuild(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
CREATE TABLE `terranBuild` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `imagePath` VARCHAR(255),
    `name` VARCHAR(255) NOT NULL,
    `mineral` INT NOT NULL,
    `gas` INT NOT NULL,
    `time` INT NOT NULL,
    `health` VARCHAR(255) NOT NULL,
    `armor` VARCHAR(255) NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    `groundDamage` VARCHAR(255),
    `airDamage` VARCHAR(255),
    `groundRange` VARCHAR(255),
    `airRange` VARCHAR(255),
    `skill_1_ID` INT,
    `skill_2_ID` INT,
    PRIMARY KEY (id),
    FOREIGN KEY (skill_1_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_2_ID) REFERENCES skill(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `terranUnit` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `imagePath` VARCHAR(255),
    `name` VARCHAR(255) NOT NULL,
    `char` VARCHAR(255) NOT NULL,
    `mineral` INT NOT NULL,
    `gas` INT NOT NULL,
    `population` INT NOT NULL,
    `time` INT NOT NULL,
    `health` VARCHAR(255) NOT NULL,
    `armor` VARCHAR(255) NOT NULL,
    `speed` INT NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    `groundDamage` VARCHAR(255),
    `airDamage` VARCHAR(255),
    `groundRange` VARCHAR(255),
    `airRange` VARCHAR(255),
    `skill_1_ID` INT,
    `skill_2_ID` INT,
    `skill_3_ID` INT,
    `skill_4_ID` INT,
    `building_ID` INT,
    PRIMARY KEY (id),
    FOREIGN KEY (skill_1_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_2_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_3_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_4_ID) REFERENCES skill(id),
    FOREIGN KEY (building_ID) REFERENCES terranBuild(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
CREATE TABLE `protossBuild` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `imagePath` VARCHAR(255),
    `name` VARCHAR(255) NOT NULL,
    `mineral` INT NOT NULL,
    `gas` INT NOT NULL,
    `time` INT NOT NULL,
    `health` VARCHAR(255) NOT NULL,
    `shield` VARCHAR(255) NOT NULL,
    `armor` VARCHAR(255) NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    `groundDamage` VARCHAR(255),
    `airDamage` VARCHAR(255),
    `groundRange` VARCHAR(255),
    `airRange` VARCHAR(255),
    `skill_1_ID` INT,
    PRIMARY KEY (id),
    FOREIGN KEY (skill_1_ID) REFERENCES skill(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `protossUnit` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `imagePath` VARCHAR(255),
    `name` VARCHAR(255) NOT NULL,
    `char` VARCHAR(255) NOT NULL,
    `mineral` INT NOT NULL,
    `gas` INT NOT NULL,
    `population` INT NOT NULL,
    `time` INT NOT NULL,
    `health` VARCHAR(255) NOT NULL,
    `shield` VARCHAR(255) NOT NULL,
    `armor` VARCHAR(255) NOT NULL,
    `speed` INT NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    `groundDamage` VARCHAR(255),
    `airDamage` VARCHAR(255),
    `groundRange` VARCHAR(255),
    `airRange` VARCHAR(255),
    `skill_1_ID` INT,
    `skill_2_ID` INT,
    `skill_3_ID` INT,
    `skill_4_ID` INT,
    `building_ID` INT,
    PRIMARY KEY (id),
    FOREIGN KEY (skill_1_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_2_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_3_ID) REFERENCES skill(id),
    FOREIGN KEY (skill_4_ID) REFERENCES skill(id),
    FOREIGN KEY (building_ID) REFERENCES protossBuild(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
INSERT INTO `skill` (`id`, `name`, `mp`, `desc`) VALUES
    (null, '번식지로 변이', 0, '부화장을 번식지로 변이'),
    (null, '군락으로 변이', 0, '번식지를 군락으로 변이'),
    (null, '공격 군체로 변이', 0, '점막 군체를 공격 군체로 변이'),
    (null, '거대 둥지탑으로 변이', 0, '둥지탑을 거대 둥지탑으로 변이'),
    (null, '땅굴관 생성', 0, '반대편 땅굴관을 생성'), #5
    (null, '잠복(버로우)', 0, '바닥에 굴을 파고 숨는다.'),
    (null, '수송 능력', 0, '아군을 수송 가능'),
    (null, '러커 변이', 0, '히드라리스크가 러커로 변이'),
    (null, '가디언, 디바우러 변이', 0, '뮤탈리스크가 가디언 혹은 디바우러로 변이'),
    (null, '패러사이트', 75, '적의 시야를 확보'), #10
    (null, '인스네어', 75, '적의 이동속도과 공격속도를 낮춤'),
    (null, '브루들링', 150, '적의 지상유닛을 죽이고 브루들링 2마리를 생성'),
    (null, '사령부 점령', 0, '체력이 낮은 테란 사령부 건물을 점렴'),
    (null, '다크 스웜', 100, '구름 안에 있는 유닛들은 일반적인 원거리 공격을 받아도 피해를 입지 않는다.'),
    (null, '플레이그', 150, '피해 유닛의 체력을 방어력에 관계없이 틱당 4를 깎아 체력이 1남을때 까지 깎는다.'), #15
    (null, '컨슘', 0, '동족을 죽이고 에너지 50을 회복한다.'),
    (null, '이륙, 착륙', 0, '건물이 공중으로 이륙하여 움직일 수 있다.'), # 17
    (null, '커맨드 부속건물', 0, '부속건물로 컴샛 스테이션이나 뉴클리어 사일로를 생성'),
    (null, '머신 샵', 0, '부속건물로 머신 샵을 생성'),
    (null, '컨트롤 타워', 0, '부속건물로 컨트롤 타워를 생성'), #20
    (null, '과학시설 부속건물', 0, '부속건물로 피직스 랩이나 커버트 옵스를 생성'),
    (null, '수리', 0, '기계 수리'),
    (null, '스팀팩', 0, '체력을 10 소모하고 일시적으로 이동속도와 공격속도를 급격히 높인다.'),
    (null, '은신', 25, '투명 상태로 변환하고 마나가 지속적으로 감소'),
    (null, '락다운', 150, '기계화 유닛을 대상으로 잠시 기능을 상실하게 한다.'), #25
    (null, '핵 공격', 0, '아군 핵 미사일 기지로 부터 정확하게 공격을 유도한다.'),
    (null, '힐', 5, '생체 유닛의 체력을 회복시켜준다.'),
    (null, '회복', 50, '해로운 상태 이상을 제거한다.'),
    (null, '광학 조명탄', 75, '대상의 시각기관에 심각한 손상을 입혀 시야를 없앤다.'),
    (null, '스파이더 마인 매설', 0, '스파이더 마인을 매설한다. (최대 3개)'), #30
    (null, '공성 모드', 0, '공성 모드로 전환한다.'),
    (null, '전차 모드', 0, '전차 모드로 전환한다.'),
    (null, '방어막', 100, '짧은 시간 동안 적의 강력한 공격을 흡수해 내는 방어막을 생성한다.'),
    (null, 'EMP 충격파', 100, '유닛의 보호막과 마나를 0으로 만든다.'),
    (null, '방사선', 75, '오염된 유닛과 근처에 있는 모든 생체 유닛에게 피해를 준다.'), #35
    (null, '야마토 포', 150, '강력한 포를 쏴 260의 피해를 입힌다.'),
    (null, '보호막 충전', 1, '빠른 속도로 아군의 보호막을 충전한다.'),
    (null, '스톰', 75, '넓은 범위에 강한데미지를 입힌다.'),
    (null, '환상', 100, '실체는 없지만 대상과 완벽하게 같은 생김새의 환상을 2마리 만든다.'),
    (null, '아칸 소환', 0, '하이템플러 2기를 희생해 아칸을 소환한다.'), #40
    (null, '다크 아칸 소환', 0, '다크템플러 2기를 희생해 다크아칸을 소환한다.'),
    (null, '피드백', 50, '선택한 대상의 에너지만큼 피해를 주고 에너지를 0으로 만든다.'),
    (null, '마엘스트롬', 100, '지정한 범위의 생체유닛을 22틱 동안 정지시킨다.'),
    (null, '마인드 컨트롤', 150, '지정한 유닛이 영구히 아군이 된다.'),
    (null, '스캐럽 생산', 0, '25 미네랄을 사용하여 스캐럽을 생산한다.'), #45
    (null, '인터셉터 생산', 0, '25 미네랄을 사용하여 인터셉터를 생산한다.'),
    (null, '스테이시스 필드', 100, '일정 공간의 유닛을 행동불능으로 만든다.'),
    (null, '리콜', 150, '다른 공간의 아군 유닛을 시전 유닛의 옆으로 불러낸다.'),
    (null, '웹', 125, '일정 공간의 지상유닛의 공격을 무력화한다.');
    
INSERT INTO `zergBuild` (`id`, `imagePath`, `name`, `mineral`, `gas`, `time`, `health`, `armor`, `desc`, `groundDamage`, `airDamage`, `groundRange`, `airRange`, `skill_1_ID`) VALUES 
    (null, 'images/zerg/hatchery.png', '부화장', 300, 0, 120, '1250', '1', '저그의 기본 건물, 라바 생성 건물', null, null, null, null, 1),
    (null, 'images/zerg/lair.png', '번식지', 150, 100, 100, '1800', '1', '부화장에서 변이된 건물, 라바 생성 건물', null, null, null, null, 2),
    (null, 'images/zerg/hive.png', '군락', 200, 150, 120, '2500', '1', '번식지에서 변이된 건물, 라바 생성 건물', null, null, null, null, null),
    (null, 'images/zerg/creepColony.png', '점막 군체', 75, 0, 20, '400', '0', '방어능력이 없고 크립을 넓히는 기능', null, null, null, null, 3),
    (null, 'images/zerg/spore.png', '포자 군체', 50, 0, 20, '400', '0', '공중 공격이 가능한 방어시설, 탐지능력이 포함', null, '15', null, '7', null),
    (null, 'images/zerg/sunken.png', '지하 군체', 50, 0, 20, '300', '2', '지상 공격이 가능한 방어시설', '40', null, '7', null, null),
    (null, 'images/zerg/extractor.png', '추출장', 50, 0, 40, '750', '1', '가스를 채취할 수 있음', null, null, null, null, null),
    (null, 'images/zerg/pool.png', '산란못', 200, 0, 80, '750', '1', '저글링 생산 가능, 저글링 진화 연구', null, null, null, null, null),
    (null, 'images/zerg/chamber.png', '진화장', 75, 0, 40, '750', '1', '지상 유닛 업그레이드', null, null, null, null, null),
    (null, 'images/zerg/hydraliskDen.png', '히드라리스크 굴', 100, 50, 40, '850', '1', '히드라리스크 생산 가능, 히드라리스크 진화 연구', null, null, null, null, null),
    (null, 'images/zerg/spire.png', '둥지탑', 200, 150, 120, '600', '1', '뮤탈리스크와 스컬지 생산 가능, 공중 유닛 업그레이드', null, null, null, null, 4),
    (null, 'images/zerg/greaterSpire.png', '거대 둥지탑', 100, 150, 120, '1000', '1', '가디언과 디바우러 변태 가능, 공중 유닛 업그레이드', null, null, null, null, null),
    (null, 'images/zerg/nest.png', '여왕의 둥지', 150, 100, 60, '850', '1', '퀸 생산 가능, 퀸 진화 연구', null, null, null, null, null),
    (null, 'images/zerg/canal.png', '땅굴관', 150, 0, 40, '250', '1', '이어진 다른 땅굴관으로 지상 병력을 이동 가능', null, null, null, null, 5),
    (null, 'images/zerg/ultraliskCavern.png', '울트라리스크 동굴', 150, 200, 80, '600', '1', '울트라리스크 생산 가능, 울트라리스크 진화 연구', null, null, null, null, null),
    (null, 'images/zerg/defilerMound.png', '파멸충 언덕', 100, 100, 60, '850', '1', '디파일러 생산 가능, 디파일러 진화 연구', null, null, null, null, null),
    (null, 'images/zerg/InfestedCenter.png', '감염된 사령부', 0, 0, 0, '1500', '1', '테란의 사령부를 감염시켜서 생성, 감염된 테란 생산 가능', null, null, null, null, null);
    
INSERT INTO `zergUnit` (`id`, `imagePath`, `name`, `char`, `mineral`, `gas`, `population`, `time`, `health`, `armor`, `speed`, `desc`, `groundDamage`, `airDamage`, `groundRange`, `airRange`, `skill_1_ID`, `skill_2_ID`, `skill_3_ID`, `skill_4_ID`, `building_ID`) VALUES 
    (null, 'images/zerg/larva.png', '라바', '지상, 소형, 생체', 0, 0, 0, 0, '25', '10', 1, '저그 유닛의 시작', null, null, null, null, null, null, null, null, 1),
    (null, 'images/zerg/drone.png', '드론', '지상, 소형, 생체', 50, 0, 1, 20, '40', '0 (+1)', 2, '자원 채취 가능, 저그 건물로 변태 가능', '5', null, '1', null, 6, null, null, null, 1),
    (null, 'images/zerg/zergling.png', '저글링', '지상, 소형, 생체', 50, 0, 1, 28, '35', '0 (+1)', 4, '생성시 2마리가 생성', '5 (+1)', null, '1', null, 6, null, null, null, 8),
    (null, 'images/zerg/overload.png', '오버로드', '공중, 대형, 생체', 100, 0, 0, 40, '200', '0 (+1)', 0, '인구수 8 제공, 탐지 능력', null, null, null, null, 7, null, null, null, 1),
    (null, 'images/zerg/hydralisk.png', '히드라리스크', '지상, 중형, 생체', 75, 25, 1, 28, '80', '0 (+1)', 2, '원거리 유닛으로 지상과 공중을 모두 공격 가능', '10 (+1)', '10 (+1)', '4 (+1)', '4 (+1)', 6, 8, null, null, 10),
    (null, 'images/zerg/mutalist.png', '뮤탈리스크', '공중, 소형, 생체', 100, 100, 2, 40, '120', '0 (+1)', 3, '공격시 투사체가 튕겨 주변의 적을 공격', '9 (+3)', '9 (+3)', '3', '3', 9, null, null, null, 11),
    (null, 'images/zerg/scourge.png', '스커지', '공중, 소형, 생체', 25, 75, 1, 30, '25', '0 (+1)', 3, '생성시 2마리가 생성, 공격시 자살', null, '110', null, '1', null, null, null, null, 11),
    (null, 'images/zerg/queen.png', '퀸', '공중, 중형, 생체', 100, 100, 2, 50, '120', '0 (+1)', 3, '마법을 사용, 사령부 감염 가능', null, null, null, null, 10, 11, 12, 13, 13),
    (null, 'images/zerg/lurker.png', '러커', '지상, 중형, 생체', 50, 100, 2, 40, '125', '1 (+1)', 3, '버로우 상태에서만 공격이 가능, 직선으로 범위 공격', '20 (+2)', null, '6', null, 6, null, null, null, 10),
    (null, 'images/zerg/ultralisk.png', '울트라리스크', '지상, 대형, 생체', 200, 200, 4, 60, '400', '1 (+2)(+1)', 3, '저그 최강 지상 유닛', '20 (+3)', null, '1', null, null, null, null, null, 15),
    (null, 'images/zerg/defiler.png', '디파일러', '지상, 중형, 생체', 50, 150, 2, 50, '80', '1 (+1)', 2, '마법을 사용', null, null, null, null, 6, 14, 15, 16, 16),
    (null, 'images/zerg/guardian.png', '가디언', '공중, 대형, 생체', 50, 100, 2, 40, '150', '2 (+1)', 1, '지상 공격만 가능, 긴 사거리를 이용하여 공격', '20 (+2)', null, '8', null, null, null, null, null, 12),
    (null, 'images/zerg/devourer.png', '디바우러', '공중, 대형, 생체', 150, 50, 2, 40, '250', '2 (+1)', 2, '공중 공격만 가능, 범위형 공격, 공격시 적의 공격속도를 낮춤', null, '25 (+2)', null, '6', null, null, null, null, 12),
    (null, 'images/zerg/InfestedTerran.png', '감염된 테란', '지상, 소형, 생체', 100, 50, 1, 40, '60', '0 (+1)', 3, '공격시 자살, 범위형 공격', '500', null, '1', null, 6, null, null, null, 17);

INSERT INTO `terranBuild` (`id`, `imagePath`, `name`, `mineral`, `gas`, `time`, `health`, `armor`, `desc`, `groundDamage`, `airDamage`, `groundRange`, `airRange`, `skill_1_ID`, `skill_2_ID`) VALUES 
    (null, 'images/terran/commandCenter.png', '사령부', 400, 0, 120, '1500', '1', '테란의 기본 건물, 인구수 10 지원', NULL, NULL, NULL, NULL, 17, 18),
    (null, 'images/terran/barrack.png', '병영', 150, 0, 80, '1000', '1', '바이오닉 유닛을 생성', NULL, NULL, NULL, NULL, 17, NULL),
    (null, 'images/terran/factory.png', '군수공장', 200, 100, 80, '1250', '1', '매카닉 유닛을 생성', NULL, NULL, NULL, NULL, 17, 19),
    (null, 'images/terran/starport.png', '우주공항', 150, 100, 70, '1300', '1', '공중 유닛을 생성', NULL, NULL, NULL, NULL, 17, 20),
    (null, 'images/terran/supply.png', '보급고', 100, 0, 40, '500', '1', '인구수 8 지원', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'images/terran/refinery.png', '정제소', 100, 0, 40, '750', '1', '가스를 채취 가능', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'images/terran/engineeringBay.png', '공학연구소', 125, 0, 60, '850', '1', '바이오닉 유닛 업그레이드, 미사일 터렛 생성 가능', NULL, NULL, NULL, NULL, 17, NULL),
    (null, 'images/terran/turret.png', '미사일 터렛', 75, 0, 30, '200', '0', '공중 공격이 가능한 건물', NULL, '20', NULL, '7', NULL, NULL),
    (null, 'images/terran/academy.png', '사관학교', 150, 0, 80, '600', '1', '바이오닉 유닛 부속 업그레이드', NULL, NULL, NULL, NULL, NULL, NULL),
    (null, 'images/terran/bunker.png', '벙커', 100, 0, 30, '350', '1', '바이오닉 유닛이 들어가서 공격 가능', NULL, NULL, NULL, NULL, 7, NULL),
    (null, 'images/terran/scienceFacility.png', '과학시설', 100, 150, 60, '850', '1', '사이언스 배슬 생산가능, 배슬 업그레이드', NULL, NULL, NULL, NULL, 17, 21),
    (null, 'images/terran/armory.png', '무기고', 100, 50, 80, '750', '1', '메카닉 유닛 업그레이드, 골리앗 및 발키리 생산 가능', NULL, NULL, NULL, NULL, NULL, NULL);
    
INSERT INTO `terranUnit` (`id`, `imagePath`, `name`, `char`, `mineral`, `gas`, `population`, `time`, `health`, `armor`, `speed`, `desc`, `groundDamage`, `airDamage`, `groundRange`, `airRange`, `skill_1_ID`, `skill_2_ID`, `skill_3_ID`, `skill_4_ID`, `building_ID`) VALUES 
    (null, 'images/terran/scv.png', 'SCV', '지상, 소형, 생체, 기계', 50, 0, 1, 20, '60', '0 (+1)', 2, '자원 채취 가능, 테란 건물 건설', '5', NULL, '1', NULL, 22, NULL, NULL, NULL, 1),
    (null, 'images/terran/marine.png', '마린', '지상, 소형, 생체', 50, 0, 1, 24, '40', '0 (+1)', 2, '바이오닉 유닛의 대표', '6 (+1)', '6 (+1)', '4 (+1)', '4 (+1)', 23, NULL, NULL, NULL, 2),
    (null, 'images/terran/firebat.png', '파이어뱃', '지상, 소형, 생체', 50, 25, 1, 24, '50', '1 (+1)', 2, '지상 범위 공격', '{8 (+1)} * 2', NULL, '1.5', NULL, 23, NULL, NULL, NULL, 2),
    (null, 'images/terran/ghost.png', '고스트', '지상, 소형, 생체', 25, 75, 1, 50, '45', '0 (+1)', 2, '진동형 공격으로 대형유닛에게 강하다.', '10 (+1)', '10 (+1)', '7', '7', 24, 25, 26, NULL, 2),
    (null, 'images/terran/medic.png', '메딕', '지상, 소형, 생체', 50, 25, 1, 30, '60', '1 (+1)', 2, '공격을 하지 못하고 아군을 보조하는 유닛', NULL, NULL, NULL, NULL, 27, 28, 29, NULL, 2),
    (null, 'images/terran/vulture.png', '벌쳐', '지상, 중형, 기계', 75, 0, 2, 30, '80', '0 (+1)', 4, '빠른 이동 속도를 자랑', '20 (+2)', NULL, '5', NULL, 30, NULL, NULL, NULL, 3),
    (null, 'images/terran/tank.png', '탱크(전차모드)', '지상, 대형, 기계', 150, 100, 2, 50, '150', '1 (+1)', 2, '공성모드로 전환이 가능하다.', '30 (+3)', NULL, '7', NULL, 31, NULL, NULL, NULL, 3),
    (null, 'images/terran/tank_siegeMode.png', '탱크(공성모드)', '지상, 대형, 기계', 150, 100, 2, 50, '150', '1 (+1)', 0, '최소 사거리가 2이며 공격시 주변까지 손해를 입힌다.', '70 (+5)', NULL, '12', NULL, 32, NULL, NULL, NULL, 3),
    (null, 'images/terran/goliath.png', '골리앗', '지상, 대형, 기계', 100, 50, 2, 40, '125', '1 (+1)', 2, '공중 공격이 더 강하다.', '12 (+1)', '10 (+2) * 2', '6', '5 (+3)', NULL, NULL, NULL, NULL, 3),
    (null, 'images/terran/wraith.png', '레이스', '공중, 대형, 기계', 150, 100, 2, 60, '120', '0 (+1)', 3, '클로킹을 활용한 교란작전에 용이하다.', '8 (+1)', '20 (+2)', '5', '5', 24, NULL, NULL, NULL, 4),
    (null, 'images/terran/dropship.png', '드랍쉽', '공중, 대형, 기계', 100, 100, 2, 50, '150', '1 (+1)', 2, '유닛 수송', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, 4),
    (null, 'images/terran/vessel.png', '베슬', '공중, 대형, 기계', 100, 225, 2, 80, '200', '1 (+1)', 2, '디텍터, 마법을 사용', NULL, NULL, NULL, NULL, 33, 34, 35, NULL, 4),
    (null, 'images/terran/battlecruiser.png', '배틀크루저', '공중, 대형, 기계', 400, 300, 6, 133, '500', '3 (+1)', 1, '테란 유닛 중 가장 강한 유닛', '25 (+3)', '25 (+3)', '6', '6', 36, NULL, NULL, NULL, 4),
    (null, 'images/terran/valkyrie.png', '발키리', '공중, 대형, 기계', 250, 125, 3, 50, '200', '2 (+1)', 3, '공중 공격만 가능하며 4번연속 공격하며 범위 공격을 한다.', NULL, '6 (+1) * 8', NULL, '6', NULL, NULL, NULL, NULL, 4);

INSERT INTO `protossBuild` (`id`, `imagePath`, `name`, `mineral`, `gas`, `time`, `health`, `shield`, `armor`, `desc`, `groundDamage`, `airDamage`, `groundRange`, `airRange`, `skill_1_ID`) VALUES 
    (null, 'images/protoss/nexus.png', '넥서스', 400, 0, 120, '750', '750', '1', '프로토스 기본 건물', NULL, null, null, null, null),
    (null, 'images/protoss/gate.png', '관문', 150, 0, 60, '500', '500', '1', '지상 유닛 생성 건물', null, null, null, null, null),
    (null, 'images/protoss/robotics.png', '로봇공학 시설', 200, 200, 80, '500', '500', '1', '로보틱스 테크 유닛 생성 건물', null, null, null, null, null),
    (null, 'images/protoss/stargate.png', '우주관문', 150, 150, 70, '600', '600', '1', '공중 유닛 생성 건물', null, null, null, null, null),
    (null, 'images/protoss/pylon.png', '수정탑', 100, 0, 30, '300', '300', '1', '인구수 8 제공, 프로토스 건물의 동력 제공', null, null, null, null, null),
    (null, 'images/protoss/assimilator.png', '융화소', 100, 0, 40, '450', '450', '1', '가스 채취 가능', null, null, null, null, null),
    (null, 'images/protoss/forge.png', '제련소', 150, 0, 40, '550', '550', '1', '지상 유닛 업그레이드', null, null, null, null, null),
    (null, 'images/protoss/cannon.png', '광자포', 150, 0, 50, '100', '100', '0', '공격 건물, 탐지 능력', '20', '20', '7', '7', null),
    (null, 'images/protoss/core.png', '인공제어소', 200, 0, 60, '500', '500', '1', '공중 유닛 업그레이드', null, null, null, null, null),
    (null, 'images/protoss/battery.png', '보호막 충전소', 100, 0, 30, '200', '200', '1', '아군 유닛 보호막 충전', null, null, null, null, 37),
    (null, 'images/protoss/adun.png', '아둔의 성채', 150, 100, 60, '450', '450', '1', '질럿 이동속도 진화 가능', null, null, null, null, null),
    (null, 'images/protoss/roboticsSupportBay.png', '로봇공학 지원소', 150, 100, 30, '450', '450', '1', '로보틱스 유닛 업그레이드', null, null, null, null, null),
    (null, 'images/protoss/beacon.png', '함대 신호소', 300, 200, 60, '500', '500', '1', '공중 유닛 진화', null, null, null, null, null),
    (null, 'images/protoss/archive.png', '기사단 기록보관소', 150, 200, 60, '500', '500', '1', '고위기사 진화', null, null, null, null, null),
    (null, 'images/protoss/observatory.png', '관측소', 50, 100, 30, '250', '250', '1', '로보틱스 유닛 진화', null, null, null, null, null),
    (null, 'images/protoss/tribunal.png', '중재소', 200, 150, 60, '500', '500', '1', '아비터 진화', null, null, null, null, null);
    
INSERT INTO `protossUnit` (`id`, `imagePath`, `name`, `char`, `mineral`, `gas`, `population`, `time`, `health`, `shield`, `armor`, `speed`, `desc`, `groundDamage`, `airDamage`, `groundRange`, `airRange`, `skill_1_ID`, `skill_2_ID`, `skill_3_ID`, `skill_4_ID`, `building_ID`) VALUES 
    (null, 'images/protoss/probe.png', '프로브', '지상, 소형, 기계', 50, 0, 1, 20, '20', '20', '0 (+1)', 2, '자원 채취 가능', '5', null, '1', null, null, null, null, null, 1),
    (null, 'images/protoss/zealot.png', '질럿', '지상, 소형, 생체', 100, 0, 2, 40, '100', '60', '1 (+1)', 3, '프로토스 기본 유닛', '8 (+1) * 2', null, '1', null, null, null, null, null, 2),
    (null, 'images/protoss/dragoon.png', '드라군', '지상, 대형, 기계', 125, 50, 2, 50, '100', '80', '1 (+1)', 2, '폭발형 공격', '20 (+2)', '20 (+2)', '4 (+2)', '4 (+2)', null, null, null, null, 2),
    (null, 'images/protoss/highTemplar.png', '하이템플러', '지상, 소형, 생체', 50, 150, 2, 50, '40', '40', '0 (+1)', 1, '마법 유닛', null, null, null, null, 38, 39, 40, null, 2),
    (null, 'images/protoss/darkTemplar.png', '다크템플러', '지상, 소형, 생체', 125, 100, 2, 50, '80', '40', '1 (+1)', 2, '영구 은신 상태', '40 (+3)', null, '1', null, 41, null, null, null, 2),
    (null, 'images/protoss/archon.png', '아칸', '지상, 대형, 무형', 100, 300, 4, 20, '10', '350', '0 (+1)', 2, '공격시 범위 공격, 생체도 기계도 아님', '30 (+3)', '30 (+3)', '2', '2', null, null, null, null, 2),
    (null, 'images/protoss/darkArchon.png', '다크아칸', '지상, 대형, 무형', 250, 200, 4, 20, '25', '200', '1 (+1)', 2, '마법 사용, 생체도 기계도 아님', null, null, null, null, 42, 43, 44, null, 2),
    (null, 'images/protoss/shuttle.png', '셔틀', '공중, 대형, 기계', 200, 0, 2, 60, '80', '60', '1 (+1)', 3, '수송 유닛', null, null, null, null, 7, null, null, null, 3),
    (null, 'images/protoss/reaver.png', '리버', '지상, 대형, 기계', 200, 100, 4, 70, '100', '80', '0 (+1)', 1, '스캐럽 생산을 통한 공격', '100 (+25)', null, '8', null, 45, null, null, null, 3),
    (null, 'images/protoss/observer.png', '옵저버', '공중, 소형, 기계', 25, 75, 1, 40, '40', '20', '0 (+1)', 2, '영구 은신, 디텍터', null, null, null, null, null, null, null, null, 3),
    (null, 'images/protoss/scout.png', '스카웃', '공중, 대형, 기계', 275, 125, 3, 80, '150', '100', '0 (+1)', 3, '하늘의 왕자', '8 (+1)', '14 (+1) * 2', '4', '4', null, null, null, null, 4),
    (null, 'images/protoss/carrier.png', '캐리어', '공중, 대형, 기계', 350, 250, 6, 140, '300', '150', '4 (+1)', 2, '인터셉터를 통해 공격한다. (인터셉터 최대 8기)', '6 (+1)', '6 (+1)', '8', '8', 46, null, null, null, 4),
    (null, 'images/protoss/arbiter.png', '아비터', '공중, 대형, 기계', 100, 350, 4, 160, '200', '150', '1 (+1)', 3, '주변 유닛을 은신시킨다.', '10 (+1)', '10 (+1)', '5', '5', 47, 48, null, null, 4),
    (null, 'images/protoss/corsair.png', '커세어', '공중, 중형, 기계', 150, 100, 2, 40, '100', '80', '1 (+1)', 3, '범위 공격', null, '5 (+1)', null, '5', 49, null, null, null, 4);

#저그 건물 정보
select DISTINCT zergBuild.name, zergBuild.imagePath, zergBuild.mineral, zergBuild.gas, zergBuild.time, zergBuild.health, zergBuild.armor, (zergBuild.desc) as build_desc, zergBuild.groundDamage, zergBuild.groundRange, zergBuild.airDamage, zergBuild.airRange, (a.name) as skill_1, (a.desc) as skill_1_desc from zergBuild 
LEFT OUTER JOIN skill as a ON zergBuild.skill_1_ID = a.id;

#테란 건물 정보
select DISTINCT terranBuild.name, terranBuild.imagePath, terranBuild.mineral, terranBuild.gas, terranBuild.time, terranBuild.health, terranBuild.armor, (terranBuild.desc) as build_desc, terranBuild.groundDamage, terranBuild.groundRange, terranBuild.airDamage, terranBuild.airRange, (a.name) as skill_1, (a.desc) as skill_1_desc, (b.name) as skill_2, (b.desc) as skill_2_desc from terranBuild 
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranBuild, skill WHERE terranBuild.skill_1_ID = skill.id) as a ON terranBuild.skill_1_ID = a.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranBuild, skill WHERE terranBuild.skill_2_ID = skill.id) as b ON terranBuild.skill_2_ID = b.id;

#프로토스 건물 정보
select DISTINCT protossBuild.name, protossBuild.imagePath, protossBuild.mineral, protossBuild.gas, protossBuild.time, protossBuild.health, protossBuild.shield, protossBuild.armor, (protossBuild.desc) as build_desc, protossBuild.groundDamage, protossBuild.groundRange, protossBuild.airDamage, protossBuild.airRange, (a.name) as skill_1, (a.desc) as skill_1_desc from protossBuild 
LEFT OUTER JOIN skill as a ON protossBuild.skill_1_ID = a.id;

#저그 유닛 정보
select DISTINCT zergUnit.name, zergUnit.imagePath, (zergUnit.char) as `character`, zergUnit.mineral, zergUnit.gas, zergUnit.population, zergUnit.time, zergUnit.health, zergUnit.armor, zergUnit.speed, (zergUnit.desc) as unit_desc, zergUnit.groundDamage, zergUnit.groundRange, zergUnit.airDamage, zergUnit.airRange, (build.name) as build, (a.name) as skill_1, (a.desc) as skill_1_desc, (b.name) as skill_2, (b.desc) as skill_2_desc, (c.name) as skill_3, (c.desc) as skill_3_desc, (d.name) as skill_4, (d.desc) as skill_4_desc from zergUnit 
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from zergUnit, skill WHERE zergUnit.skill_1_ID = skill.id) as a ON zergUnit.skill_1_ID = a.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from zergUnit, skill WHERE zergUnit.skill_2_ID = skill.id) as b ON zergUnit.skill_2_ID = b.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from zergUnit, skill WHERE zergUnit.skill_3_ID = skill.id) as c ON zergUnit.skill_3_ID = c.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from zergUnit, skill WHERE zergUnit.skill_4_ID = skill.id) as d ON zergUnit.skill_4_ID = d.id
LEFT OUTER JOIN protossBuild as build ON zergUnit.building_ID = build.id;

#테란 유닛 정보
select DISTINCT terranUnit.name, terranUnit.imagePath, (terranUnit.char) as `character`, terranUnit.mineral, terranUnit.gas, terranUnit.population, terranUnit.time, terranUnit.health, terranUnit.armor, terranUnit.speed, (terranUnit.desc) as unit_desc, terranUnit.groundDamage, terranUnit.groundRange, terranUnit.airDamage, terranUnit.airRange, (build.name) as build, (a.name) as skill_1, (a.desc) as skill_1_desc, (b.name) as skill_2, (b.desc) as skill_2_desc, (c.name) as skill_3, (c.desc) as skill_3_desc, (d.name) as skill_4, (d.desc) as skill_4_desc from terranUnit 
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranUnit, skill WHERE terranUnit.skill_1_ID = skill.id) as a ON terranUnit.skill_1_ID = a.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranUnit, skill WHERE terranUnit.skill_2_ID = skill.id) as b ON terranUnit.skill_2_ID = b.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranUnit, skill WHERE terranUnit.skill_3_ID = skill.id) as c ON terranUnit.skill_3_ID = c.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranUnit, skill WHERE terranUnit.skill_4_ID = skill.id) as d ON terranUnit.skill_4_ID = d.id
LEFT OUTER JOIN protossBuild as build ON terranUnit.building_ID = build.id;

#프로토스 유닛 정보
select DISTINCT protossUnit.name, protossUnit.imagePath, (protossUnit.char) as `character`, protossUnit.mineral, protossUnit.gas, protossUnit.population, protossUnit.time, protossUnit.health, protossUnit.shield, protossUnit.armor, protossUnit.speed, (protossUnit.desc) as unit_desc, protossUnit.groundDamage, protossUnit.groundRange, protossUnit.airDamage, protossUnit.airRange, (build.name) as build, (a.name) as skill_1, (a.desc) as skill_1_desc, (b.name) as skill_2, (b.desc) as skill_2_desc, (c.name) as skill_3, (c.desc) as skill_3_desc, (d.name) as skill_4, (d.desc) as skill_4_desc from protossUnit 
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from protossUnit, skill WHERE protossUnit.skill_1_ID = skill.id) as a ON protossUnit.skill_1_ID = a.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from protossUnit, skill WHERE protossUnit.skill_2_ID = skill.id) as b ON protossUnit.skill_2_ID = b.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from protossUnit, skill WHERE protossUnit.skill_3_ID = skill.id) as c ON protossUnit.skill_3_ID = c.id
LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from protossUnit, skill WHERE protossUnit.skill_4_ID = skill.id) as d ON protossUnit.skill_4_ID = d.id
LEFT OUTER JOIN protossBuild as build ON protossUnit.building_ID = build.id;