package com.groupproject.footballtransfermarket.services;

import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.Team;
import com.groupproject.footballtransfermarket.repositories.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PlayerService {

    @Autowired
    private PlayerRepository playerRepository;

    public List<Player> allPlayers(){
        return playerRepository.findAll();
    }



    public Player update(Player player){
        return  playerRepository.save(player);
    }

    public Player update(Player player,Long id){

        Player toBeUpdatedPlayer=findPlayer(id);
        toBeUpdatedPlayer.setPosition(player.getPosition());
        toBeUpdatedPlayer.setSkills(player.getSkills());
        toBeUpdatedPlayer.setMarketValue(player.getMarketValue());

        return  playerRepository.save(toBeUpdatedPlayer);
    }

    public Player createPlayer(Player player){
        return  playerRepository.save(player);
    }

    public void deletePlayer(Long id) {
        playerRepository.deleteById(id);
    }

    public Player findPlayer(Long id) {
        return  playerRepository.findById(id).orElse(null);
    }

    public List<Player> getMarketPlayers(Long id){
        return playerRepository.findByTeamNotContains(id);
    }

}
