package nl.rickverkuijlen.relife.logic;

import nl.rickverkuijlen.relife.entity.NewVote;
import nl.rickverkuijlen.relife.entity.Vote;
import nl.rickverkuijlen.relife.repository.VoteRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityExistsException;
import java.util.UUID;

@ApplicationScoped
public class VoteLogic {

    @Inject
    VoteRepository voteRepository;

    public NewVote submitVote(NewVote vote) throws Exception {
        for (String submission : vote.votedSubmissionUuidList) {
            Vote submittedVote = Vote.builder()
                    .userId(vote.userId)
                    .submissionUuid(UUID.fromString(submission))
                    .build();
            try {
                voteRepository.submitVote(
                        submittedVote
                );
            } catch (EntityExistsException e) {
                throw new Exception("User " + submittedVote.userId + " already voted on submission " + submittedVote.submissionUuid);
            }
        }
    return vote;
    }
}
