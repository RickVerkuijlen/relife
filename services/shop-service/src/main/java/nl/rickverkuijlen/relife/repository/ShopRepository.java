package nl.rickverkuijlen.relife.repository;

import nl.rickverkuijlen.relife.entity.Currency;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;

@ApplicationScoped
public class ShopRepository {

    @Inject
    EntityManager entityManager;

    public Currency addCurrency(Currency currency) throws Exception {
        Currency old = entityManager.find(Currency.class, currency.id);
        old.setAmount(currency.amount);
        entityManager.getTransaction().commit();
//        if (success > 0) {
//
//        } else {
//            throw new Exception("Something went wrong");
//        }
        return old;
    }

    public Currency getCurrencyByUserId(String userId) {
        Currency currency = (Currency) entityManager.createQuery("SELECT c FROM currency c WHERE c.userId = :userId")
                .setParameter("userId", userId).getSingleResult();
        if (currency == null) {
            throw new EntityNotFoundException("Can't find currency for ID " + userId);
        }
        return currency;
    }

    public Currency initializeCurrency(Currency currency) {
        entityManager.persist(currency);
        return currency;
    }

    public boolean doesExist(String userId) {
        return entityManager.contains(userId);
    }
}
