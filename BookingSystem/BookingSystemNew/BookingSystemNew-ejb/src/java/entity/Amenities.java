/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author hemalpatel
 */
@Entity
@Table(name = "amenities")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Amenities.findAll", query = "SELECT a FROM Amenities a"),
    @NamedQuery(name = "Amenities.findById", query = "SELECT a FROM Amenities a WHERE a.id = :id"),
    @NamedQuery(name = "Amenities.findByDescription", query = "SELECT a FROM Amenities a WHERE a.description = :description")})
public class Amenities implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "description")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "amenitiesId")
    private Collection<RoomAmenities> roomAmenitiesCollection;

    public Amenities() {
    }

    public Amenities(Integer id) {
        this.id = id;
    }

    public Amenities(Integer id, String description) {
        this.id = id;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<RoomAmenities> getRoomAmenitiesCollection() {
        return roomAmenitiesCollection;
    }

    public void setRoomAmenitiesCollection(Collection<RoomAmenities> roomAmenitiesCollection) {
        this.roomAmenitiesCollection = roomAmenitiesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Amenities)) {
            return false;
        }
        Amenities other = (Amenities) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Amenities[ id=" + id + " ]";
    }
    
}
