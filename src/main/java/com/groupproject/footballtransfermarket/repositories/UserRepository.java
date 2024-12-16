package com.groupproject.footballtransfermarket.repositories;

import com.groupproject.footballtransfermarket.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

public interface UserRepository extends CrudRepository<User,Long> {
    User findByEmail(String email);
    User findUserById(Long id);


}
