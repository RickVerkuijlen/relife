package nl.rickverkuijlen.relife.resources;

import nl.rickverkuijlen.relife.entity.NewVote;
import nl.rickverkuijlen.relife.entity.Vote;
import nl.rickverkuijlen.relife.logic.VoteLogic;
import org.jboss.logging.Logger;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Path("/vote")
public class VoteResource {

    @Inject
    VoteLogic voteLogic;

    @Inject
    Logger logger;

    @POST()
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response submitVote(NewVote vote) throws Exception {
        logger.info("submitVote: " + vote);
        return Response
                .status(Response.Status.CREATED)
                .entity(voteLogic.submitVote(vote))
                .type(MediaType.APPLICATION_JSON)
                .build();


//        try {
//
//        } catch(Exception e) {
//            return errorMessage(e);
//        }
    }

    private Response errorMessage(Exception e) {
        return Response
                .status(Response.Status.BAD_REQUEST)
                .entity(e.getMessage())
                .type(MediaType.TEXT_PLAIN)
                .build();
    }
}