package com.groupproject.footballtransfermarket.models;


import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name="owners")
public class Owner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "This field must not be blank!")
    @Size(min=3)
    private String description;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;

    @OneToOne(mappedBy="owner", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private Team team;

    public Owner(Long id, String description, User user, Team team) {
        this.id = id;
        this.description = description;
        this.user = user;
        this.team = team;
    }

    public Owner() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }
}
