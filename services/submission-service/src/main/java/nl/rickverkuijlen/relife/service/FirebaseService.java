package nl.rickverkuijlen.relife.service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.cloud.
import com.google.cloud.storage.Bucket;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.StorageClient;
import io.quarkus.runtime.Startup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Singleton;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Objects;

@Singleton
@Startup
public class FirebaseService {

    private static final String FIREBASE_CONFIG_ENVIRONMENT_NAME = "F:\\Bureaublad\\relife-c09bb-firebase-adminsdk-4ebos-6a20eac57d.json";

    private final Logger logger = LoggerFactory.getLogger(FirebaseService.class);

    public FirebaseService() {
        Objects.requireNonNull(FIREBASE_CONFIG_ENVIRONMENT_NAME,
                FIREBASE_CONFIG_ENVIRONMENT_NAME + " should not be null");

        try {
            FileInputStream serviceAccount = new FileInputStream(FIREBASE_CONFIG_ENVIRONMENT_NAME);
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .setStorageBucket("relife-c09bb.appspot.com")
                    .build();

            FirebaseApp.initializeApp(options);

            Bucket bucket = StorageClient.getInstance().bucket();
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }

}
