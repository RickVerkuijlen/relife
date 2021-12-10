package nl.rickverkuijlen.relife.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NewVote {
    public String challengeUuid;
    public int userId;
    public List<String> votedSubmissionUuidList;
}
