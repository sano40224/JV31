package model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Order;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
/**
 * DAO(Data Access Object):データベースへのアクセスを行うクラスを作り、そのクラスを通してデータベースへアクセスするデザインパターン
 * 
 */
public class ShainDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("IH13A09_JV31_29_06_PU");
    
    public List<Shain> findWithCriteria(String name, String gender, String sortColumn, String sortOrder) {
        EntityManager em = emf.createEntityManager();
        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Shain> cq = cb.createQuery(Shain.class);
            Root<Shain> root = cq.from(Shain.class);

            // WHERE句の条件を格納するリスト
            List<Predicate> predicates = new ArrayList<>();

            // 氏名での絞り込み条件 (nameがnullや空文字でなければ条件追加)
            if (name != null && !name.trim().isEmpty()) {
                predicates.add(cb.like(root.get("name"), "%" + name + "%"));
            }

            // 性別での絞り込み条件 (genderがnullや空文字でなければ条件追加)
            if (gender != null && !gender.trim().isEmpty()) {
                predicates.add(cb.equal(root.get("gender"), gender));
            }

            // 条件リストに中身があればWHERE句を設定
            if (!predicates.isEmpty()) {
                cq.where(predicates.toArray(new Predicate[0]));
            }

            // ソート順の指定 (sortColumnがnullや空文字でなければORDER BY句を追加)
            if (sortColumn != null && !sortColumn.trim().isEmpty()) {
                Order order;
                // sortOrderが "desc" なら降順、それ以外は昇順
                if ("desc".equalsIgnoreCase(sortOrder)) {
                    order = cb.desc(root.get(sortColumn));
                } else {
                    order = cb.asc(root.get(sortColumn));
                }
                cq.orderBy(order);
            }
            
            if (sortColumn != null && !sortColumn.trim().isEmpty()) {
                Order order;
                if ("desc".equalsIgnoreCase(sortOrder)) {
                    // 降順の場合
                    order = cb.desc(root.get(sortColumn));
                } else {
                    // 昇順の場合 (デフォルト)
                    order = cb.asc(root.get(sortColumn));
                }
                cq.orderBy(order);
            }

            TypedQuery<Shain> query = em.createQuery(cq);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    /**
     * 全件検索
     * @return 社員データ
     */
    public List<Shain> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT s FROM Shain s", Shain.class).getResultList();
            
        } finally {
            em.close();
        }
    }
    public Shain findById(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Shain.class, id);
        } finally {
            em.close();
        }
    }

    public void insert(Shain shain) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(shain);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }
    
    public void update(Shain shain) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(shain);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public void delete(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Shain shain = em.find(Shain.class, id);
            if (shain != null) {
                em.remove(shain);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}
