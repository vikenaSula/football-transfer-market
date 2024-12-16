package com.groupproject.footballtransfermarket.services;

import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.Request;
import com.groupproject.footballtransfermarket.models.Team;
import com.groupproject.footballtransfermarket.repositories.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RequestService {
    @Autowired
    private RequestRepository requestRepository;
    @Autowired
    PlayerService playerService;


    public List<Request> playersRequest(Player player){
        return requestRepository.findAllByAnswerIsNullAndSenderIsFalseAndPlayerIs(player);
    }

    public List<Request> playersAnswers(Player player){
        return requestRepository.findAllByAnswerIsNotNullAndSenderIsTrueAndIsSeenIsFalseAndPlayerIs(player);
    }

    public List<Request> teamsRequest(Team team){
        return requestRepository.findAllByAnswerIsNullAndSenderIsTrueAndTeamIs(team);
    }

    public List<Request> teamsAnswers(Team team){
        return requestRepository.findAllByAnswerIsNotNullAndSenderIsFalseAndIsSeenIsFalseAndTeamIs(team);
    }

    public Request update(Request request){
        return  requestRepository.save(request);
    }

    public Request create(Request request){
        return  requestRepository.save(request);
    }

    public void deleteRequest(Long id) {
        requestRepository.deleteById(id);
    }

    public Request findRequest(Long id) {
        return  requestRepository.findById(id).orElse(null);
    }
    public List<Request> getExistingRequestsOfTeam(Team team){
        return  requestRepository.findByTeamIsAndIsSeenIsNull(team);
    }
    public List<Request> getExistingRequestsOfPlayer(Player player){
        return  requestRepository.findByPlayerIsAndIsSeenIsNull(player);
    }

    public void requestAccepting(Request request){
        Player player = request.getPlayer();
        Team team = request.getTeam();
        player.setTeam(team);
        playerService.update(player);
        request.setAnswer(true);
        request.setSeen(false);
        requestRepository.save(request);
        return;
    }

    public void requestDeclining(Request request){
        request.setAnswer(false);
        request.setSeen(false);
        requestRepository.save(request);
        return;
    }

    public void answerRemoving(Request request){
        request.setSeen(true);
        requestRepository.save(request);
        return ;
    }

    public void requestCreating(Player player, Team team, Boolean sender){
        Request request = new Request(player,team,sender);
        requestRepository.save(request);
        return ;
    }

}
