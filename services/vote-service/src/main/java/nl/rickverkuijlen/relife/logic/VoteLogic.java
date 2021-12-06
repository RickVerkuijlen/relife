package nl.rickverkuijlen.relife.logic;

import nl.rickverkuijlen.relife.entity.Vote;
import nl.rickverkuijlen.relife.repository.VoteRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class VoteLogic {

    @Inject
    VoteRepository voteRepository;

    public Vote submitVote(Vote vote) {
        return vote;
    }
}
