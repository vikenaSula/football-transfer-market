package com.groupproject.footballtransfermarket.repositories;

import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.Request;
import com.groupproject.footballtransfermarket.models.Team;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RequestRepository extends CrudRepository<Request,Long> {

    //Case1.Requests for Player
    List<Request> findAllByAnswerIsNullAndSenderIsFalseAndPlayerIs(Player player);
    //Case2.Answers for Player
    List<Request> findAllByAnswerIsNotNullAndSenderIsTrueAndIsSeenIsFalseAndPlayerIs(Player player);


    //Case3.Requests for Team
    List<Request> findAllByAnswerIsNullAndSenderIsTrueAndTeamIs(Team team);
    //Case4.Answers for Team
    List<Request> findAllByAnswerIsNotNullAndSenderIsFalseAndIsSeenIsFalseAndTeamIs(Team team);

    //Requestet ekzistuese midis nje playeri dhe nje owneri
    List<Request> findByTeamIsAndIsSeenIsNull(Team team);
    List<Request> findByPlayerIsAndIsSeenIsNull(Player player);


}
