package com.groupproject.footballtransfermarket.models;

import javax.validation.Valid;

public class MyModel1 {
    @Valid
    private Owner owner;
    @Valid
    private User user;

    public MyModel1(Owner owner, User user) {
        this.owner = owner;
        this.user = user;
    }


    public Owner getOwner() {
        return owner;
    }

    public void setOwner(Owner owner) {
        this.owner = owner;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
