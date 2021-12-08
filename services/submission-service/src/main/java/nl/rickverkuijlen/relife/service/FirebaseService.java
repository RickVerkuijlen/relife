package nl.rickverkuijlen.relife.service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Bucket;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.StorageClient;
import io.quarkus.runtime.Startup;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.imageio.ImageIO;
import javax.inject.Singleton;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Objects;

@Singleton
public class FirebaseService {

    private final String FIREBASE_CONFIG_ENVIRONMENT_NAME = getClass().getResource("/firebase.json").toString();

    private final Logger logger = LoggerFactory.getLogger(FirebaseService.class);


    @Getter
    @Setter(AccessLevel.NONE)
    public Bucket bucket;

    public FirebaseService() throws IOException {

        Objects.requireNonNull(FIREBASE_CONFIG_ENVIRONMENT_NAME,
                FIREBASE_CONFIG_ENVIRONMENT_NAME + " should not be null");

        try {
            FileInputStream serviceAccount = new FileInputStream(FIREBASE_CONFIG_ENVIRONMENT_NAME);
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .setStorageBucket("relife-c09bb.appspot.com")
                    .build();

            FirebaseApp.initializeApp(options);

            this.bucket = StorageClient.getInstance().bucket();
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }

}
