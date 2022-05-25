package com.codesquad.airbnb.room.entity.embeddable;

import javax.persistence.Embeddable;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@Embeddable
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class RoomOption {

    private Boolean hairDryer;
    private Boolean wirelessInternet;
    private Boolean airConditioner;

}
