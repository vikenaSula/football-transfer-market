package com.groupproject.footballtransfermarket.repositories;


import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.Team;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeamRepository extends CrudRepository<Team,Long> {
    List<Team> findAll();

    Team findTeamById(Long id);
    List<Team> findAllByPlayersNotContains(Player player);
}

