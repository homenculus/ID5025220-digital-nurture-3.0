package com.library;

import com.library.service.LibraryService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryAppRunner {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        LibraryService libraryService = (LibraryService) context.getBean("libraryService");
        libraryService.addBook("Effective Java");
    }
}
