package com.sophia.cms.rbac.model;

import com.sophia.cms.rbac.domain.Resources;
import lombok.Data;
import org.assertj.core.util.Lists;

import java.io.Serializable;
import java.util.List;

/**
 * 授权结果
 * Created by ningzuokun on 2017/12/21.
 */
@Data
public class GetMenuModel implements Serializable {

    private List<Resources> resources = Lists.newArrayList();
}
