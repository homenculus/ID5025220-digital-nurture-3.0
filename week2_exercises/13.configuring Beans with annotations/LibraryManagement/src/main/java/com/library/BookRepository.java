package com.library.repository;

import org.springframework.stereotype.Repository;

@Repository
public class BookRepository {
    public void addBook(String book) {
        System.out.println("Book added: " + book);
    }
}
