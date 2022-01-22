package nl.rickverkuijlen.relife.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.cloud.storage.Blob;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.jboss.resteasy.annotations.providers.multipart.MultipartForm;

import javax.persistence.*;
import java.io.File;
import java.util.Date;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "submission")
@Table(name = "submission")
public class Submission {

    @Id
    @Column(name = "submission_uuid")
    @Type(type = "uuid-char")
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator"
    )
    public UUID submissionUuid;

    @Column(name = "challenge_uuid")
    @Type(type = "uuid-char")
    public UUID challengeUuid;

    public String userId;

    public String name;

    public String description;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss.SSS")
    public Date date;

    public String location;

    @Column(name = "amount_of_likes")
    public int amountOfLikes;

    @Column(name = "image_url")
    public String imageUrl;

}