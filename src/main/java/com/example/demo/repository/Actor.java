package com.example.demo.repository;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "actor")
@Getter
@Setter
@ToString
public class Actor {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name", nullable = false)
    private String name;
    @Column(name = "height")
    private Integer height;
    @Column(name = "blood")
    private String blood;
    @Temporal(TemporalType.DATE)
    @Column(name = "birthday")
    private Date birthday;
    @Column(name = "birthplace_id")
    private Integer birthplaceId;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "update_at")
    private Date updateAt;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "birthplace_id", insertable = false, updatable = false)
    private Prefecture pref;


}