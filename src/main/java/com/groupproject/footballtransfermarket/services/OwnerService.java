package com.groupproject.footballtransfermarket.services;


import com.groupproject.footballtransfermarket.models.Owner;
import com.groupproject.footballtransfermarket.repositories.OwnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OwnerService {

    @Autowired
    private OwnerRepository ownerRepository;
    public List<Owner> allOwners(){
        return ownerRepository.findAll();
    }

    public Owner updateOwner(Owner owner){
        return ownerRepository.save(owner);
    }

    public Owner findOwner(Long id) {
        return  ownerRepository.findById(id).orElse(null);
    }

}
