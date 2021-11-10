package com.example.asm.dao;

import com.example.asm.models.Product;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class ProductDao {
    public static void insert(Product p) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public static void update(Product p) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Product pUpdate = em.find(Product.class, p.getId());
        pUpdate.setName(p.getName());
        pUpdate.setPrice(p.getPrice());
        pUpdate.setQuantity(p.getQuantity());
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public static void delete(int id){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Product pDelete = em.find(Product.class, id);
        if (pDelete != null) {
            em.remove(pDelete);
        }
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public static List<Product> getAll(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        List<Product> products = em.createQuery("select p from Product p").getResultList();
        em.getTransaction().commit();
        em.close();
        emf.close();
        return products;
    }

    public static Product getById(int id){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Product p = em.find(Product.class, id);
        em.getTransaction().commit();
        em.close();
        emf.close();
        return p;
    }
}
