package com.codesquad.airbnb.room.entity.embeddable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Lookup {

    @Column(name = "review_score_lookup")
    private Double reviewScore;

    @Column(name = "review_count_lookup")
    private Double reviewCount;

}
