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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author hemalpatel
 */
@Entity
@Table(name = "card_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CardDetails.findAll", query = "SELECT c FROM CardDetails c"),
    @NamedQuery(name = "CardDetails.findById", query = "SELECT c FROM CardDetails c WHERE c.id = :id"),
    @NamedQuery(name = "CardDetails.findByNameOnCard", query = "SELECT c FROM CardDetails c WHERE c.nameOnCard = :nameOnCard"),
    @NamedQuery(name = "CardDetails.findByCardNumber", query = "SELECT c FROM CardDetails c WHERE c.cardNumber = :cardNumber")})
public class CardDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name_on_card")
    private String nameOnCard;
    @Basic(optional = false)
    @Column(name = "card_number")
    private String cardNumber;
    @JoinColumn(name = "customer_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Customer customerId;
    @JoinColumn(name = "card_type_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private CardType cardTypeId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cardDetailsId")
    private Collection<Payment> paymentCollection;

    public CardDetails() {
    }

    public CardDetails(Integer id) {
        this.id = id;
    }

    public CardDetails(Integer id, String nameOnCard, String cardNumber) {
        this.id = id;
        this.nameOnCard = nameOnCard;
        this.cardNumber = cardNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameOnCard() {
        return nameOnCard;
    }

    public void setNameOnCard(String nameOnCard) {
        this.nameOnCard = nameOnCard;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public CardType getCardTypeId() {
        return cardTypeId;
    }

    public void setCardTypeId(CardType cardTypeId) {
        this.cardTypeId = cardTypeId;
    }

    @XmlTransient
    public Collection<Payment> getPaymentCollection() {
        return paymentCollection;
    }

    public void setPaymentCollection(Collection<Payment> paymentCollection) {
        this.paymentCollection = paymentCollection;
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
        if (!(object instanceof CardDetails)) {
            return false;
        }
        CardDetails other = (CardDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.CardDetails[ id=" + id + " ]";
    }
    
}
