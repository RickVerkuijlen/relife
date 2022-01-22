package nl.rickverkuijlen.relife.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Type;

import java.util.List;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NewVote {

    @Type(type = "char-uuid")
    public UUID challengeUuid;
    public String userId;
    public List<String> votedSubmissionUuidList;
}
