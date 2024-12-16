package com.groupproject.footballtransfermarket.controllers;

import com.groupproject.footballtransfermarket.models.MyModel;
import com.groupproject.footballtransfermarket.models.MyModel1;
import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.User;
import com.groupproject.footballtransfermarket.repositories.RoleRepository;
import com.groupproject.footballtransfermarket.services.OwnerService;
import com.groupproject.footballtransfermarket.services.PlayerService;
import com.groupproject.footballtransfermarket.services.UserService;
import com.groupproject.footballtransfermarket.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class DetailsAndEditController {
    @Autowired
    private UserService userService;

    @Autowired
    private PlayerService playerService;
    @Autowired
    private OwnerService ownerService;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserValidator userValidator;



    @RequestMapping("/ownerDashboard")
    public String adminPage(Principal principal, Model model) {
        String email = principal.getName();
        model.addAttribute("loggedInUser", userService.getByEmail(email));
        return "owner.jsp";
    }

    @GetMapping("/playerDashboard")
    public String playerDashboard(Principal principal, Model model) {
        String email = principal.getName();
        model.addAttribute("loggedInUser", userService.getByEmail(email));

        return "player.jsp";
    }



    @GetMapping("/editPlayer/{id}")
    public String editPlayer(Model model,Principal principal){
        String email = principal.getName();
        User loggedInUser = userService.getByEmail(email);

        MyModel myModel=new MyModel(loggedInUser.getPlayer(),loggedInUser);

        model.addAttribute("myModel", myModel);

        return "editPlayer.jsp";

    }

    @PutMapping("/updatePlayer/{id}")
    public String updatePlayer(@Valid @ModelAttribute("myModel") MyModel myModel, BindingResult result,@PathVariable("id") Long id,Principal principal,@RequestParam("file") MultipartFile file){

        if (result.hasErrors()) {
            return "editPlayer.jsp";
        }

        userService.update(myModel.getUser(),id,file);
        playerService.update(myModel.getPlayer(),userService.findUser(id).getPlayer().getId());

        return "redirect:/playerDashboard";
    }
    
}
