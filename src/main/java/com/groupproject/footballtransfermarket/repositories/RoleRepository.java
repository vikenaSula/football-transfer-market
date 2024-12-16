package com.groupproject.footballtransfermarket.repositories;

import com.groupproject.footballtransfermarket.models.Role;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RoleRepository extends CrudRepository<Role,Long> {
    List<Role> findAll();

    List<Role> findByName(String role);
}
