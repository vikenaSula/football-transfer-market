package com.groupproject.footballtransfermarket.services;


import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.Team;
import com.groupproject.footballtransfermarket.repositories.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TeamService {
    @Autowired
    private TeamRepository teamRepository;

    public List<Team> allTeams(){
        return teamRepository.findAll();
    }

    public Team updateTeam(Team team) {
        return teamRepository.save(team);
    }

    public Team createTeam(Team team){
        return teamRepository.save(team);
    }

    public Team findTeam(Long id) {
        return teamRepository.findTeamById(id);
    }

    public List<Team> getMarketTeams(Player player){
        return teamRepository.findAllByPlayersNotContains(player);
    }
}
