package com.chieh.service;

import com.chieh.domain.UploadFile;

import java.util.List;

public interface FileService {
    boolean uploadFile(UploadFile uploadFile);
    List<UploadFile> selectFiles();
}
