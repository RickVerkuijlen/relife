package nl.rickverkuijlen.relife.repository;

import com.google.api.gax.paging.Page;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import nl.rickverkuijlen.relife.entity.MultipartBody;
import nl.rickverkuijlen.relife.entity.Submission;
import nl.rickverkuijlen.relife.service.FirebaseService;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class SubmissionRepository {

    @Inject
    EntityManager entityManager;

    @Inject
    FirebaseService firebaseService;

    @Transactional
    public Submission submitSubmission(Submission submission) {
        entityManager.persist(submission);
        return submission;
    }

    public List<Submission> getAllSubmissionsFromChallenge(UUID uuid) {
        Query query = entityManager.createQuery("SELECT s FROM submission s WHERE s.challengeUuid = :uuid", Submission.class);
        query.setParameter("uuid", uuid);
        return (List<Submission>)query.getResultList();
    }

    public Blob getImageByUrl(String imageUrl) {
        Bucket bucket = this.firebaseService.getBucket();

        return bucket.get(imageUrl);
    }

    public List<Blob> listAllSubmissions() {
        Bucket bucket = this.firebaseService.getBucket();
        List<Blob> result = new ArrayList<>();

        Page<Blob> blobs = bucket.list();
        for (Blob blob : blobs.iterateAll()) {
            result.add(blob);
        }

        return result;

    }

    public String uploadImage(MultipartBody multipartBody) {
        Blob blob = firebaseService.getBucket().create(multipartBody.fileName, multipartBody.data, "image/jpeg");
        return blob.getSelfLink();
    }
}
