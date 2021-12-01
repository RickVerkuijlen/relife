package nl.rickverkuijlen.relife.logic;

import nl.rickverkuijlen.relife.entity.Challenge;
import nl.rickverkuijlen.relife.repository.ChallengeRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class ChallengeLogic {

    @Inject
    ChallengeRepository challengeRepository;

    public List<Challenge> getAllChallengesByType(String deadlineType) throws ParseException {
        List<Challenge> result = new ArrayList<>();

        if(deadlineType == null) {
            deadlineType = "";
        }

        switch(deadlineType) {
            case "submit":
                result = this.challengeRepository.getAllChallengesBySubmitDeadline();
                break;
            case "vote":
                result = this.challengeRepository.getAllChallengesByVoteDeadline();
                break;
            default:
                result = this.challengeRepository.getAllChallenges();
                break;
        }
        return result;
    }
}
