/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author hemalpatel
 */
@Entity
@Table(name = "room_amenities")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RoomAmenities.findAll", query = "SELECT r FROM RoomAmenities r"),
    @NamedQuery(name = "RoomAmenities.findById", query = "SELECT r FROM RoomAmenities r WHERE r.id = :id")})
public class RoomAmenities implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "room_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Room roomId;
    @JoinColumn(name = "amenities_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Amenities amenitiesId;

    public RoomAmenities() {
    }

    public RoomAmenities(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Room getRoomId() {
        return roomId;
    }

    public void setRoomId(Room roomId) {
        this.roomId = roomId;
    }

    public Amenities getAmenitiesId() {
        return amenitiesId;
    }

    public void setAmenitiesId(Amenities amenitiesId) {
        this.amenitiesId = amenitiesId;
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
        if (!(object instanceof RoomAmenities)) {
            return false;
        }
        RoomAmenities other = (RoomAmenities) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.RoomAmenities[ id=" + id + " ]";
    }
    
}
