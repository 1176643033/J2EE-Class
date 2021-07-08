package com.chieh.service.impl;

import com.chieh.dao.FileDao;
import com.chieh.domain.UploadFile;
import com.chieh.service.FileService;
import com.chieh.utils.GetFileUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FileServiceImpl implements FileService {

    @Resource
    private FileDao fileDao;

    @Override
    public boolean uploadFile(UploadFile uploadFile) {
        if(fileDao.insertUploadFile(uploadFile) > 0){
            return true;
        }
        return false;
    }

    @Override
    public List<UploadFile> selectFiles() {
        List<UploadFile> files = GetFileUtil.getFile("C:\\J2EEForUpload");
        return files;
    }
}
