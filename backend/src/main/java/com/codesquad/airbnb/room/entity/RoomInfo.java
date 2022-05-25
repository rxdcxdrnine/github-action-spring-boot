package com.codesquad.airbnb.room.entity;

import com.codesquad.airbnb.room.entity.embeddable.NumberCell;
import com.codesquad.airbnb.room.entity.embeddable.NumberGroup;
import com.codesquad.airbnb.room.entity.embeddable.RoomOption;
import java.time.LocalTime;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class RoomInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_info_id")
    private Integer id;

    private LocalTime checkinTime;
    private LocalTime checkoutTime;

    @Embedded
    private NumberGroup numberGroup;

    @Embedded
    private NumberCell numberCell;

    @Embedded
    private RoomOption option;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id")
    private Room room;

}
