package com.library;

import com.library.entity.Book;
import com.library.repository.BookRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
public class LibraryManagementApplicationTests {

    @Autowired
    private BookRepository bookRepository;

    @Test
    public void contextLoads() {
        Book book = new Book("Test Book", "Test Author");
        Book savedBook = bookRepository.save(book);
        assertThat(savedBook).isNotNull();
        assertThat(savedBook.getId()).isGreaterThan(0);
    }
}
