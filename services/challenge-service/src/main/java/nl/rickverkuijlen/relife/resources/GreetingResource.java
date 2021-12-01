package nl.rickverkuijlen.relife.resources;

import nl.rickverkuijlen.relife.entity.Challenge;
import nl.rickverkuijlen.relife.logic.ChallengeLogic;
import org.jboss.logging.Logger;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/challenge")
public class GreetingResource {

    @Inject
    ChallengeLogic challengeLogic;

    @Inject
    Logger logger;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllChallenges() {
        logger.info("GetAllChallenges");

        try {
            List<Challenge> result = this.challengeLogic.getAllChallenges();
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