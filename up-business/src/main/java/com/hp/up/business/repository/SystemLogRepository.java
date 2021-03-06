package com.hp.up.business.repository;

import com.hp.up.core.Entity.SystemLog;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author haopeng
 * @Date 2017/9/27 9:47
 */
@Component
public interface SystemLogRepository extends BaseRepository<SystemLog>{

    public List<SystemLog> getSystemLogs(SystemLog systemLog);
}
