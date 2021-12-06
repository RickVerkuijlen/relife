package nl.rickverkuijlen.relife.repository;

import nl.rickverkuijlen.relife.entity.Vote;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;

@ApplicationScoped
public class VoteRepository {

    @Inject
    EntityManager entityManager;

    @Transactional
    public void submitVote(Vote vote) {
        entityManager.persist(vote);
    }
}
