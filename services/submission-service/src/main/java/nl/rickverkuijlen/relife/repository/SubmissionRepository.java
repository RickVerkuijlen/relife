package nl.rickverkuijlen.relife.repository;

import nl.rickverkuijlen.relife.entity.Submission;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class SubmissionRepository {

    @Inject
    EntityManager entityManager;

    @Transactional
    public void submitSubmission(Submission submission) {
        entityManager.persist(submission);
    }

    public List<Submission> getAllSubmissionsFromChallenge(UUID uuid) {
        Query query = entityManager.createQuery("SELECT s FROM submission s WHERE s.challengeUuid = :uuid", Submission.class);
        query.setParameter("uuid", uuid);
        return (List<Submission>)query.getResultList();
    }
}
