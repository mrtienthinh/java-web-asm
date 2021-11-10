package com.example.asm.dao;

import com.example.asm.models.Category;
import com.example.asm.models.Product;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class CategoryDao {
    public static void insert(Category p) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public static void update(Category p) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Category pUpdate = em.find(Category.class, p.getId());
        pUpdate.setName(p.getName());
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public static void delete(int id){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Category pDelete = em.find(Category.class, id);
        if (pDelete != null) {
            em.remove(pDelete);
        }
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public static List<Category> getAll(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        List<Category> categories = em.createQuery("select p from Category p").getResultList();
        em.getTransaction().commit();
        em.close();
        emf.close();
        return categories;
    }

    public static Category getById(int id){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default_asm");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Category category = em.find(Category.class, id);
        em.getTransaction().commit();
        em.close();
        emf.close();
        return category;
    }
}
