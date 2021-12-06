package nl.rickverkuijlen.relife.repository;

import nl.rickverkuijlen.relife.entity.Vote;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class VoteRepository {

    @Inject
    EntityManager entityManager;

    public Vote submitVote(Vote vote) {
        return vote;
    }
}
