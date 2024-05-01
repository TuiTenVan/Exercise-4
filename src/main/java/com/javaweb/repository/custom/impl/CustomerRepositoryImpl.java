package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Map;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    private void joinTable(Map<String, String> conditions, StringBuilder sql) {
        String staffId = conditions.get("staffId");
        if(staffId != null && !staffId.isEmpty()) {
            sql.append(" JOIN assignmentcustomer ass ON c.id = ass.customerid ");
            sql.append(" JOIN user u ON ass.staffid = u.id ");
        }
    }
    public static void queryNormal(StringBuilder sql, Map<String, String> conditions) {
        try {
            for (Map.Entry<String, String> entry : conditions.entrySet()) {
                String fieldName = entry.getKey();
                String value = entry.getValue();
                if ("fullName".equals(fieldName) || "email".equals(fieldName) || "phone".equals(fieldName)) {
                    if (value != null && !value.isEmpty()) {
                        sql.append("AND c.").append(fieldName).append(" LIKE '%").append(value).append("%' ");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void querySpecial(StringBuilder sql, Map<String, String> conditions) {
        String staffId = conditions.get("staffId");
        if (staffId != null && !staffId.isEmpty()) {
            sql.append("AND u.id" + " = " + staffId + " ");
        }
    }
    @Override
    public List<CustomerEntity> findCustomer(Map<String, String> conditions) {
        StringBuilder sql = new StringBuilder("SELECT c.* FROM customer c ");
        joinTable(conditions, sql);
        sql.append("WHERE 1 = 1 AND c.is_Active = 1 ");
        queryNormal(sql, conditions);
        querySpecial(sql, conditions);
        sql.append(" GROUP BY c.id");
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }
}
