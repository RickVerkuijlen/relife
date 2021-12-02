package nl.rickverkuijlen.relife.repository;

import nl.rickverkuijlen.relife.entity.Challenge;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class ChallengeRepository {

    @Inject
    EntityManager entityManager;

    public List<Challenge> getAllChallengesBySubmitDeadline() {
        List<Challenge> result = new ArrayList<Challenge>();

        result = entityManager.createQuery("SELECT c FROM challenges c WHERE c.submitDeadline >= now()", Challenge.class).getResultList();

        return result;
    }

    public List<Challenge> getAllChallengesByVoteDeadline() {
        List<Challenge> result = new ArrayList<Challenge>();

        result = entityManager.createQuery("SELECT c FROM challenges c WHERE c.voteDeadline >= now()", Challenge.class).getResultList();

        return result;
    }

    public List<Challenge> getAllChallenges() {
        List<Challenge> result = new ArrayList<Challenge>();

        result = entityManager.createQuery("SELECT c FROM challenges c", Challenge.class).getResultList();

        return result;
    }
}
