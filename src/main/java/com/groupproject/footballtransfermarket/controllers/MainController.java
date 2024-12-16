package com.groupproject.footballtransfermarket.controllers;

import com.groupproject.footballtransfermarket.models.MyModel;
import com.groupproject.footballtransfermarket.models.Player;
import com.groupproject.footballtransfermarket.models.Role;
import com.groupproject.footballtransfermarket.models.User;
import com.groupproject.footballtransfermarket.repositories.RoleRepository;
import com.groupproject.footballtransfermarket.services.FilesService;
import com.groupproject.footballtransfermarket.services.PlayerService;
import com.groupproject.footballtransfermarket.services.UserService;
import com.groupproject.footballtransfermarket.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.security.Principal;

@Controller
public class MainController {

    @Autowired
    private UserService userService;


    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private PlayerService playerService;

    @Autowired
    private FilesService filesService;


    @RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("myModel") MyModel myModel) {
        return "registrationPage.jsp";
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout, Model model) {
        if (error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if (logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage.jsp";
    }

    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("myModel") MyModel myModel, BindingResult result, Model model,HttpSession session,HttpServletRequest request,@RequestParam("file")MultipartFile file) {

        userValidator.validate(myModel.getUser(), result);
        if (result.hasErrors()) {
            return "registrationPage.jsp";
        }

        myModel.getUser().setPhoto(filesService.save(file));
        userService.saveUser(myModel.getUser());
        myModel.getPlayer().setUser(myModel.getUser());
        playerService.createPlayer(myModel.getPlayer());

        authWithHttpServletRequest(request, myModel.getUser().getEmail(), myModel.getUser().getPasswordConfirmation());

        return "redirect:/home";
    }

    public void authWithHttpServletRequest(HttpServletRequest request, String email, String password) {
        try {
            request.login(email, password);
        } catch (ServletException e) {
            System.out.println("Error while login: " + e);
        }
    }



    @RequestMapping({"/", "/home"})
    public String home(Principal principal) {
        String email = principal.getName();

        for (Role role : userService.getByEmail(email).getRoles()) {
            if (role.getName().equals("ROLE_ADMIN"))
                return "redirect:/ownerDashboard";
        }

        return "redirect:/playerDashboard";
    }



    @GetMapping("uploads/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> getFile(@PathVariable String filename){
        Resource file=filesService.load(filename);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\"" + file.getFilename()+"\"").body(file);
    }




}
