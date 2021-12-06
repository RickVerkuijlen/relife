package nl.rickverkuijlen.relife.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Vote {

    public UUID challengeUuid;
    public int userId;
    public List<UUID> submissionUuidList;

}
