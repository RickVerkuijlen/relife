package nl.rickverkuijlen.relife.resources;

import nl.rickverkuijlen.relife.entity.Submission;
import nl.rickverkuijlen.relife.logic.SubmissionLogic;
import nl.rickverkuijlen.relife.service.FirebaseService;
import org.jboss.logging.Logger;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;

@Path("/submission")
public class SubmissionResource {

    @Inject
    SubmissionLogic submissionLogic;

    @Inject
    Logger logger;

    @POST()
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public void submitSubmission(Submission submission) throws IOException {
        submissionLogic.submitSubmission(submission);
    }

    @GET()
    @Path("/{challengeUuid}")
    public Response getAllSubmissionsFromChallenge(@PathParam("challengeUuid") String challengeUuid) {
        logger.info("getAllSubmissionsFromChallenge: " + challengeUuid);

        try {
            return Response
                    .ok()
                    .entity(submissionLogic.getAllSubmissionsFromChallenge(challengeUuid))
                    .type(MediaType.APPLICATION_JSON_TYPE)
                    .build();
        } catch (Exception e) {
            return errorMessage(e);
        }
    }

    private Response errorMessage(Exception e) {
        return Response
                .status(Response.Status.BAD_REQUEST)
                .entity(e.getMessage())
                .type(MediaType.TEXT_PLAIN)
                .build();
    }
}