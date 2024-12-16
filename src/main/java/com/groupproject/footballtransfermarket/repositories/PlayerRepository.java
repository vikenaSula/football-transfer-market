package com.groupproject.footballtransfermarket.repositories;

import com.groupproject.footballtransfermarket.models.Owner;
import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.Team;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PlayerRepository extends CrudRepository<Player, Long> {

    List<Player> findAll();

    @Query(value = "SELECT * FROM players WHERE team_id != ?1  OR team_id IS NULL;",nativeQuery = true)
    List<Player> findByTeamNotContains(Long id);
}
