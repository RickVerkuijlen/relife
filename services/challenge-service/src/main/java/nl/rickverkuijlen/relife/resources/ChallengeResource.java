package nl.rickverkuijlen.relife.resources;

import nl.rickverkuijlen.relife.entity.Challenge;
import nl.rickverkuijlen.relife.logic.ChallengeLogic;
import org.jboss.logging.Logger;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/challenge")
public class ChallengeResource {

    @Inject
    ChallengeLogic challengeLogic;

    @Inject
    Logger logger;

    @GET()
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllChallenges(@QueryParam("deadlineType") String deadlineType) {
        logger.info("GetAllChallenges");
        System.out.println(deadlineType);

        try {
            List<Challenge> result = this.challengeLogic.getAllChallengesByType(deadlineType);
            return Response
                    .status(Response.Status.OK)
                    .entity(result)
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