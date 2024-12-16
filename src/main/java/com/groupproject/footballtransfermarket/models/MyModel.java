package com.groupproject.footballtransfermarket.models;

import javax.validation.Valid;

public class MyModel {

    @Valid
    private Player player;
    @Valid
    private User user;

    public MyModel() {
    }

    public MyModel(Player player, User user) {
        this.player = player;
        this.user = user;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
