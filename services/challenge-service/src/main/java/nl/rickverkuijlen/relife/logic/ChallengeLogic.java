package nl.rickverkuijlen.relife.logic;

import nl.rickverkuijlen.relife.entity.Challenge;

import javax.enterprise.context.ApplicationScoped;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class ChallengeLogic {

    public List<Challenge> getAllChallenges() throws ParseException {
        DateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String dateString = "19-07-2021";
        List<Challenge> result = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            result.add(Challenge.builder()
                    .uuid(UUID.randomUUID())
                    .name("TestEvent " + i)
                    .amountOfPictures(105 + i)
                    .amountOfVotes(111 + i)
                    .submitDeadline(sdf.parse(dateString))
                    .voteDeadline(new Date())
                    .build());
        }
        return result;
    }
}
