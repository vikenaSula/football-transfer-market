package com.groupproject.footballtransfermarket;

import com.groupproject.footballtransfermarket.services.FilesService;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.Resource;

@SpringBootApplication
public class FootballTransferMarketApplication implements CommandLineRunner {

    @Resource
    FilesService filesService;


    public static void main(String[] args) {
        SpringApplication.run(FootballTransferMarketApplication.class, args);
    }

    @Override
    public void run (String[] args) throws Exception{
        this.filesService.init();
    }

}
