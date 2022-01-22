package nl.rickverkuijlen.relife.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "currency")
@Table(name = "currency")
public class Currency {

    @Id
    public int id;

    @Column(name = "user_id")
    public String userId;

    public double amount;

}
