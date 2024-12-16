package com.groupproject.footballtransfermarket.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="teams")
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message="Team name must not be blank")
    @Size(min=5, message="Must be greater than 5 characters")
    private String name;

    @NotEmpty(message="Must not be blank")
    private String photo;

    @NotEmpty(message="Description must not be blank")
    @Size(min=8, message="Must be greater than 8 characters")
    private String description;

    @NotNull
    private Integer year;

    @Column(updatable=false)

    @DateTimeFormat(pattern="MM/dd/yyyy hh")
    private Date createdAt;

    @DateTimeFormat(pattern="MM/dd/yyyy hh")
    private Date updatedAt;

    @Column(updatable=false)
    @OneToMany(mappedBy="team", fetch=FetchType.LAZY)
    private List<Request> requests;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="owner_id")
    // Owner of the team
    private Owner owner;


    @OneToMany(mappedBy="team", fetch=FetchType.LAZY)
    private List<Player> players;

    public Team(){
    }

    public Team(String name, String photo, String description, Integer year, Owner owner) {
        this.name = name;
        this.photo = photo;
        this.description = description;
        this.year = year;
        this.owner = owner;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
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

    public List<Request> getRequests() {
        return requests;
    }

    public void setRequests(List<Request> requests) {
        this.requests = requests;
    }

    public Owner getOwner() {
        return owner;
    }

    public void setOwner(Owner owner) {
        this.owner = owner;
    }

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    public List<Player> getPlayers() {
        return players;
    }

    public void setPlayers(List<Player> players) {
        this.players = players;
    }
}
