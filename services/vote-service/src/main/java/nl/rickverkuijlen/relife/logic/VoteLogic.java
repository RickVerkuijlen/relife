package nl.rickverkuijlen.relife.logic;

import nl.rickverkuijlen.relife.entity.NewVote;
import nl.rickverkuijlen.relife.entity.Vote;
import nl.rickverkuijlen.relife.repository.VoteRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class VoteLogic {

    @Inject
    VoteRepository voteRepository;

    public NewVote submitVote(NewVote vote) {

        for (String submission : vote.votedSubmissionUuidList) {
            voteRepository.submitVote(
                    Vote.builder()
                            .userId(vote.userId)
                            .submissionUuid(UUID.fromString(submission))
                            .build()
            );
        }

        return vote;
    }
}
