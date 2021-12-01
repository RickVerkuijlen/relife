package nl.rickverkuijlen.relife.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Challenge {
    public UUID uuid;
    public String name;
    public int amountOfVotes;
    public int amountOfPictures;
    public Date submitDeadline;
    public Date voteDeadline;
}
