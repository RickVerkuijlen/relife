package nl.rickverkuijlen.relife.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Type;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "vote")
public class Vote implements Serializable {

    @Id
    @Column(name = "user_id")
    public String userId;

    @Id
    @Column(name = "submission_uuid")
    @Type(type = "uuid-char")
    public UUID submissionUuid;

}
