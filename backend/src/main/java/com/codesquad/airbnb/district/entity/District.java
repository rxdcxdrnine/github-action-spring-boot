package com.codesquad.airbnb.district.entity;

import com.codesquad.airbnb.room.entity.Room;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class District {

    enum DistrictType {GU, CITY, COUNTRY}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "district_id")
    private Integer id;

    private String name;

    @Enumerated(value = EnumType.STRING)
    private DistrictType type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    private District parent;

    @OneToMany(mappedBy = "parent")
    private List<District> children;

    @OneToMany(mappedBy = "district")
    private List<Room> rooms;

}
