package com.groupproject.footballtransfermarket.controllers;

import com.groupproject.footballtransfermarket.models.*;
import com.groupproject.footballtransfermarket.repositories.PlayerRepository;
import com.groupproject.footballtransfermarket.repositories.RoleRepository;
import com.groupproject.footballtransfermarket.services.PlayerService;
import com.groupproject.footballtransfermarket.services.RequestService;
import com.groupproject.footballtransfermarket.services.TeamService;
import com.groupproject.footballtransfermarket.services.UserService;
import com.groupproject.footballtransfermarket.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MarketController {
    @Autowired
    private UserService userService;

    @Autowired
    RequestService requestService;

    @Autowired
    TeamService teamService;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserValidator userValidator;
    @Autowired
    PlayerService playerService;
    @GetMapping("/ownerMarket")
    public String ownerMarket(Principal principal, Model model) {
        User loggedInUser = userService.getByEmail(principal.getName());
        Team ownersTeam = loggedInUser.getOwner().getTeam();
        model.addAttribute("loggedInUser", loggedInUser);
        model.addAttribute("allRequests",requestService.teamsRequest(ownersTeam));
        model.addAttribute("allAnswers",requestService.teamsAnswers(ownersTeam));
        model.addAttribute("allPlayers",playerService.getMarketPlayers(ownersTeam.getId()));

        //Te gjith playersat te cileve owneri i ka cuar/i kane sjell request
        List<Request> existingReq = requestService.getExistingRequestsOfTeam(ownersTeam);
        ArrayList<Player> playersWithActiveReq = new ArrayList<>();
        if(existingReq != null)
            for (Request r : existingReq) {
                playersWithActiveReq.add(r.getPlayer());
            }
        model.addAttribute("playersWithActiveRequest",playersWithActiveReq);
        return "ownerMarket.jsp";
    }

    @GetMapping ("/playerMarket")
    public String showPlayerMarketInfo(Model model, Principal principal){
        Player player = userService.getByEmail(principal.getName()).getPlayer();
        model.addAttribute("player",player);
        model.addAttribute("requests",requestService.playersRequest(player));
        model.addAttribute("answers",requestService.playersAnswers(player));
        model.addAttribute("teamsAvailable",teamService.getMarketTeams(player));

        //Te gjith teams te cileve playeri i ka cuar/i kane sjell request
        List<Request> existingReq = requestService.getExistingRequestsOfPlayer(player);
        ArrayList<Team>teamsWithActiveReq = new ArrayList<>();
        if(existingReq != null)
            for (Request r : existingReq) {
                teamsWithActiveReq.add(r.getTeam());
            }
        model.addAttribute("teamsWithActiveRequest",teamsWithActiveReq);
        return "playerMarket.jsp";
    }


    @GetMapping("/accept/{id}")
    public String requestAccepting(@PathVariable("id")Long requestId,
                                   Model model,
                                   Principal principal)
    {
        User loggedInUser = userService.getByEmail(principal.getName());
        requestService.requestAccepting(requestService.findRequest(requestId));
        if(loggedInUser.getOwner()!=null)
            return "redirect:/ownerMarket";
        return "redirect:/playerMarket";

    }

    @GetMapping("/decline/{id}")
    public String requestDeclining(@PathVariable("id")Long requestId,
                                   Model model,
                                   Principal principal)
    {
        User loggedInUser = userService.getByEmail(principal.getName());
        requestService.requestDeclining(requestService.findRequest(requestId));
        if(loggedInUser.getOwner()!=null)
            return "redirect:/ownerMarket";
        return "redirect:/playerMarket";
    }

    @GetMapping("/removeAnswer/{id}")
    public String removeAnswer(@PathVariable("id")Long requestId,
                               Principal principal){
        User loggedInUser = userService.getByEmail(principal.getName());
        requestService.answerRemoving(requestService.findRequest(requestId));
        if(loggedInUser.getOwner()!=null)
            return "redirect:/ownerMarket";
        return "redirect:/playerMarket";
    }
    @GetMapping("/sendRequest/{id}")
    public String sendRequest(@PathVariable("id")Long id,
                              Principal principal) {
        User loggedInUser = userService.getByEmail(principal.getName());
        Boolean sender;
        Player player;
        Team team;
        if (loggedInUser.getOwner() != null)
        {
            team = loggedInUser.getOwner().getTeam();
            player = playerService.findPlayer(id);
            sender = false;
        }
        else{
            player = loggedInUser.getPlayer();
            team = teamService.findTeam(id);
            sender = true;
        }

        requestService.requestCreating(player,team,sender);
        if(loggedInUser.getOwner()!=null)
            return "redirect:/ownerMarket";
        return "redirect:/playerMarket";
    }

}