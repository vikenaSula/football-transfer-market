package com.groupproject.footballtransfermarket.controllers;

import com.groupproject.footballtransfermarket.models.Owner;
import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.Team;
import com.groupproject.footballtransfermarket.models.User;
import com.groupproject.footballtransfermarket.services.OwnerService;
import com.groupproject.footballtransfermarket.services.PlayerService;
import com.groupproject.footballtransfermarket.services.TeamService;
import com.groupproject.footballtransfermarket.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
public class TeamController {
    @Autowired
    private TeamService teamService;

    @Autowired
    private UserService userService;

    @Autowired
    private PlayerService playerService;

    @Autowired
    private OwnerService ownerService;

    @GetMapping("/ownerDashboard/team/{teamId}")
    public String details(@PathVariable("teamId") Long teamId,Model model,Principal principal){
        Team team = teamService.findTeam(teamId);
        model.addAttribute("team",team);
        model.addAttribute("teamName",team.getName());
        model.addAttribute("players",team.getPlayers());
        model.addAttribute("currentUser",userService.getByEmail(principal.getName()));
        model.addAttribute("isOwner",userService.getByEmail(principal.getName()).getRoles().get(0).getName().contains("ADMIN"));
        model.addAttribute("description",team.getDescription());
        return "teamDetails.jsp";
    }

    @RequestMapping("/ownerDashboard/team/remove/{playerId}")
    public String removePlayer(@PathVariable("playerId") Long playerId,Principal principal) {
        Player player = playerService.findPlayer(playerId);
        User user = userService.getByEmail(principal.getName());
        player.setTeam(null);
        playerService.update(player);
        teamService.updateTeam(user.getOwner().getTeam());
        userService.update(user);

        return "redirect:/ownerDashboard/team/"+user.getOwner().getTeam().getId();
    }

    @GetMapping("/playerDashboard/team/{teamId}")
    public String info(@PathVariable("teamId") Long teamId,Model model,Principal principal){
        Team team = teamService.findTeam(teamId);
        model.addAttribute("team",team);
        model.addAttribute("teamName",team.getName());
        model.addAttribute("players",team.getPlayers());
        model.addAttribute("currentUser",userService.getByEmail(principal.getName()));
        model.addAttribute("isPlayer",userService.getByEmail(principal.getName()).getRoles().get(0).getName().contains("USER"));
        model.addAttribute("description",team.getDescription());
        return "teamDetails.jsp";
    }

    @RequestMapping("/playerDashboard/team/leave/{teamId}")
    public String leaveTeam(@PathVariable("teamId") Long teamId,Principal principal) {
        Team team = teamService.findTeam(teamId);
        User user = userService.getByEmail(principal.getName());
        user.getPlayer().setTeam(null);
        userService.update(user);
        teamService.updateTeam(team);
        return "redirect:/playerDashboard";
    }


}