package com.groupproject.footballtransfermarket.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="players")
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "This field must not be blank!")
    @Pattern(regexp = "^[A-Za-z]{2}$",message = "Must be only two characters")
    private String position;


    @NotBlank(message = "This field must not be blank!")
    @Pattern(regexp = "^(?:[0-9]{2}\\s[A-Z]{3}\\s){5}[0-9]{2}\\s[A-Z]{3}$",message = "Input Format: (nn ccc nn ccc nn ccc nn ccc nn ccc nn ccc)  n-number c-character"  )
    private String skills;

    @Past
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dob;

    @NotNull(message = "This field must not be blank!")
    private Integer marketValue;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;


    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="team_id")
    private Team team;

    @Column(updatable=false)
    @OneToMany(mappedBy="team", fetch=FetchType.LAZY)
    private List<Request> requests;


    public Player(Long id, String position, String skills, Date dob, Integer marketValue, User user, Team team) {
        this.id = id;
        this.position = position;
        this.skills = skills;
        this.dob = dob;
        this.marketValue = marketValue;
        this.user = user;
        this.team = team;
    }

    public Player() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Integer getMarketValue() {
        return marketValue;
    }

    public void setMarketValue(Integer marketValue) {
        this.marketValue = marketValue;
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
