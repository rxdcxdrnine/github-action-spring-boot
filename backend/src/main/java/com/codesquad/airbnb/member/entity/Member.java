package com.codesquad.airbnb.member.entity;

import com.codesquad.airbnb.room.entity.Room;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Member {

    enum MemberRole {ADMIN, USER}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_id")
    private Integer id;

    private String name;
    private String profileImage;
    private Boolean isSuperhost;

    @Enumerated(value = EnumType.STRING)
    private MemberRole role;

    @OneToMany(mappedBy = "host")
    private List<Room> hostRooms;

}
