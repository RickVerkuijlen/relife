package nl.rickverkuijlen.relife.repository;

import nl.rickverkuijlen.relife.entity.Challenge;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class ChallengeRepository {

    @Inject
    EntityManager entityManager;

    public List<Challenge> getAllChallengesBySubmitDeadline() {
        List<Challenge> result = new ArrayList<Challenge>();

        result = entityManager.createQuery("SELECT c FROM challenge c WHERE c.submitDeadline >= now()", Challenge.class).getResultList();

        return result;
    }

    public List<Challenge> getAllChallengesByVoteDeadline() {
        List<Challenge> result = new ArrayList<Challenge>();

        result = entityManager.createQuery("SELECT c FROM challenge c WHERE c.voteDeadline >= now()", Challenge.class).getResultList();

        return result;
    }

    public List<Challenge> getAllChallenges() {
        List<Challenge> result = new ArrayList<Challenge>();

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Challenge> cq = cb.createQuery(Challenge.class);
        Root<Challenge> rootEntry = cq.from(Challenge.class);
        CriteriaQuery<Challenge> all = cq.select(rootEntry);

        TypedQuery<Challenge> allQuery = entityManager.createQuery(all);
        return allQuery.getResultList();
    }
}
