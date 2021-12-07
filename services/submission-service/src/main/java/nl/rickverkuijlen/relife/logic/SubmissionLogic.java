package nl.rickverkuijlen.relife.logic;

import nl.rickverkuijlen.relife.entity.Submission;
import nl.rickverkuijlen.relife.repository.SubmissionRepository;
import nl.rickverkuijlen.relife.service.FirebaseService;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class SubmissionLogic {

    @Inject
    SubmissionRepository submissionRepository;

//    @Inject
//    FirebaseService firebaseService;

    public Submission submitSubmission(Submission submission) throws IOException {
//        this.firebaseService = new FirebaseService();
        return submission;
    }

    public List<Submission> getAllSubmissionsFromChallenge(String challengeUuid) {
        return submissionRepository.getAllSubmissionsFromChallenge(UUID.fromString(challengeUuid));
    }
}
