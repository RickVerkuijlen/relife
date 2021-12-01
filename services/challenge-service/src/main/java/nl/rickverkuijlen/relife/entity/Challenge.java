package nl.rickverkuijlen.relife.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "challenges")
@Table(name = "challenges")
public class Challenge {

    @Id
    public UUID uuid;

    public String name;

    @Column(name = "amount_of_votes")
    public int amountOfVotes;

    @Column(name = "amount_of_pictures")
    public int amountOfPictures;

    @Column(name = "submit_deadline")
    public Date submitDeadline;

    @Column(name = "vote_deadline")
    public Date voteDeadline;
}
