package com.groupproject.footballtransfermarket.services;

import com.groupproject.footballtransfermarket.models.User;
import com.groupproject.footballtransfermarket.repositories.RoleRepository;
import com.groupproject.footballtransfermarket.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private FilesService filesService;

    public User saveUser(User user) {

            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
            user.setRoles(roleRepository.findByName("ROLE_USER"));
            userRepository.save(user);
            return user;
    }

    public User findUser(Long id) {
        return userRepository.findById(id).orElse(null);
    }


    public User update(User user){
        return userRepository.save(user);
    }


    public User update(User user, Long id, MultipartFile file){

        User toBeUpdatedUser=findUser(id);
        toBeUpdatedUser.setFirstName(user.getFirstName());
        toBeUpdatedUser.setLastName(user.getLastName());
        if(! file.isEmpty())
            toBeUpdatedUser.setPhoto(filesService.save(file));

          return userRepository.save(toBeUpdatedUser);
    }



    public User create(User user){
        return userRepository.save(user);
    }

    public User getByEmail(String email){
        return userRepository.findByEmail(email);
    }

    public boolean emailExists(String email) {
        if(userRepository.findByEmail(email) != null){
            return true;
        }
        return false;
    }

}
