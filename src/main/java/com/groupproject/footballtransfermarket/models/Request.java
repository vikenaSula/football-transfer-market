package com.groupproject.footballtransfermarket.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "requests")
public class Request {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    private Boolean answer; //null if there is no answer, true if the its approved , false if its declined


    @NotNull
    private Boolean sender; //true if the sender is a player, false if its a owner

    private Boolean isSeen; //true if the user saw the request, false otherwise

    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;


    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="player_id")
    private Player player;

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="team_id")
    private Team team;



    public Request() {
    }

    public Request(Long id, Boolean answer, Boolean sender, Boolean isSeen, Date createdAt, Date updatedAt, Player player, Team team) {
        this.id = id;
        this.answer = answer;
        this.sender = sender;
        this.isSeen = isSeen;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.player = player;
        this.team = team;
    }

    //Konstruktori qe do perdoret kur te inicializohet nje request
    public Request(Player player, Team team, Boolean sender){
        this.player = player;
        this.team = team;
        this.isSeen = null;
        this.answer = null;
        this.sender = sender;
    }

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getAnswer() {
        return answer;
    }

    public void setAnswer(Boolean answer) {
        this.answer = answer;
    }


    public Boolean getSender() {
        return sender;
    }

    public void setSender(Boolean sender) {
        this.sender = sender;
    }

    public Boolean getSeen() {
        return isSeen;
    }

    public void setSeen(Boolean seen) {
        isSeen = seen;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }
}
