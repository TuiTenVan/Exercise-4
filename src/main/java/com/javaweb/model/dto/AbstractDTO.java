package com.javaweb.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@MappedSuperclass
public class AbstractDTO<T> implements Serializable {
    private static final long serialVersionUID = 7213600440729202783L;
    private Long id;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss.SSS")
    private Date createdDate;
    private String createdBy;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss.SSS")
    private Date modifiedDate;
    private String modifiedBy;
    private int maxPageItems = 4;
    private int page = 1;
    private List<T> listResult = new ArrayList<>();
    private int totalItems = 0;
    private String tableId = "tableList";
    private Integer limit;
    private Integer totalPage;
    private Integer totalItem;
    private String searchValue;
    public int getTotalPages() {
        return (int) Math.ceil((double) this.getTotalItems() / this.getMaxPageItems());
    }
}
