package com.library;

import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.library.service.LibraryService;

public class LibraryAppRunnerTest {

    @Test
    public void testApplicationContext() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        LibraryService libraryService = context.getBean(LibraryService.class);
        libraryService.addBook("JUnit Testing in Spring");
    }
}
