package com.groupproject.footballtransfermarket.repositories;


import com.groupproject.footballtransfermarket.models.Owner;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OwnerRepository extends CrudRepository<Owner, Long> {
    List<Owner> findAll();

}
