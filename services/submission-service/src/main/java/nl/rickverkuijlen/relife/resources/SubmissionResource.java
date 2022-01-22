package nl.rickverkuijlen.relife.resources;

import nl.rickverkuijlen.relife.entity.MultipartBody;
import nl.rickverkuijlen.relife.entity.Submission;
import nl.rickverkuijlen.relife.logic.SubmissionLogic;
import org.jboss.logging.Logger;
import org.jboss.resteasy.annotations.providers.multipart.MultipartForm;

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
    @Path("/upload/data")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response submitSubmission(Submission submission) throws IOException {
        System.out.println(submission);
        return Response.accepted()
                .entity(submissionLogic.submitSubmission(submission))
                .type(MediaType.APPLICATION_JSON_TYPE)
                .build();
    }

    @POST()
    @Path("/upload")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    public Response uploadImage(@MultipartForm MultipartBody file) {

        logger.info(file.fileName);


        try {
            return Response
                    .accepted()
                    .entity(submissionLogic.uploadImage(file))
                    .type(MediaType.APPLICATION_JSON_TYPE)
                    .build();
        } catch (Exception e) {
            return errorMessage(e);
        }
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