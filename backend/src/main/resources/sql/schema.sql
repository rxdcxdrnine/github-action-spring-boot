SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS member;

CREATE TABLE member
(
    member_id     INT         NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'member 테이블의 기본 키',
    name          VARCHAR(39) NOT NULL COMMENT '멤버의 이름',
    role          VARCHAR(10) NOT NULL COMMENT '멤버의 구분 (ADMIN/USER)',
    profile_image VARCHAR(1000) COMMENT '멤버의 프로필 이미지 파일 경로',
    is_superhost  BOOL COMMENT '멤버가 슈퍼 호스트인지 여부'
);

DROP TABLE IF EXISTS district;

CREATE TABLE district
(
    district_id INT         NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'district 테이블의 기본 키',
    parent_id   INT COMMENT '상위 district 엔티티의 기본 키',
    name        VARCHAR(39) NOT NULL COMMENT '행정 구역의 이름',
    type        VARCHAR(10) NOT NULL COMMENT '행정 구역의 구분 (GU/CITY/COUNTRY)'
);


DROP TABLE IF EXISTS room;

CREATE TABLE room
(
    room_id             INT          NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'room 테이블의 기본 키',
    district_id         INT          NOT NULL COMMENT 'district 테이블의 외래 키',
    host_id             INT          NOT NULL COMMENT 'member 테이블의 외래 키',
    name                VARCHAR(255) NOT NULL COMMENT '숙소의 이름',
    description         VARCHAR(1000) COMMENT '숙소에 대한 소개',
    longitude           DOUBLE       NOT NULL COMMENT '좌표계에서 숙소의 경도',
    latitude            DOUBLE       NOT NULL COMMENT '좌표계에서 숙소의 위도',
    lodging_charge      DOUBLE       NOT NULL COMMENT '숙소의 숙박 요금',
    cleaning_charge     DOUBLE       NOT NULL COMMENT '숙소의 청소 요금',
    review_score_lookup DOUBLE COMMENT '숙소의 리뷰 평균 점수 집계',
    review_count_lookup DOUBLE COMMENT '숙소의 리뷰 개수 집계',
    FOREIGN KEY (district_id) REFERENCES district (district_id),
    FOREIGN KEY (host_id) REFERENCES member (member_id)
);

DROP TABLE IF EXISTS room_info;

CREATE TABLE room_info
(
    room_info_id      INT  NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'room_info 테이블의 키',
    room_id           INT  NOT NULL COMMENT 'room 테이블의 외래 키',
    number_guest      INT  NOT NULL COMMENT '숙박 가능한 게스트의 수',
    number_infant     INT  NOT NULL COMMENT '숙박 가능한 영유아의 수',
    number_bed        INT COMMENT '숙소 내 침대 개수',
    number_bathroom   INT COMMENT '숙소 내 욕실 개수',
    checkin_time      TIME NOT NULL COMMENT '체크인 시간',
    checkout_time     TIME NOT NULL COMMENT '체크아웃 시간',
    hair_dryer        BOOL COMMENT '숙소 내 헤어드라이기 여무',
    wireless_internet BOOL COMMENT '숙소 내 무선 인터넷 지원 유무',
    air_conditioner   BOOL COMMENT '숙소 내 에어컨 유무',
    FOREIGN KEY (room_id) REFERENCES room (room_id)
);

DROP TABLE IF EXISTS room_image;

CREATE TABLE room_image
(
    room_image_id INT           NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'room_image 테이블의 기본 키',
    room_id       INT           NOT NULL COMMENT 'room 테이블의 외래 키',
    path          VARCHAR(1000) NOT NULL COMMENT '숙소 이미지 경로',
    sequence      INT           NOT NULL COMMENT '숙소 별 이미지의 순서',
    FOREIGN KEY (room_id) REFERENCES room (room_id)
);

DROP TABLE IF EXISTS review;

CREATE TABLE review
(
    review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'review 테이블의 기본 키',
    room_id   INT COMMENT 'room 테이블의 외래 키',
    score     DOUBLE COMMENT '숙소에 대한 평점',
    content   VARCHAR(1000) COMMENT '숙소에 대한 평가 문구',
    FOREIGN KEY (room_id) REFERENCES room (room_id)
);

DROP TABLE IF EXISTS reservation;

CREATE TABLE reservation
(
    reservation_id INT       NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'reservation 테이블의 기본 키',
    guest_id       INT       NOT NULL COMMENT 'member 테이블의 외래 키',
    room_id        INT       NOT NULL COMMENT 'room 테이블의 외래 키',
    number_guest   INT       NOT NULL COMMENT '예약 시 게스트 인원',
    number_infant  INT       NOT NULL COMMENT '예약 시 영유아 인원',
    start_date     TIMESTAMP NOT NULL COMMENT '숙박 시작 날짜 및 시간',
    end_date       TIMESTAMP NOT NULL COMMENT '숙박 종료 날짜 및 시간',
    charge         DOUBLE    NOT NULL COMMENT '예약 시 총 금액'
);

SET FOREIGN_KEY_CHECKS = 1;
