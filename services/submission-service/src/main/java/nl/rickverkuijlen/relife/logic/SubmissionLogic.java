package nl.rickverkuijlen.relife.logic;

import nl.rickverkuijlen.relife.entity.MultipartBody;
import nl.rickverkuijlen.relife.entity.Submission;
import nl.rickverkuijlen.relife.repository.SubmissionRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class SubmissionLogic {

    @Inject
    SubmissionRepository submissionRepository;

    public Submission submitSubmission(Submission submission) {
        return submissionRepository.submitSubmission(submission);
    }

    public List<Submission> getAllSubmissionsFromChallenge(String challengeUuid) {
        return submissionRepository.getAllSubmissionsFromChallenge(UUID.fromString(challengeUuid));
    }

    public String uploadImage(MultipartBody multipartBody) {
        return this.submissionRepository.uploadImage(multipartBody);
    }
}
