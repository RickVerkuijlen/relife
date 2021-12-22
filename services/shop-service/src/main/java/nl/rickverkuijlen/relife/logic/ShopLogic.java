package nl.rickverkuijlen.relife.logic;

import com.google.api.gax.rpc.AlreadyExistsException;
import nl.rickverkuijlen.relife.entity.Currency;
import nl.rickverkuijlen.relife.repository.ShopRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

@ApplicationScoped
public class ShopLogic {

    @Inject
    ShopRepository shopRepository;

    public Currency addCurrency(Currency currency) {
        return shopRepository.addCurrency(currency);
    }

    public Currency getCurrencyByUserId(String userId) {
        return shopRepository.getCurrencyByUserId(userId);
    }

    public Currency initializeCurrency(Currency currency) {
        if (!shopRepository.doesExist(currency.userId)) {
            return shopRepository.initializeCurrency(currency);
        } else {
            throw new IllegalArgumentException(currency.userId + " already initialized.");
        }
    }
}
