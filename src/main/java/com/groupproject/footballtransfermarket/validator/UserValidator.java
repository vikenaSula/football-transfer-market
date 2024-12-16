package com.groupproject.footballtransfermarket.validator;

import com.groupproject.footballtransfermarket.models.User;
import com.groupproject.footballtransfermarket.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {

    @Autowired
    private UserService userService;



    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        ValidationUtils.rejectIfEmpty(errors, "user.firstName", "Empty", "No first name present");
        ValidationUtils.rejectIfEmpty(errors, "user.lastName", "Empty", "No last name present");
        ValidationUtils.rejectIfEmpty(errors, "user.email", "Empty", "No email present");
        ValidationUtils.rejectIfEmpty(errors, "user.password", "Empty", "No password present");
        ValidationUtils.rejectIfEmpty(errors, "user.passwordConfirmation", "Empty", "No password confirmation present");
        if (userService.emailExists(user.getEmail())) {
            errors.rejectValue("user.email", "Exists", "Email already exists");
        }
        if(!user.getEmail().matches("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$")) {
            errors.rejectValue("user.email", "Invalid", "Email not valid");
        }
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("user.passwordConfirmation", "Match", "Passwords must match");
        }
    }


    /*
    Validate for email edit if needed
     */

//    public void validateForEmail(Object object, Errors errors,String email) {
//        User user = (User) object;
//        if (userService.emailExists(user.getEmail()) && !user.getEmail().equals(email)) {
//            errors.rejectValue("user.email", "Exists", "Email already exists");
//        }
//    }


}