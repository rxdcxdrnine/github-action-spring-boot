package com.codesquad.airbnb.room.entity.embeddable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Charge {

    @Column(name = "lodging_charge")
    private Double lodging;

    @Column(name = "cleaning_charge")
    private Double cleaning;

}
