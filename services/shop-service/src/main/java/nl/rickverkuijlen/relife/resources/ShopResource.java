package nl.rickverkuijlen.relife.resources;

import nl.rickverkuijlen.relife.entity.Currency;
import nl.rickverkuijlen.relife.logic.ShopLogic;
import org.jboss.logging.Logger;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;

@Path("/shop")
public class ShopResource {

    @Inject
    ShopLogic shopLogic;

    @Inject
    Logger logger;

    @PUT()
    @Path("/currency/add")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response addCurrency(Currency currency) {
        logger.info("Adding " + currency.amount + " coins to userId " + currency.userId);

        return Response.ok()
                .entity(shopLogic.addCurrency(currency))
                .type(MediaType.APPLICATION_JSON_TYPE)
                .build();

//        try {
//
//        } catch (Exception e) {
//            return errorMessage(e);
//        }
    }

    @GET
    @Path("/currency/{userId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCurrencyByUserId(@PathParam("userId") String userId) {
        logger.info("getCurrencyByUserId: " + userId);

        try {
            return Response.ok()
                    .entity(shopLogic.getCurrencyByUserId(userId))
                    .type(MediaType.APPLICATION_JSON_TYPE)
                    .build();
        } catch (Exception e) {
            return errorMessage(e);
        }
    }

    @POST
    @Path("/currency")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response initializeCurrency(Currency currency) {
        logger.info(currency.userId + " logged in for the first time");

        return Response.accepted()
                .entity(shopLogic.initializeCurrency(currency))
                .type(MediaType.APPLICATION_JSON_TYPE)
                .build();

//        try {
//            return Response.accepted()
//                    .entity(shopLogic.initializeCurrency(currency))
//                    .type(MediaType.APPLICATION_JSON_TYPE)
//                    .build();
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